/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Analizador;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;



public class Analizador {
    public static void main(String[] args) throws Exception {
        /*
        String lexer= "../FinalCiencias3/src/Analizador/Lexer.flex";
        String lexicoCup= "../FinalCiencias3/src/Analizador/LexicoCup.flex";
        String[] Sintaxis={"-parser","Sintaxis","../FinalCiencias3/src/Analizador/Sintaxis.cup"}; 
        generarLex(lexer, lexicoCup, Sintaxis);
        */
        
        String lexer= "../Sintactico/src/Analizador/Lexer.flex";
        String lexicoCup= "../Sintactico/src/Analizador/LexicoCup.flex";
            String[] Sintaxis={"-parser","Sintaxis","../Sintactico/src/Analizador/Sintaxis.cup"}; 
        generarLex(lexer, lexicoCup, Sintaxis);
        
    }
    public static void generarLex(String lexer, String lexicoCup, String[] Sintaxis) throws IOException, Exception{
        File arc; 
        arc = new File(lexer);
        JFlex.Main.generate(arc);
        arc = new File(lexicoCup);
        JFlex.Main.generate(arc);
        java_cup.Main.main(Sintaxis);
        
        Path caminoSym = Paths.get("../Sintactico/src/Analizador/sym.java");
        if(Files.exists(caminoSym))
            Files.delete(caminoSym);
        
        Files.move(
                Paths.get("../Sintactico/sym.java"),
                Paths.get("../Sintactico/src/Analizador/sym.java")
        );
        
        Path caminoSint = Paths.get("../Sintactico/src/Analizador/Sintaxis.java");
        if(Files.exists(caminoSint))
            Files.delete(caminoSint);
        
        Files.move(
                Paths.get("../Sintactico/Sintaxis.java"),
                Paths.get("../Sintactico/src/Analizador/Sintaxis.java")
        );
    }
}
