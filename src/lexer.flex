import java_cup.runtime.*;
//import java_cup.runtime.ComplexSymbolFactory;
//import java_cup.runtime.ComplexSymbolFactory.Location;
//import java_cup.runtime.Symbol;

%%
%notunix
%cup
%class Lexer

// sets
numbers = [0-9]
letters = [A-Za-z]
symbols = ["/^$.*+?()[]{}|"]

// rules
integer = ({numbers})+
string = \"({letters}|{integer}|{symbols})*\"
identifier = {letters} ({letters}|{integer})*

newLine = \r | \n | \r\n
comment = "//".* | "/*"[^*]*|[*]*"*/"
blanks = [ \t\f] | {newLine} | {comment}

%%
";"           {return new Symbol(Sym.SEMICOLON);}

"="           {return new Symbol(Sym.EQUAL);}
"=="          {return new Symbol(Sym.EQUALTO);}
"<"           {return new Symbol(Sym.LESS);}
"<="          {return new Symbol(Sym.LESSEQUAL);}
">"           {return new Symbol(Sym.GREATER);}
">="          {return new Symbol(Sym.GREATEREQUAL);}
"!="          {return new Symbol(Sym.NOTEQUAL);}

"("           {return new Symbol(Sym.LEFTPAR);}
")"           {return new Symbol(Sym.RIGHTPAR);}
"{"           {return new Symbol(Sym.LEFTBRACE);}
"}"           {return new Symbol(Sym.RIGHTBRACE);}
"["           {return new Symbol(Sym.LEFTBRACKET);}
"]"           {return new Symbol(Sym.RIGHTBRACKET);}

"string"      {return new Symbol(Sym.STRVAR);}
"int"         {return new Symbol(Sym.INTVAR);}
"func"        {return new Symbol(Sym.FUNC);}
"void"        {return new Symbol(Sym.VOID);}
"return"      {return new Symbol(Sym.RETURN);}

{integer}     {return new Symbol(Sym.INTEGER);}
{string}      {return new Symbol(Sym.STRING);}
{identifier}  {return new Symbol(Sym.IDENTIFIER);}

{blanks}      {}
<<EOF>>       {return new Symbol(Sym.EOF,yyline,yycolumn,yytext());}
