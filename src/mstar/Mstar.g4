grammar Mstar;

compilationUnit
    :   globalDeclaration* EOF
    ;
globalDeclaration
    :   functionDeclaration
    |   classDeclaration
    |   variableDeclaration ';'
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
    :   token=STRING
    |   token=INT
    |   token=BOOL
    |   token=VOID
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
    :   IF '(' expression ')' statement ( ELSE statement ) ?    #   ifStatement
    |   WHILE '(' expression ')' statement          #   whileStatement
    |   FOR '(' forControl ')' statement            #   forStatement
    |   BREAK ';'                       #   breakStatement
    |   CONTINUE ';'                    #   continueStatement
    |   RETURN expression ? ';'         #   returnStatement
    |   variableDeclaration ';'         #   varDeclStatement
    |   expression ';'                  #   exprStatement
    |   '{' statementList '}'           #   blockStatement
    |   ';'             #   emptyStatement
    ;

forControl
    :   forInit? ';' expression? ';' forUpdate=expressionList
    ;
forInit
    :   variableDeclaration
    |   expressionList
    ;
expressionList
    :   expression (',' expression)*
    ;
variableDeclaration
    : type variableDeclarators
    ;
variableDeclarators
    :   variableDeclarator (',' variableDeclarator)*
    ;
variableDeclarator
    :   IDENTIFIER ('=' expression)?
    ;
expression
    :   '(' expression ')'      #   primaryExpression
    |   token=THIS              #   primaryExpression
    |   token=INT_LITERAL       #   primaryExpression
    |   token=STRING_LITERAL    #   primaryExpression
    |   token=BOOL_LITERAL      #   primaryExpression
    |   token=NULL_LITERAL      #   primaryExpression
    |   token=IDENTIFIER        #   primaryExpression
    |   expression bop='.' ( IDENTIFIER | functionCall )    #   memberExpression
    |   expression '[' expression ']'   #   arrayExpreesion
    |   functionCall            #   funcCallExpression
    |   NEW creator             #   newExpression
    |   expression postfix=('++' | '--')            #   unaryExpression
    |   prefix=('+' | '-' | '++' | '--') expression #   unaryExpression
    |   prefix=('~' | '!') expression               #   unaryExpression
    |   expression bop=('*'|'/'|'%') expression         #   binaryExpression
    |   expression bop=('+'|'-') expression             #   binaryExpression
    |   expression bop=('<<'|'>>') expression           #   binaryExpression
    |   expression bop=('<='|'>='|'<'|'>') expression   #   binaryExpression
    |   expression bop=('=='|'!=') expression           #   binaryExpression
    |   expression bop='&' expression                   #   binaryExpression
    |   expression bop='^' expression                   #   binaryExpression
    |   expression bop='|' expression                   #   binaryExpression
    |   expression bop='&&' expression                  #   binaryExpression
    |   expression bop='||' expression                  #   binaryExpression
    |   expression bop='?' expression ':' expression    #   ternaryExpression
    |   <assoc=right> expression bop=('='|'+='|'-='|'*='|'/='|'&='|'|='|'^='|'>>='|'<<='|'%=') expression   #assignExpression
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
STRING_LITERAL: '"' ('\\"' | .)*?  '"';
IDENTIFIER:     [a-zA-Z][a-zA-Z0-9_]*;
LINE_COMMENT:    '//'~[\n]*     ->  channel(HIDDEN);
BLOCK_COMMENT:  '/*' .*? '*/'   ->  channel(HIDDEN);
WS: [ \t\r\n]+  ->  channel(HIDDEN);