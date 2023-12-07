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
symbols = []

// rules
newLine = \r | \n | \r\n
blanks = [ \t\f] | {newLine}

identifier = {letters}|{numbers} ({letters}|{numbers})*

%%
";"           {return new Symbol(Sym.SEMICOLON);}

{identifier}  {return new Symbol(Sym.IDENTIFIER);}
{blanks}      {}
<<EOF>>       {return new Symbol(Sym.EOF,yyline,yycolumn,yytext());}
