import java_cup.runtime.*;
//import java_cup.runtime.ComplexSymbolFactory;
//import java_cup.runtime.ComplexSymbolFactory.Location;
//import java_cup.runtime.Symbol;

%%
%notunix
%cup 
%class Lexer
letras   = [A-Za-z*]
tabela = {letras} ({letras})*
coluna = {letras} ({tabela}+\.{letras}+)|\*

novaLinha    = \r | \n | \r\n
brancos      = [ \t\f] | {novaLinha}


%%
"+"  			{ return new Symbol(Sym.MAIS);}
"-"  			{ return new Symbol(Sym.MENOS);}
";"  			{ return new Symbol(Sym.PTVIRG);}
"SELECT"  { return new Symbol(Sym.SELECT);}
"FROM"    {return new Symbol(Sym.FROM);}
{coluna}  {return new Symbol(Sym.COLUNA,yyline,yycolumn,yytext());}
{tabela}  {return new Symbol(Sym.TABELA,yyline,yycolumn,yytext());}
{brancos} {}   
<<EOF>>   { return new Symbol(Sym.EOF,yyline,yycolumn,yytext());}