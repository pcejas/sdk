//
// THIS FILE IS GENERATED. DO NOT EDIT.
//
// Instead modify 'pkg/front_end/messages.yaml' and run
// 'dart pkg/analyzer/tool/messages/generate.dart' to update.

part of 'syntactic_errors.dart';

final fastaAnalyzerErrorCodes = <ErrorCode>[
  null,
  _EQUALITY_CANNOT_BE_EQUALITY_OPERAND,
  _CONTINUE_OUTSIDE_OF_LOOP,
  _EXTERNAL_CLASS,
  _STATIC_CONSTRUCTOR,
  _EXTERNAL_ENUM,
  _PREFIX_AFTER_COMBINATOR,
  _TYPEDEF_IN_CLASS,
  _COVARIANT_AFTER_VAR,
  _INVALID_AWAIT_IN_FOR,
  _IMPORT_DIRECTIVE_AFTER_PART_DIRECTIVE,
  _WITH_BEFORE_EXTENDS,
  _VAR_RETURN_TYPE,
  _TYPE_ARGUMENTS_ON_TYPE_VARIABLE,
  _TOP_LEVEL_OPERATOR,
  _SWITCH_HAS_MULTIPLE_DEFAULT_CASES,
  _SWITCH_HAS_CASE_AFTER_DEFAULT_CASE,
  _STATIC_OPERATOR,
  _STATIC_AFTER_VAR,
  _STATIC_AFTER_FINAL,
  _STATIC_AFTER_CONST,
  _REDIRECTION_IN_NON_FACTORY_CONSTRUCTOR,
  _REDIRECTING_CONSTRUCTOR_WITH_BODY,
  _NATIVE_CLAUSE_SHOULD_BE_ANNOTATION,
  _MULTIPLE_WITH_CLAUSES,
  _MULTIPLE_PART_OF_DIRECTIVES,
  _MULTIPLE_ON_CLAUSES,
  _MULTIPLE_LIBRARY_DIRECTIVES,
  _MULTIPLE_EXTENDS_CLAUSES,
  _MISSING_STATEMENT,
  _MISSING_PREFIX_IN_DEFERRED_IMPORT,
  _MISSING_KEYWORD_OPERATOR,
  _MISSING_EXPRESSION_IN_THROW,
  _MISSING_CONST_FINAL_VAR_OR_TYPE,
  _MISSING_ASSIGNMENT_IN_INITIALIZER,
  _MISSING_ASSIGNABLE_SELECTOR,
  _MISSING_INITIALIZER,
  _LIBRARY_DIRECTIVE_NOT_FIRST,
  _INVALID_UNICODE_ESCAPE,
  _INVALID_OPERATOR,
  _INVALID_HEX_ESCAPE,
  _EXPECTED_INSTEAD,
  _IMPLEMENTS_BEFORE_WITH,
  _IMPLEMENTS_BEFORE_ON,
  _IMPLEMENTS_BEFORE_EXTENDS,
  _ILLEGAL_ASSIGNMENT_TO_NON_ASSIGNABLE,
  _EXTERNAL_AFTER_CONST,
  _EXTERNAL_AFTER_FACTORY,
  _EXTERNAL_AFTER_STATIC,
  _EXTERNAL_METHOD_WITH_BODY,
  _EXTERNAL_FIELD,
];

const ParserErrorCode _CONTINUE_OUTSIDE_OF_LOOP = const ParserErrorCode(
    'CONTINUE_OUTSIDE_OF_LOOP',
    r"A continue statement can't be used outside of a loop or switch statement.",
    correction: "Try removing the continue statement.");

const ParserErrorCode _COVARIANT_AFTER_VAR = const ParserErrorCode(
    'COVARIANT_AFTER_VAR',
    r"The modifier 'covariant' should be before the modifier 'var'.",
    correction: "Try re-ordering the modifiers.");

const ParserErrorCode _EQUALITY_CANNOT_BE_EQUALITY_OPERAND = const ParserErrorCode(
    'EQUALITY_CANNOT_BE_EQUALITY_OPERAND',
    r"An equality expression can't be an operand of another equality expression.",
    correction: "Try re-writing the expression.");

