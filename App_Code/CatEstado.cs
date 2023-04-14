using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

/// <summary>
/// Descripción breve de CatEstado
/// </summary>
public class CatEstado
{
    public CatEstado()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }
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
            cmd.CommandText = "bitaseg.proc_CatEdoLista";
            SqlDataReader dr = cmd.ExecuteReader();
            cbo.Items.Clear();
            if (seleccionar)
            {
                ListItem li = new ListItem("SELECCIONE UN ESTADO", "");
                li.Attributes.Add("style", "color:silver");
                li.Selected = true;
                cbo.Items.Add(li);
            }
            while (dr.Read())
            {
                ListItem li = new ListItem(String.Format("{0} - {1}", dr["id_estado"], dr["estado"]), dr["id_estado"].ToString());
                cbo.Items.Add(li);
            }

            dr.Close();

        }

        catch (Exception ex) { throw (ex); }
        finally { cnn.Close(); cnn.Dispose(); }
    }

    public void MostrarLista(DropDownList cbo, bool pSeleccionar)
    {
        try
        {
            seleccionar = pSeleccionar;
            MostrarLista(cbo);
        }
        catch (Exception ex) { throw ex; }
    }

    
}