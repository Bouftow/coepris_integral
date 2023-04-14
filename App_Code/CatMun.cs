using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using Salud.Tamaulipas;
/// <summary>
/// Descripción breve de CatMun
/// </summary>
public class CatMun
{
	public CatMun()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}

    int id_filtro = 28;
    string filtro = "edo";
    private bool seleccionar = false;

    public void MostrarLista(DropDownList cbo)
    {
        SqlConnection cnn = new SqlConnection(Principal.CnnStr0);
        try
        {
            cnn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cnn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "bitaseg.proc_CatMunLista";
            cmd.Parameters.Add("@id", SqlDbType.SmallInt).Value = id_filtro;
            cmd.Parameters.Add("@filtro", SqlDbType.NVarChar,3).Value = filtro;
            SqlDataReader dr = cmd.ExecuteReader();
            cbo.Items.Clear();
            if (seleccionar)
            {
                ListItem li = new ListItem("SELECCIONE UN MUNICIPIO", "");
                li.Attributes.Add("style","color:silver");
                li.Selected = true;
                cbo.Items.Add(li);
            }
            while (dr.Read())
            {
                ListItem li = new ListItem(String.Format("{0} - {1}", dr["id_mun"], dr["nombre_mun"]), dr["id_mun"].ToString());
                cbo.Items.Add(li);
            }
            dr.Close();
        }

        catch (Exception ex) { throw (ex); }
        finally { cnn.Close(); cnn.Dispose(); }
    }

    public void MostrarLista(DropDownList cbo,bool pSeleccionar)
    {
        try
        {
            seleccionar = pSeleccionar;
            MostrarLista(cbo);
        }
        catch (Exception ex) { throw ex; }
    }

    public void MostrarLista(int idFiltro, DropDownList cbo,bool pSeleccionar)
    {
        try
        {
            seleccionar = pSeleccionar;
            id_filtro = idFiltro;
            MostrarLista(cbo);
        }
        catch (Exception ex) { throw ex; }
    }
    /// <summary>
    /// 
    /// </summary>
    /// <param name="filtrarPor">Opciones: "mun", "jur"</param>
    /// <param name="idFiltro"></param>
    /// <param name="cbo"></param>
    public void MostrarLista(string filtrarPor, int idFiltro, DropDownList cbo)
    {
        try
        {
            filtro = filtrarPor;
            id_filtro = idFiltro;
            MostrarLista(cbo);
        }
        catch (Exception ex) { throw ex; }
    }
    /// <summary>
    /// 
    /// </summary>
    /// <param name="filtrarPor">Opciones: "mun", "jur"</param>
    /// <param name="idFiltro"></param>
    /// <param name="cbo"></param>
    /// <param name="pSeleccionar"></param>
    public void MostrarLista(string filtrarPor,int idFiltro, DropDownList cbo, bool pSeleccionar)
    {
        try
        {
            seleccionar = pSeleccionar;
            filtro = filtrarPor;
            id_filtro = idFiltro;
            MostrarLista(cbo);
        }
        catch (Exception ex) { throw ex; }
    }
}