%%

%class VCLexer
%standalone
%unicode
%line
%column

%{
	public void printToken(String token, String typeToken){
		System.out.println("Token: " + token.trim() + " " + "Type: " + typeToken);
	}

	public void printError(String error){
		System.out.println("Error: " + error);
	}
%}

/*-*
 * PATTERN DEFINITIONS:
 */

lineTerminator = \r|\n|\r\n
inputCharacter = [^\r\n]
whiteSpace     = {lineTerminator} | [ \t\f]

/* comments */
traditionalComment = "/*" [^*] ~"*/" | "/*" "*"+ "/"
endOfLineComment   = "//" {inputCharacter}* {lineTerminator}?
comment            = {traditionalComment} | {endOfLineComment}
commentUnterminated = "/*" [^*] ~"*" | "/*" "*"+

/* identifiers */
letter     = [A-Za-z_]
digit      = [0-9]
identifier = {letter}({letter}|{digit})*

/* keywords */
keyword    = boolean|break|continue|else|for|float|if|int|return|void|while

/* operators */
arithmeticOperator = "+"|"-"|"*"|"/"
relationalOperator = "<"|"<="|">"|">="
equalityOperator   = "=="|"!="
logicalOperator    = "||"|"&&"|"!"
assignmentOperator = "="

/* separators */
separator     = "{"|"}"|"("|")"|"["|"]"|";"|","

/* literals */
intLiteral    = {digit}{digit}*

boolLiteral   = (true|false)

doubleQoute   = \"
stringContent = (\\\"|[^\n\r\"]|\\{whiteSpace}+\\)*
stringLiteral = {doubleQoute}{stringContent}{doubleQoute}
stringUnterminated = {doubleQoute}{stringContent}

fraction      = \.{digit}+
exponent      = (E|e)(\+|\-)?{digit}*
floatLiteral  = ((({digit}* {fraction} {exponent}?))
                |({digit}+\.)
                |({digit}+\.? {exponent}))

%%
/**
 * LEXICAL RULES:
 */

{keyword}            {printToken(yytext(), "Keyword");}
{arithmeticOperator} {printToken(yytext(), "Arithmetic Operator");}
{relationalOperator} {printToken(yytext(), "Relational Operator");}
{equalityOperator}   {printToken(yytext(), "Equality Operator");}
{logicalOperator}    {printToken(yytext(), "Logical Operator");}
{assignmentOperator} {printToken(yytext(), "Assignment Operator");}
{separator}          {printToken(yytext(), "Separator");}
{intLiteral}         {printToken(yytext(), "Integer Literal");}
{boolLiteral}        {printToken(yytext(), "Boolean Literal");}
{stringLiteral}      {printToken(yytext(), "String Literal");}
{stringUnterminated} {printError("String unterminated");}
{floatLiteral}       {printToken(yytext(), "Floating-point Literal");}
{identifier}         {printToken(yytext(), "Identifier");}
{comment}            {/* Ignore comment */}
{commentUnterminated} {printError("Comment unterminated");}
{whiteSpace}         {/* Ignore whitespace */}
.                    {printToken(yytext(), "Illegal char");}
