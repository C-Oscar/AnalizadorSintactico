package Analizador;
import java_cup.runtime.Symbol;
%%
%class LexicoCup
%type java_cup.runtime.Symbol
%cup 
%full
%line
%char
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ \t \r \n]+
%{
    private Symbol symbol(int type, Object value){
        return new Symbol(type, yyline, yycolumn, value);
    }
    private Symbol symbol(int type){
        return new Symbol(type, yyline, yycolumn);
    }
%}
%%

/* Palabra reservada Int */
( int ) {return new Symbol(sym.Int, yychar, yyline, yytext());}

/* Espacios en blanco */
{espacio} {/*Ignore*/}

/* Comentarios */
( "//"(.)* ) {/*Ignore*/}

/* Comillas */
( "\"" ) {return new Symbol(sym.Comillas, yychar, yyline, yytext());}

/* Comillas simples*/
( "\'" ) {return new Symbol(sym.Comillas_S, yychar, yyline, yytext());}

/*Back Slash*/
( "\\" ) {return new Symbol(sym.B_Slash, yychar, yyline, yytext());}

/* Tipos de datos */
( byte | long | float | double | goto | short ) {return new Symbol(sym.T_datoN, yychar, yyline, yytext());}

/* Tipo de dato Int (Para el main) */
( "int" ) {return new Symbol(sym.T_datoN, yychar, yyline, yytext());}

/* Tipo de dato String */
( string ) {return new Symbol(sym.Cadena, yychar, yyline, yytext());}

/* Tipo de dato Char */
( char ) {return new Symbol(sym.Char, yychar, yyline, yytext());}

/* Tipo de dato Vacio */
( void ) {return new Symbol(sym.Vacio, yychar, yyline, yytext());}

/* Tipo de dato Nulo */
( null ) {return new Symbol(sym.Nulo, yychar, yyline, yytext()); }

/* Palabra reservada Include */
( include ) {return new Symbol(sym.Include, yychar, yyline, yytext()); }

/* Palabra reservada If */
( if ) {return new Symbol(sym.If, yychar, yyline, yytext());}

/* Palabra reservada Else */
( else ) {return new Symbol(sym.Else, yychar, yyline, yytext());}

/* Palabra reservada Do */
( do ) {return new Symbol(sym.Do, yychar, yyline, yytext());}

/* Palabra reservada While */
( while ) {return new Symbol(sym.While, yychar, yyline, yytext());}

/* Palabra reservada For */
( for ) {return new Symbol(sym.For, yychar, yyline, yytext());}

/* Palabra reservada TypeDef */ 
( typedef ) {return new Symbol(sym.Typedef, yychar, yyline, yytext());}

/* Palabra reservada Switch */
( switch ) {return new Symbol(sym.Switch, yychar, yyline, yytext());}

/* Palabra reservada Case */
( case ) {return new Symbol(sym.Case, yychar, yyline, yytext());}

/* Palabra reservada Break */
( Break ) {return new Symbol(sym.Break, yychar, yyline, yytext());}

/* Palabra reservada Default */
( default ) {return new Symbol(sym.Default, yychar, yyline, yytext());}

/* Palabra reservada Define */
( define ) {return new Symbol(sym.Define, yychar, yyline, yytext());}

/* Palabra reservada Print */
( printf ) {return new Symbol(sym.Print, yychar, yyline, yytext());}

/* Palabra reservada Scanf */ 
( scanf ) {return new Symbol(sym.Scan, yychar, yyline, yytext());}

/* Palabra reservada Enum */ 
( enum ) {return new Symbol(sym.Enum, yychar, yyline, yytext());}

/* Palabra reservada Extern */ 
( extern ) {return new Symbol(sym.Extern, yychar, yyline, yytext());}

/* Palabra reservada Register */ 
( register ) {return new Symbol(sym.Register, yychar, yyline, yytext());}

/* Palabra reservada Union */ 
( union ) {return new Symbol(sym.Union, yychar, yyline, yytext());}

/* Palabra reservada Gets */ 
( gets ) {return new Symbol(sym.Gets, yychar, yyline, yytext());}

/* Palabra reservada Fgets */ 
( fgets ) {return new Symbol(sym.Fgets, yychar, yyline, yytext());}

