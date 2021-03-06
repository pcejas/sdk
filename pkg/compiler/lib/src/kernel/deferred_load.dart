// Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library kernel.deferred_load_data;

import 'package:kernel/ast.dart' as ir;

import '../common_elements.dart';
import '../compiler.dart' show Compiler;
import '../constants/values.dart' show ConstantValue;
import '../deferred_load.dart';
import '../elements/entities.dart';
import 'element_map.dart';

class KernelDeferredLoadTask extends DeferredLoadTask {
  KernelToElementMap _elementMap;
  Map<ir.Library, Set<ir.NamedNode>> _additionalExportsSets =
      <ir.Library, Set<ir.NamedNode>>{};

  KernelDeferredLoadTask(Compiler compiler, this._elementMap) : super(compiler);

  Iterable<ImportEntity> _findImportsTo(ir.NamedNode node, String nodeName,
      ir.Library enclosingLibrary, LibraryEntity library) {
    List<ImportEntity> imports = [];
    ir.Library source = _elementMap.getLibraryNode(library);
    for (ir.LibraryDependency dependency in source.dependencies) {
      if (dependency.isExport) continue;
      if (!_isVisible(dependency.combinators, nodeName)) continue;
      if (enclosingLibrary == dependency.targetLibrary ||
          additionalExports(dependency.targetLibrary).contains(node)) {
        imports.add(_elementMap.getImport(dependency));
      }
    }
    return imports;
  }

  @override
  Iterable<ImportEntity> classImportsTo(
      ClassEntity element, LibraryEntity library) {
    ir.Class node = _elementMap.getClassNode(element);
    return _findImportsTo(node, node.name, node.enclosingLibrary, library);
  }

  @override
  Iterable<ImportEntity> typedefImportsTo(
      TypedefEntity element, LibraryEntity library) {
    ir.Typedef node = _elementMap.getTypedefNode(element);
    return _findImportsTo(node, node.name, node.enclosingLibrary, library);
  }

  @override
  Iterable<ImportEntity> memberImportsTo(
      Entity element, LibraryEntity library) {
    ir.Member node = _elementMap.getMemberNode(element);
    return _findImportsTo(node, node.name.name, node.enclosingLibrary, library);
  }

  @override
  void checkForDeferredErrorCases(LibraryEntity library) {
    // Nothing to do. The FE checks for error cases upfront.
  }

  @override
  void collectConstantsFromMetadata(
      Entity element, Set<ConstantValue> constants) {
    // Nothing to do. Kernel-pipeline doesn't support mirrors, so we don't need
    // to track any constants from meta-data.
  }

  @override
  void collectConstantsInBody(MemberEntity element, Dependencies dependencies) {
    ir.Member node = _elementMap.getMemberNode(element);

    // Fetch the internal node in order to skip annotations on the member.
    // TODO(sigmund): replace this pattern when the kernel-ast provides a better
    // way to skip annotations (issue 31565).
    var visitor = new ConstantCollector(_elementMap, dependencies);
    if (node is ir.Field) {
      node.initializer?.accept(visitor);
      return;
    }

    if (node is ir.Constructor) {
      node.initializers.forEach((i) => i.accept(visitor));
    }
    node.function?.accept(visitor);
  }

  /// Adds extra dependencies coming from mirror usage.
  @override
  void addDeferredMirrorElements(WorkQueue queue) {
    throw new UnsupportedError(
        "KernelDeferredLoadTask.addDeferredMirrorElements");
  }

  /// Add extra dependencies coming from mirror usage in [root] marking it with
  /// [newSet].
  @override
  void addMirrorElementsForLibrary(
      WorkQueue queue, LibraryEntity root, ImportSet newSet) {
    throw new UnsupportedError(
        "KernelDeferredLoadTask.addMirrorElementsForLibrary");
  }

  Set<ir.NamedNode> additionalExports(ir.Library library) {
    return _additionalExportsSets[library] ??= new Set<ir.NamedNode>.from(
        library.additionalExports.map((ir.Reference ref) => ref.node));
  }

  @override
  void cleanup() {
    _additionalExportsSets = null;
  }
}

/// Returns whether [name] would be visible according to the given list of
/// show/hide [combinators].
bool _isVisible(List<ir.Combinator> combinators, String name) {
  for (var c in combinators) {
    if (c.isShow && !c.names.contains(name)) return false;
    if (c.isHide && c.names.contains(name)) return false;
  }
  return true;
}

class ConstantCollector extends ir.RecursiveVisitor {
  final KernelToElementMap elementMap;
  final Dependencies dependencies;

  ConstantCollector(this.elementMap, this.dependencies);

  CommonElements get commonElements => elementMap.commonElements;

  void add(ir.Expression node, {bool required: true}) {
    ConstantValue constant =
        elementMap.getConstantValue(node, requireConstant: required);
    if (constant != null) {
      dependencies.constants.add(constant);
    }
  }

  @override
  void visitIntLiteral(ir.IntLiteral literal) {}

  @override
  void visitDoubleLiteral(ir.DoubleLiteral literal) {}

  @override
  void visitBoolLiteral(ir.BoolLiteral literal) {}

  @override
  void visitStringLiteral(ir.StringLiteral literal) {}

  @override
  void visitSymbolLiteral(ir.SymbolLiteral literal) => add(literal);

  @override
  void visitNullLiteral(ir.NullLiteral literal) {}

  @override
  void visitListLiteral(ir.ListLiteral literal) {
    if (literal.isConst) {
      add(literal);
    } else {
      super.visitListLiteral(literal);
    }
  }

  @override
  void visitMapLiteral(ir.MapLiteral literal) {
    if (literal.isConst) {
      add(literal);
    } else {
      super.visitMapLiteral(literal);
    }
  }

  @override
  void visitConstructorInvocation(ir.ConstructorInvocation node) {
    if (node.isConst) {
      add(node);
    } else {
      super.visitConstructorInvocation(node);
    }
  }

  @override
  void visitTypeLiteral(ir.TypeLiteral node) {
    if (node.type is! ir.TypeParameterType) add(node);
  }

  @override
  void visitInstantiation(ir.Instantiation node) {
    // TODO(johnniwinther): The CFE should mark constant instantiations as
    // constant.
    add(node, required: false);
  }
}