const ParserErrorCode _EXPECTED_INSTEAD = const ParserErrorCode(
    'EXPECTED_INSTEAD', r"Expected '#string' instead of this.");

const ParserErrorCode _EXTERNAL_AFTER_CONST = const ParserErrorCode(
    'EXTERNAL_AFTER_CONST',
    r"The modifier 'external' should be before the modifier 'const'.",
    correction: "Try re-ordering the modifiers.");

const ParserErrorCode _EXTERNAL_AFTER_FACTORY = const ParserErrorCode(
    'EXTERNAL_AFTER_FACTORY',
    r"The modifier 'external' should be before the modifier 'factory'.",
    correction: "Try re-ordering the modifiers.");

const ParserErrorCode _EXTERNAL_AFTER_STATIC = const ParserErrorCode(
    'EXTERNAL_AFTER_STATIC',
    r"The modifier 'external' should be before the modifier 'static'.",
    correction: "Try re-ordering the modifiers.");

const ParserErrorCode _EXTERNAL_CLASS = const ParserErrorCode(
    'EXTERNAL_CLASS', r"Classes can't be declared to be 'external'.",
    correction: "Try removing the keyword 'external'.");

const ParserErrorCode _EXTERNAL_ENUM = const ParserErrorCode(
    'EXTERNAL_ENUM', r"Enums can't be declared to be 'external'.",
    correction: "Try removing the keyword 'external'.");

const ParserErrorCode _EXTERNAL_FIELD = const ParserErrorCode(
    'EXTERNAL_FIELD', r"Fields can't be declared to be 'external'.",
    correction: "Try removing the keyword 'external'.");

const ParserErrorCode _EXTERNAL_METHOD_WITH_BODY = const ParserErrorCode(
    'EXTERNAL_METHOD_WITH_BODY',
    r"An external or native method can't have a body.");

const ParserErrorCode _ILLEGAL_ASSIGNMENT_TO_NON_ASSIGNABLE =
    const ParserErrorCode('ILLEGAL_ASSIGNMENT_TO_NON_ASSIGNABLE',
        r"Illegal assignment to non-assignable expression.");

const ParserErrorCode _IMPLEMENTS_BEFORE_EXTENDS = const ParserErrorCode(
    'IMPLEMENTS_BEFORE_EXTENDS',
    r"The extends clause must be before the implements clause.",
    correction: "Try moving the extends clause before the implements clause.");

const ParserErrorCode _IMPLEMENTS_BEFORE_ON = const ParserErrorCode(
    'IMPLEMENTS_BEFORE_ON',
    r"The on clause must be before the implements clause.",
    correction: "Try moving the on clause before the implements clause.");

const ParserErrorCode _IMPLEMENTS_BEFORE_WITH = const ParserErrorCode(
    'IMPLEMENTS_BEFORE_WITH',
    r"The with clause must be before the implements clause.",
    correction: "Try moving the with clause before the implements clause.");

const ParserErrorCode _IMPORT_DIRECTIVE_AFTER_PART_DIRECTIVE =
    const ParserErrorCode('IMPORT_DIRECTIVE_AFTER_PART_DIRECTIVE',
        r"Import directives must preceed part directives.",
        correction:
            "Try moving the import directives before the part directives.");

const ParserErrorCode _INVALID_AWAIT_IN_FOR = const ParserErrorCode(
    'INVALID_AWAIT_IN_FOR',
    r"The keyword 'await' isn't allowed for a normal 'for' statement.",
    correction: "Try removing the keyword, or use a for-each statement.");

const ParserErrorCode _INVALID_HEX_ESCAPE = const ParserErrorCode(
    'INVALID_HEX_ESCAPE',
    r"An escape sequence starting with '\x' must be followed by 2 hexadecimal digits.");

const ParserErrorCode _INVALID_OPERATOR = const ParserErrorCode(
    'INVALID_OPERATOR',
    r"The string '#lexeme' isn't a user-definable operator.");

const ParserErrorCode _INVALID_UNICODE_ESCAPE = const ParserErrorCode(
    'INVALID_UNICODE_ESCAPE',
    r"An escape sequence starting with '\u' must be followed by 4 hexadecimal digits or from 1 to 6 digits between '{' and '}'.");

