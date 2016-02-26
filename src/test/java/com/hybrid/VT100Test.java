package com.hybrid;

/**
 * Hello world!
 *
 */
public class VT100Test 
{
    public static void main( String[] args )
    {
       System.out.println("\033[2J");       
       System.out.println("\033[31;44m");
       System.out.print("\033[10;20f");
       System.out.println("HELLO VT100");
        
    }
}
