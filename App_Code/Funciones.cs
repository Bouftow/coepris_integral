using System;
using System.Collections.Generic;
using System.Web;

/// <summary>
/// Descripción breve de Funciones
/// </summary>
public class Funciones
{



    public Funciones()
    {

    }

    public static string LSCMGcerosizq(int valor)
    {
        string result = "";
        for (int i = valor.ToString().Length; i <= 7; i++)
        {
            result += "0";


        }
            
        return result + valor.ToString();

        //return "LSCMG" + result + valor.ToString();
    }

}