package Analizador;
import static Analizador.Tokens.*;
%%
%class Lexer
%type Tokens
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ \t \r]+
%{
    public String lexeme;
%}
%%
/* Tipo Int */
(int) {lexeme=yytext(); return Int;}

/* Espacios en blanco */
{espacio} {/*Ignore*/}

/* Comentarios */
( "//"(.)* ) {/*Ignore*/}

/* Salto de linea */
( "\n" ) {return Linea;}

/* Comillas */
( "\"" ) {lexeme=yytext(); return Comillas;}

/* Comillas simples*/
( "\'" ) {lexeme=yytext(); return Comillas_S;}

/* Back Slash*/
( "\\" ) {lexeme=yytext(); return B_Slash;}

/* Tipos de datos numericos*/
( byte | long | float | double ) {lexeme=yytext(); return T_datoN;}

/* Tipo de dato String */
( string ) {lexeme=yytext(); return Cadena;}

/* Tipo de dato Char */
( char ) {lexeme=yytext(); return Char;}

/* Tipo de dato Vacio */
( void ) {lexeme=yytext(); return Vacio;}

/* Tipo de dato Nulo */
( null ) {lexeme=yytext(); return Nulo;}

/* Palabra reservada Include */
( include ) {lexeme=yytext(); return Include;}

/* Palabra reservada If */
( if ) {lexeme=yytext(); return If;}

/* Palabra reservada Else */
( else ) {lexeme=yytext(); return Else;}

/* Palabra reservada Do */
( do ) {lexeme=yytext(); return Do;}

/* Palabra reservada While */
( while ) {lexeme=yytext(); return While;}

/* Palabra reservada Struct */
( struct ) {lexeme=yytext(); return Struct;}

/* Palabra reservada For */
( for ) {lexeme=yytext(); return For;}

/* Palabra reservada Switch */
( switch ) {lexeme=yytext(); return Switch;}

/* Palabra reservada Case */
( case ) {lexeme=yytext(); return Case;}

/* Palabra reservada Break */
( break ) {lexeme=yytext(); return Break;}

/* Palabra reservada Default */
( default ) {lexeme=yytext(); return Default;}

/* Palabra reservada Print */
( printf ) {lexeme=yytext(); return Print;}

/* Palabra reservada Scanf */ 
( scanf ) {lexeme=yytext(); return Scan;}

/* Palabra reservada Const */ 
( const ) {lexeme=yytext(); return Const;}

/* Continue*/
( continue ) {lexeme=yytext(); return Continue;}

/* Enum*/
( enum ) {lexeme=yytext(); return Enum;}

/* Union*/
( union ) {lexeme=yytext(); return Union;} 

/* Palabra reservada Extern */ 
( extern ) {lexeme=yytext(); return Extern;}

/* Palabra reservada Register */ 
( register ) {lexeme=yytext(); return Register;}

/* Palabra reservada TypeDef */ 
( typedef ) {lexeme=yytext(); return Typedef;}

/* Palabra reservada Gets */ 
( gets ) {lexeme=yytext(); return Gets;}

/* Palabra reservada Fgets */ 
( fgets ) {lexeme=yytext(); return Fgets;}

/* Palabra reservada Return */ 
( return ) {lexeme=yytext(); return Return;}

/* Palabra reservada System */ 
( system ) {lexeme=yytext(); return Sistema;}

/* Palabra reservada Unsigned */ 
( unsigned ) {lexeme=yytext(); return Unsigned;}

/* Palabra reservada SizeOf */ 
( sizeof ) {lexeme=yytext(); return SizeOf;}

/* Operador Igual */
( "=" ) {lexeme=yytext(); return Igual;}

/* Operador Suma */
( "+" ) {lexeme=yytext(); return Suma;}

/* Operador Resta */
( "-" ) {lexeme=yytext(); return Resta;}

/* Operador Multiplicacion */
( "*" ) {lexeme=yytext(); return Multiplicacion;}

/* Operador Division */
( "/" ) {lexeme=yytext(); return Division;}

/* Operador Modulo */
( "%" ) {lexeme=yytext(); return Modulo;}

/* Operadores logicos */
( "&&" | "||" | "!" | "&" | "|" ) {lexeme=yytext(); return Op_logico;}

/*Operadores Relacionales */
( ">" | "<" | "==" | "!=" | ">=" | "<=" | "<<" | ">>" ) {lexeme = yytext(); return Op_relacional;}

/* Operadores Atribucion */
( "+=" | "-="  | "*=" | "/=" | "%=" ) {lexeme = yytext(); return Op_atribucion;}

/* Operadores Incremento y decremento */
( "++" | "--" ) {lexeme = yytext(); return Op_incremento;}

/*Operadores Booleanos*/
(true | false)      {lexeme = yytext(); return Op_booleano;}

/* Numeral */
( "#" ) {lexeme=yytext(); return Numeral;}

/* Parentesis de apertura */
( "(" ) {lexeme=yytext(); return Parentesis_a;}

/* Parentesis de cierre */
( ")" ) {lexeme=yytext(); return Parentesis_c;}

/* Llave de apertura */
( "{" ) {lexeme=yytext(); return Llave_a;}

/* Llave de cierre */
( "}" ) {lexeme=yytext(); return Llave_c;}

/* Corchete de apertura */
( "[" ) {lexeme = yytext(); return Corchete_a;}

/* Corchete de cierre */
( "]" ) {lexeme = yytext(); return Corchete_c;}

/* Marcador de inicio de algoritmo */
( "main" ) {lexeme=yytext(); return Main;}

/* Coma */
( "," ) {lexeme=yytext(); return Coma;}

/* Punto y coma */
( ";" ) {lexeme=yytext(); return P_coma;}

/* Dos puntos */
( ":" ) {lexeme=yytext(); return Dos_P;}

/* Punto */
( "." ) {lexeme=yytext(); return Punto;}

/* Identificador */
{L}({L}|{D})* {lexeme=yytext(); return Identificador;}

/* Numero */
("(-"{D}+")")|{D}+ {lexeme=yytext(); return Numero;}

/* Error de analisis */
 . {return ERROR;}