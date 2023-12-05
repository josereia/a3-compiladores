import java_cup.runtime.*;
//import java_cup.runtime.ComplexSymbolFactory;
//import java_cup.runtime.ComplexSymbolFactory.Location;
//import java_cup.runtime.Symbol;

%%
%notunix
%cup 
%class Lexer
digito  = [0-9] 
letra   = [A-Za-z]

teste =  {letra} ({letra})* 
inteiro = {digito} ({digito})* 

novaLinha    = \r | \n | \r\n
brancos      = [ \t\f] | {novaLinha}


%%
"+"  			{ return new Symbol(Sym.MAIS);}
"-"  			{ return new Symbol(Sym.MENOS);}
";"  			{ return new Symbol(Sym.PTVIRG);}
"SELECT"  			{ return new Symbol(Sym.SELECT);}
{teste}        {return new Symbol(Sym.LETRA,yyline,yycolumn,yytext());}
{brancos}       {}   
<<EOF>>         { return new Symbol(Sym.EOF,yyline,yycolumn,yytext());}