/* Palabra reservada Return */ 
( return ) {return new Symbol(sym.Return, yychar, yyline, yytext());}

/* Palabra reservada System */ 
( system ) {return new Symbol(sym.Sistema, yychar, yyline, yytext());}

/* Palabra reservada Unsigned */ 
( unsigned ) {return new Symbol(sym.Unsigned, yychar, yyline, yytext());}

/* Palabra reservada Struct */ 
( struct ) {return new Symbol(sym.Struct, yychar, yyline, yytext());}

/* Palabra reservada SizeOf */ 
( sizeof ) {return new Symbol(sym.SizeOf, yychar, yyline, yytext());}

/* Palabra reservada Const */ 
( const ) {return new Symbol(sym.Const, yychar, yyline, yytext());}

/* Palabra reservada Continue */ 
( continue ) {return new Symbol(sym.Continue, yychar, yyline, yytext());}

/* Operador Igual */
( "=" ) {return new Symbol(sym.Igual, yychar, yyline, yytext());}

/* Operador Suma */
( "+" ) {return new Symbol(sym.Suma, yychar, yyline, yytext());}

/* Operador Resta */
( "-" ) {return new Symbol(sym.Resta, yychar, yyline, yytext());}

/* Operador Multiplicacion */
( "*" ) {return new Symbol(sym.Multiplicacion, yychar, yyline, yytext());}

/* Operador Division */
( "/" ) {return new Symbol(sym.Division, yychar, yyline, yytext());}

/* Operador Modulo */
( "%" ) {return new Symbol(sym.Modulo, yychar, yyline, yytext());}

/* Operadores logicos */
( "&&" | "||" | "!" | "&" | "|" ) {return new Symbol(sym.Op_logico, yychar, yyline, yytext());}

/*Operadores Relacionales */
( ">" | "<" | "==" | "!=" | ">=" | "<=" | "<<" | ">>" ) {return new Symbol(sym.Op_relacional, yychar, yyline, yytext());}

/* Operadores Atribucion */
( "+=" | "-="  | "*=" | "/=" | "%=" | "=" ) {return new Symbol(sym.Op_atribucion, yychar, yyline, yytext());}

/* Operadores Incremento y decremento */
( "++" | "--" ) {return new Symbol(sym.Op_incremento, yychar, yyline, yytext());}

/*Operadores Booleanos*/
( true | false ) {return new Symbol(sym.Op_booleano, yychar, yyline, yytext());}

/* Numeral */
( "#" ) {return new Symbol(sym.Numeral, yychar, yyline, yytext());}

/* Parentesis de apertura */
( "(" ) {return new Symbol(sym.Parentesis_a, yychar, yyline, yytext());}

/* Parentesis de cierre */
( ")" ) {return new Symbol(sym.Parentesis_c, yychar, yyline, yytext());}

/* Llave de apertura */
( "{" ) {return new Symbol(sym.Llave_a, yychar, yyline, yytext());}

/* Llave de cierre */
( "}" ) {return new Symbol(sym.Llave_c, yychar, yyline, yytext());}

/* Corchete de apertura */
( "[" ) {return new Symbol(sym.Corchete_a, yychar, yyline, yytext());}

/* Corchete de cierre */
( "]" ) {return new Symbol(sym.Corchete_c, yychar, yyline, yytext());}

/* Marcador de inicio de algoritmo */
( "main" ) {return new Symbol(sym.Main, yychar, yyline, yytext());}

/* Coma */
( "," ) {return new Symbol(sym.Coma, yychar, yyline, yytext());}

/* Punto y coma */
( ";" ) {return new Symbol(sym.P_coma, yychar, yyline, yytext());}

/* Dos puntos */
( ":" ) {return new Symbol(sym.Dos_P, yychar, yyline, yytext());}

/* Punto */
( "." ) {return new Symbol(sym.Punto, yychar, yyline, yytext());}

/* Identificador */
{L}({L}|{D})* {return new Symbol(sym.Identificador, yychar, yyline, yytext());}

/* Numero */
("(-"{D}+")")|{D}+ {return new Symbol(sym.Numero, yychar, yyline, yytext());}

/* Error de analisis */
 . {return new Symbol(sym.ERROR, yychar, yyline, yytext());}
