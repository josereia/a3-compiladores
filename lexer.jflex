import java_cup.runtime.*;
//import java_cup.runtime.ComplexSymbolFactory;
//import java_cup.runtime.ComplexSymbolFactory.Location;
//import java_cup.runtime.Symbol;

%%
%notunix
%cup
%class Lexer

digits = [0-9]
letters = [A-Za-z]
symbols = [*]

identifier = ({letters}|{digits})+
string = \"({letters}|{digits}|{symbols})*\"

newLine    = \r | \n | \r\n
blank      = [ \t\f] | {newLine}

%%
";"  			   { return new Symbol(Sym.SEMICOLON); }

"("          { return new Symbol(Sym.LEFTPAR); }
")"          { return new Symbol(Sym.RIGHTPAR); }
"{"          { return new Symbol(Sym.LEFTBRACE); }
"}"          { return new Symbol(Sym.RIGHTBRACE); }
"["          { return new Symbol(Sym.LEFTBRACKET); }
"]"          { return new Symbol(Sym.RIGHTBRACKET); }

"="          { return new Symbol(Sym.EQUAL); }
"=="         { return new Symbol(Sym.EQUALTO); }
"!="         { return new Symbol(Sym.NOTEQUAL); }
"<"          { return new Symbol(Sym.LESS); }
"<="         { return new Symbol(Sym.LESSEQUAL); }
">"          { return new Symbol(Sym.GREATER); }
">="         { return new Symbol(Sym.GREATEREQUAL); }

"if"         { return new Symbol(Sym.IF); }
"else"       { return new Symbol(Sym.ELSE); }

"var"        { return new Symbol(Sym.VAR); }

{identifier} { return new Symbol(Sym.IDENTIFIER,yytext()); }
{string}     { return new Symbol(Sym.STRING,yytext()); }

{blank}      {}
<<EOF>>      { return new Symbol(Sym.EOF,yyline,yycolumn,yytext()); }