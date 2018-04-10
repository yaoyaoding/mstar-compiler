grammar mstar;

compilationUnit
    :   globalDeclaration* EOF
    ;
globalDeclaration
    :   functionDeclaration
    |   classDeclaration
    |   globalVariableDeclaration ';'
    ;
globalVariableDeclaration
    :   type variableDeclarators
    ;
functionDeclaration
    :  type IDENTIFIER '(' parameterList? ')' functionBody
    ;
classDeclaration
    :   CLASS IDENTIFIER classBody
    ;
classBody
    :   '{' classBodyDeclaration* '}'
    ;
classBodyDeclaration
    :   methodDeclaration
    |   constructorDeclaration
    |   fieldDeclaration
    ;
constructorDeclaration
    :   IDENTIFIER '(' parameterList? ')' functionBody
    ;
methodDeclaration
    :   type IDENTIFIER '(' parameterList? ')' functionBody
    ;
fieldDeclaration
    :   type variableDeclarators ';'
    ;
type
    :   atomType ('[' ']')*
    ;
primitiveType
    :   STRING
    |   INT
    |   BOOL
    |   VOID
    ;
classType
    :   IDENTIFIER
    ;
atomType
    :   primitiveType
    |   classType
    ;
parameterList
    :   parameter (',' parameter)*
    ;
parameter
    :   type IDENTIFIER
    ;
functionBody
    :   '{' statementList '}'
    ;
statementList
    :   statement*
    ;
statement
    :   IF '(' expression ')' statement ( ELSE statement ) ?
    |   WHILE '(' expression ')' statement
    |   FOR '(' forControl ')' statement
    |   BREAK ';'
    |   CONTINUE ';'
    |   RETURN expression ? ';'
    |   localVariableDeclaration ';'
    |   expression ';'
    |   '{' statementList '}'
    |   ';'
    ;

forControl
    :   forInit? ';' expression? ';' forUpdate=expressionList
    ;
forInit
    :   localVariableDeclaration
    |   expressionList
    ;
expressionList
    :   expression (',' expression)*
    ;
localVariableDeclaration
    : type variableDeclarators
    ;
variableDeclarators
    :   variableDeclarator (',' variableDeclarator)*
    ;
variableDeclarator
    :   IDENTIFIER ('=' expression)?
    ;
expression
    :   primary
    |   expression bop='.' ( IDENTIFIER | functionCall )
    |   expression '[' expression ']'
    |   functionCall
    |   NEW creator
    |   expression postfix=('++' | '--')
    |   prefix=('+' | '-' | '++' | '--') expression
    |   prefix=('~' | '!') expression
    |   expression bop=('*'|'/'|'%') expression
    |   expression bop=('+'|'-') expression
    |   expression bop=('<<'|'>>') expression
    |   expression bop=('<='|'>='|'<'|'>') expression
    |   expression bop=('=='|'!=') expression
    |   expression bop='&' expression
    |   expression bop='^' expression
    |   expression bop='|' expression
    |   expression bop='&&' expression
    |   expression bop='||' expression
    |   expression bop='?' expression ':' expression
    |   <assoc=right> expression bop=('='|'+='|'-='|'*='|'/='|'&='|'|='|'^='|'>>='|'<<='|'%=') expression
    ;
primary
    :   '(' expression ')'
    |   THIS
    |   literal
    |   IDENTIFIER
    ;
literal
    :   INT_LITERAL
    |   FLOAT_LITERAL
    |   STRING_LITERAL
    |   CHAR_LITERAL
    |   BOOL_LITERAL
    |   NULL_LITERAL
    ;
creator
    :   atomType ('[' expression ']')+ ('[' ']')*
    ;
functionCall
    :   IDENTIFIER '(' argumentList? ')'
    ;
argumentList
    :   expression (',' expression)*
    ;

//  lexer

//  reserved words
BOOL_LITERAL:   'true';
NULL_LITERAL:   'false';
STRING: 'string';
INT:    'int';
BOOL:   'bool';
VOID:   'void';
CLASS:  'class';
IF:     'if';
WHILE:  'while';
FOR:    'for';
BREAK:  'break';
CONTINUE:   'continue';
RETURN: 'return';
THIS:   'this';
NEW:    'new';
ELSE:   'else';

INT_LITERAL:    [0-9][0-9]*;
FLOAT_LITERAL:  ([0-9]*'.'[0-9]+) | ([0-9]+'.'[0-9]*);
STRING_LITERAL: '"' ('\\"' | .)*?  '"';
CHAR_LITERAL:   '\''~[']'\'';
IDENTIFIER:     [a-zA-Z][a-zA-Z0-9_]*;
LINE_COMMENT:    '//'~[\n]*     ->  channel(HIDDEN);
BLOCK_COMMENT:  '/*' .*? '*/'   ->  channel(HIDDEN);
WS: [ \t\r\n]+  ->  channel(HIDDEN);
