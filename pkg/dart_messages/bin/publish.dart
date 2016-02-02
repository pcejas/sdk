// Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:convert';
import 'dart:io';

import '../lib/shared_messages.dart';

const String jsonPath = '../lib/generated/shared_messages.json';
const String dart2jsPath =
    '../../compiler/lib/src/diagnostics/generated/shared_messages.dart';
const String analyzerPath =
    '../../analyzer/lib/src/generated/generated/shared_messages.dart';

final String dontEditWarning = """
/*
DON'T EDIT. GENERATED. DON'T EDIT.
This file has been generated by 'publish.dart' in the dart_messages package.

Messages are maintained in `lib/shared_messages.dart` of that same package.
After any change to that file, run `bin/publish.dart` to generate a new version
of the json, dart2js and analyzer representations.
*/""";

const String copyrightHeader = '''
// Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.''';

void markAsReadonly(String path) {
  // TODO(15078): mark as read-only. Currently not possible:
  // http://dartbug.com/15078.
}

void emitJson() {
  var input = MESSAGES;
  var outPath = Platform.script.resolve(jsonPath).toFilePath();
  print("Emitting JSON:");
  print("  Input: ${input.length} entries");
  print("  Output: $outPath");
  new File(outPath).writeAsStringSync(messagesAsJson);
  print("Emitting JSON done.");
}

/// Escapes the given string [str].
///
/// The parameter [str] may be `null` in which case the result is "null".
String escapeString(String str) {
  return JSON.encode(str);
}

/// Emits the messages in dart2js format.
///
/// The dart2js-format consists of two entities:
///   1. the `MessageKind` enum, and
///   2. the MessageKind-to-Template map `TEMPLATES`.
///
/// The template is an instance of MessageTemplate:
///
///     const MessageTemplate(
///        this.kind,
///        this.template,
///        {this.howToFix,
///         this.examples,
///         this.options: const <String>[]});
///
/// A sample output thus looks as follows:
///
///     enum MessageKind {
///       EXAMPLE_MESSAGE,
///     }
///
///     const Map<MessageKind, MessageTemplate> {
///       EXAMPLE_MESSAGE: const MessageTemplate(
///         EXAMPLE_MESSAGE,
///         "Don't use #foo with #bar",
///         howToFix: "Just don't do it",
///         options: const ['--some-flag']),
///         examples: const ['''
///     some example with bad code;'''],
///     };
void emitDart2js() {
  var input = MESSAGES;
  var outPath = Platform.script.resolve(dart2jsPath).toFilePath();
  print("Emitting dart2js:");
  print("  Input: ${input.length} entries");
  print("  Output: $outPath");

  var enumIds = input.keys.toList();

  StringBuffer out = new StringBuffer();
  out.writeln(copyrightHeader);
  out.writeln(dontEditWarning);
  out.writeln("import '../messages.dart' show MessageTemplate;");
  out.writeln();
  out.write(("enum SharedMessageKind {\n  "));
  // We generate on one line on purpose, so that users are less likely to
  // modify the generated file.
  out.writeln(enumIds.join(",\n  "));
  out.writeln("}");
  out.writeln();
  out.writeln("const Map<SharedMessageKind, MessageTemplate> TEMPLATES = "
      "const <SharedMessageKind, MessageTemplate>{ ");
  input.forEach((name, message) {
    out.writeln("  SharedMessageKind.$name: const MessageTemplate(");
    // TODO(floitsch): include id.
    out.writeln("    SharedMessageKind.$name,");
    out.write("    ");
    out.write(escapeString(message.template));
    if (message.howToFix != null) {
      out.write(",\n    howToFix: ${escapeString(message.howToFix)}");
    }
    if (message.options != null) {
      out.write(",\n    options: const [");
      out.write(message.options.map(escapeString).join(","));
      out.writeln("]");
    }
    if (message.examples != null) {
      out.writeln(",\n    examples: const [");
      for (var example in message.examples) {
        if (example is String) {
          out.writeln("      r'''");
          out.write(example);
          out.write("'''");
        } else if (example is Map) {
          out.writeln("      const {");
          example.forEach((String fileName, String content) {
            out.writeln("      '$fileName': r'''");
            out.write(content);
            out.writeln("''',");
          });
          out.write("      }");
        }
        out.writeln(",");
      }
      out.writeln("    ]");
    }
    out.writeln("  ),  // Generated. Don't edit.");
  });
  out.writeln("};");

  new File(outPath).writeAsStringSync(out.toString());
  print("Emitting dart2js done.");
}

String convertToAnalyzerTemplate(String template, holeOrder) {
  var holeMap;
  if (holeOrder != null) {
    holeMap = {};
    for (int i = 0; i < holeOrder.length; i++) {
      holeMap[holeOrder[i]] = i;
    }
  }
  int seenHoles = 0;
  return template.replaceAllMapped(new RegExp(r"#\w+"), (Match match) {
    if (holeMap != null) {
      String holeName = match[0].substring(1);
      int index = holeMap[holeName];
      if (index == null) {
        throw "Couldn't find hole-position for $holeName $holeMap";
      }
      return "{$index}";
    } else {
      return "{${seenHoles++}}";
    }
  });
}

/// Emits the messages in analyzer format.
///
/// Messages are encoded as instances of `ErrorCode` classes where the
/// corresponding class is given by the `category` field of the Message.
///
/// All instances are stored as top-level const variables.
///
/// A sample output looks as follows:
///
///     const FooCategoryErrorCode EXAMPLE_MESSAGE = const FooCategoryErrorCode(
///         "EXAMPLE_MESSAGE",
///         "Don't use {0} with {1}",
///         "Just don't do it");
void emitAnalyzer() {
  var input = MESSAGES;
  var outPath = Platform.script.resolve(analyzerPath).toFilePath();
  print("Emitting analyzer:");
  print("  Input: ${input.length} entries");
  print("  Output: $outPath");

  StringBuffer out = new StringBuffer();
  out.writeln(copyrightHeader);
  out.writeln(dontEditWarning);
  out.writeln("import 'package:analyzer/src/generated/error.dart';");
  out.writeln();
  input.forEach((name, message) {
    Category category = message.category;
    String className = category.name + "Code";
    out.writeln("const $className $name = const $className(");
    out.writeln("    '$name',");

    String template = message.template;
    List holeOrder = message.templateHoleOrder;
    String analyzerTemplate = convertToAnalyzerTemplate(template, holeOrder);
    out.write("    ");
    out.write(escapeString(analyzerTemplate));
    out.write(",\n    ");
    out.write(escapeString(message.howToFix));
    out.writeln(");  // Generated. Don't edit.");
  });

  new File(outPath).writeAsStringSync(out.toString());
  print("Emitting analyzer done.");
}

/// Translates the shared messages in `../lib/shared_messages.dart` to JSON,
/// dart2js, and analyzer formats.
///
/// Emits the json-output to [jsonPath], the dart2js-output to [dart2jsPath],
/// and the analyzer-output to [analyzerPath].
void main() {
  emitJson();
  emitDart2js();
  emitAnalyzer();
}