const ParserErrorCode _LIBRARY_DIRECTIVE_NOT_FIRST = const ParserErrorCode(
    'LIBRARY_DIRECTIVE_NOT_FIRST',
    r"The library directive must appear before all other directives.",
    correction:
        "Try moving the library directive before any other directives.");

const ParserErrorCode _MISSING_ASSIGNABLE_SELECTOR = const ParserErrorCode(
    'MISSING_ASSIGNABLE_SELECTOR',
    r"Missing selector such as '.<identifier>' or '[0]'.",
    correction: "Try adding a selector.");

const ParserErrorCode _MISSING_ASSIGNMENT_IN_INITIALIZER =
    const ParserErrorCode('MISSING_ASSIGNMENT_IN_INITIALIZER',
        r"Expected an assignment after the field name.",
        correction: "To initialize a field, use the syntax 'name = value'.");

const ParserErrorCode _MISSING_CONST_FINAL_VAR_OR_TYPE = const ParserErrorCode(
    'MISSING_CONST_FINAL_VAR_OR_TYPE',
    r"Variables must be declared using the keywords 'const', 'final', 'var' or a type name.",
    correction:
        "Try adding the name of the type of the variable or the keyword 'var'.");

const ParserErrorCode _MISSING_EXPRESSION_IN_THROW = const ParserErrorCode(
    'MISSING_EXPRESSION_IN_THROW', r"Missing expression after 'throw'.",
    correction:
        "Add an expression after 'throw' or use 'rethrow' to throw a caught exception");

const ParserErrorCode _MISSING_INITIALIZER =
    const ParserErrorCode('MISSING_INITIALIZER', r"Expected an initializer.");

const ParserErrorCode _MISSING_KEYWORD_OPERATOR = const ParserErrorCode(
    'MISSING_KEYWORD_OPERATOR',
    r"Operator declarations must be preceeded by the keyword 'operator'.",
    correction: "Try adding the keyword 'operator'.");

const ParserErrorCode _MISSING_PREFIX_IN_DEFERRED_IMPORT =
    const ParserErrorCode('MISSING_PREFIX_IN_DEFERRED_IMPORT',
        r"Deferred imports should have a prefix.",
        correction: "Try adding a prefix to the import.");

const ParserErrorCode _MISSING_STATEMENT =
    const ParserErrorCode('MISSING_STATEMENT', r"Expected a statement.");

const ParserErrorCode _MULTIPLE_EXTENDS_CLAUSES = const ParserErrorCode(
    'MULTIPLE_EXTENDS_CLAUSES',
    r"Each class definition can have at most one extends clause.",
    correction:
        "Try choosing one superclass and define your class to implement (or mix in) the others.");

const ParserErrorCode _MULTIPLE_LIBRARY_DIRECTIVES = const ParserErrorCode(
    'MULTIPLE_LIBRARY_DIRECTIVES',
    r"Only one library directive may be declared in a file.",
    correction: "Try removing all but one of the library directives.");

const ParserErrorCode _MULTIPLE_ON_CLAUSES = const ParserErrorCode(
    'MULTIPLE_ON_CLAUSES',
    r"Each mixin definition can have at most one on clause.",
    correction: "Try combining all of the on clauses into a single clause.");

const ParserErrorCode _MULTIPLE_PART_OF_DIRECTIVES = const ParserErrorCode(
    'MULTIPLE_PART_OF_DIRECTIVES',
    r"Only one part-of directive may be declared in a file.",
    correction: "Try removing all but one of the part-of directives.");

const ParserErrorCode _MULTIPLE_WITH_CLAUSES = const ParserErrorCode(
    'MULTIPLE_WITH_CLAUSES',
    r"Each class definition can have at most one with clause.",
    correction: "Try combining all of the with clauses into a single clause.");

const ParserErrorCode _NATIVE_CLAUSE_SHOULD_BE_ANNOTATION = const ParserErrorCode(
    'NATIVE_CLAUSE_SHOULD_BE_ANNOTATION',
    r"Native clause in this form is deprecated.",
    correction:
        "Try removing this native clause and adding @native() or @native('native-name') before the declaration.");

