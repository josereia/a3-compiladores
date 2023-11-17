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
inteiro = {digito} ({digito})* 

novaLinha    = \r | \n | \r\n
brancos      = [ \t\f] | {novaLinha}


%%
{inteiro} 		{ int aux = Integer.parseInt(yytext());
                  return new Symbol(Sym.INTEIRO,yyline,yycolumn, Integer.valueOf(aux));
                }	
"+"  			{ return new Symbol(Sym.MAIS);}
"-"  			{ return new Symbol(Sym.MENOS);}
";"  			{ return new Symbol(Sym.PTVIRG);}
{brancos}       {}   
<<EOF>>         { return new Symbol(Sym.EOF,yyline,yycolumn,yytext());}