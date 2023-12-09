import java_cup.runtime.*;

%%
%cup
%unicode
%line
%column
%public
%class Lexer

%{
  private ErrorStack errorStack;

  public Lexer(java.io.FileReader in, ErrorStack errorStack) {
    this(in);
    this.errorStack = errorStack;
  }

  public ErrorStack getErrorStack() {
    return errorStack;
  }

  public void newError(int line, int column, String text) {
    this.errorStack.wrap(line, column, text);
  }

  public void newError(int line, int column) {
    this.errorStack.wrap(line, column);
  }

  public void newError(String text) {
    this.errorStack.wrap(text);
  }

  private Symbol createSym(int code, Object value) {
    return new Symbol(code, yyline, yycolumn, value);
  }

  private Symbol createSym(int code) {
    return new Symbol(code, yyline, yycolumn);
  }
%}

// sets
numbers = [0-9]
letters = [A-Za-z]
symbols = ["/^$.*+?()[]{}|!#@&-_=ªº°,;~`´'<>"]

// rules
newLine = \r | \n | \r\n
comment = "//".* | "/*"[^*]*|[*]*"*/"
blanks = [ \t\f] | {newLine} | {comment}

integer = ({numbers})+
string = \"({letters}|{integer}|{symbols}|{blanks})*\"
identifier = {letters} ({letters}|{integer})*


%%
";"           {return createSym(Sym.SEMICOLON);}
// ","           {return createSym(Sym.COLON);}

"+"           {return createSym(Sym.PLUS);}
"-"           {return createSym(Sym.MINUS);}
"*"           {return createSym(Sym.TIMES);}
"/"           {return createSym(Sym.SLASH);}

"="           {return createSym(Sym.EQUAL);}
// "=="          {return createSym(Sym.EQUALTO);}
// "<"           {return createSym(Sym.LESS);}
// "<="          {return createSym(Sym.LESSEQUAL);}
// ">"           {return createSym(Sym.GREATER);}
// ">="          {return createSym(Sym.GREATEREQUAL);}
// "!="          {return createSym(Sym.NOTEQUAL);}

"("           {return createSym(Sym.LEFTPAR);}
")"           {return createSym(Sym.RIGHTPAR);}
"{"           {return createSym(Sym.LEFTBRACE);}
"}"           {return createSym(Sym.RIGHTBRACE);}
// "["           {return createSym(Sym.LEFTBRACKET);}
// "]"           {return createSym(Sym.RIGHTBRACKET);}

"string"      {return createSym(Sym.STRVAR);}
"int"         {return createSym(Sym.INTVAR);}
"void"        {return createSym(Sym.VOID);}
"return"      {return createSym(Sym.RETURN);}
"print"       {return createSym(Sym.PRINT);}

{integer}     {
                int value = Integer.parseInt(yytext());
                return createSym(Sym.INTEGER, value);
              }
              
{string}      {return createSym(Sym.STRING, yytext());}
{identifier}  {return createSym(Sym.IDENTIFIER);}

{blanks}      {}
<<EOF>>       {return createSym(Sym.EOF, yytext());}
.|\n          {newError(yyline, yycolumn, "Símbolo desconhecido: " + yytext());}