const ParserErrorCode _PREFIX_AFTER_COMBINATOR = const ParserErrorCode(
    'PREFIX_AFTER_COMBINATOR',
    r"The prefix ('as' clause) should come before any show/hide combinators.",
    correction: "Try moving the prefix before the combinators.");

const ParserErrorCode _REDIRECTING_CONSTRUCTOR_WITH_BODY = const ParserErrorCode(
    'REDIRECTING_CONSTRUCTOR_WITH_BODY',
    r"Redirecting constructors can't have a body.",
    correction:
        "Try removing the body, or not making this a redirecting constructor.");

const ParserErrorCode _REDIRECTION_IN_NON_FACTORY_CONSTRUCTOR =
    const ParserErrorCode('REDIRECTION_IN_NON_FACTORY_CONSTRUCTOR',
        r"Only factory constructor can specify '=' redirection.",
        correction:
            "Try making this a factory constructor, or remove the redirection.");

const ParserErrorCode _STATIC_AFTER_CONST = const ParserErrorCode(
    'STATIC_AFTER_CONST',
    r"The modifier 'static' should be before the modifier 'const'.",
    correction: "Try re-ordering the modifiers.");

const ParserErrorCode _STATIC_AFTER_FINAL = const ParserErrorCode(
    'STATIC_AFTER_FINAL',
    r"The modifier 'static' should be before the modifier 'final'.",
    correction: "Try re-ordering the modifiers.");

const ParserErrorCode _STATIC_AFTER_VAR = const ParserErrorCode(
    'STATIC_AFTER_VAR',
    r"The modifier 'static' should be before the modifier 'var'.",
    correction: "Try re-ordering the modifiers.");

const ParserErrorCode _STATIC_CONSTRUCTOR = const ParserErrorCode(
    'STATIC_CONSTRUCTOR', r"Constructors can't be static.",
    correction: "Try removing the keyword 'static'.");

const ParserErrorCode _STATIC_OPERATOR = const ParserErrorCode(
    'STATIC_OPERATOR', r"Operators can't be static.",
    correction: "Try removing the keyword 'static'.");

const ParserErrorCode _SWITCH_HAS_CASE_AFTER_DEFAULT_CASE =
    const ParserErrorCode('SWITCH_HAS_CASE_AFTER_DEFAULT_CASE',
        r"The default case should be the last case in a switch statement.",
        correction:
            "Try moving the default case after the other case clauses.");

const ParserErrorCode _SWITCH_HAS_MULTIPLE_DEFAULT_CASES =
    const ParserErrorCode('SWITCH_HAS_MULTIPLE_DEFAULT_CASES',
        r"The 'default' case can only be declared once.",
        correction: "Try removing all but one default case.");

const ParserErrorCode _TOP_LEVEL_OPERATOR = const ParserErrorCode(
    'TOP_LEVEL_OPERATOR', r"Operators must be declared within a class.",
    correction:
        "Try removing the operator, moving it to a class, or converting it to be a function.");

const ParserErrorCode _TYPEDEF_IN_CLASS = const ParserErrorCode(
    'TYPEDEF_IN_CLASS', r"Typedefs can't be declared inside classes.",
    correction: "Try moving the typedef to the top-level.");

const ParserErrorCode _TYPE_ARGUMENTS_ON_TYPE_VARIABLE = const ParserErrorCode(
    'TYPE_ARGUMENTS_ON_TYPE_VARIABLE',
    r"Can't use type arguments with type variable '#name'.",
    correction: "Try removing the type arguments.");

const ParserErrorCode _VAR_RETURN_TYPE = const ParserErrorCode(
    'VAR_RETURN_TYPE', r"The return type can't be 'var'.",
    correction:
        "Try removing the keyword 'var', or replacing it with the name of the return type.");

const ParserErrorCode _WITH_BEFORE_EXTENDS = const ParserErrorCode(
    'WITH_BEFORE_EXTENDS',
    r"The extends clause must be before the with clause.",
    correction: "Try moving the extends clause before the with clause.");
