using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class _default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Cargar();


        //SqlConnection cnn = new SqlConnection();
        //cnn.ConnectionString = Principal.CnnStr0;
        //cnn.Open();

        //SqlCommand cmd = new SqlCommand();
        //cmd.CommandType = CommandType.Text;
        //cmd.CommandText = "select proveedores.id_proveedor, " + proveedor + ", " + telefono + ", " + direccion + "," + insumos + "," + monto + "," + fecha_factura + "," + user_reg + "," + fecha_reg + "," + todo + " " +
        //    "from bitaseg.Proveedores_Insumos inner join bitaseg.proveedores on Proveedores_Insumos.id_proveedor = proveedores.id_proveedor " +
        //    "where (nombre_proveedor LIKE '%" + like.Text + "%') and Proveedores_Insumos.coordinacion=" + coord + " and " + between + " between CONVERT(datetime,('" + fecha1.ToString("s") + "')) and  CONVERT(datetime,('" + fecha2.ToString("s") + "'))" +
        //    "Order by " + ordenar + "  " + ak + " ";

        //cmd.Connection = cnn;

        //DataTable dtCAN = new DataTable();
        //SqlDataAdapter daCAN = new SqlDataAdapter(cmd);



        //daCAN.Fill(dtCAN);

        //grdCancelados.DataSource = dtCAN;

        ////grdCancelados.DataBind();
        //cnn.Close(); // siempre cerrar conexiones.

        if (!Page.IsPostBack)
        {



        }
    }
    protected void Cargar()
    {
        Usuarios usuarios = new Usuarios();
        usuarios.DatosDeRegistro(User.Identity.Name);
        SqlConnection cnn = new SqlConnection(Principal.CnnStr0);
        try
        {
            cnn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cnn;

            cmd.CommandText = " select * from Dctm.usuarios " +
                " inner join bitaseg.users on Usuarios.user_login = users.user_login" +
                " inner join bitaseg.persona ON Usuarios.user_login = persona.user_login" +
                " inner join bitaseg.Coordinaciones on Usuarios.id_coordinacion = Coordinaciones.id_coordinacion" +
                " where persona.id_persona = @par";


            //PARAMS
            cmd.Parameters.Add("@par", SqlDbType.Int).Value = usuarios.Id_Persona;
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                if (!(bool)dr["Abasolo"]) { abasolo.Visible = false; }
                if (!(bool)dr["Aldama"]) { aldama.Visible = false; }
                if (!(bool)dr["Altamira"]) { altamira.Visible = false; }
                if (!(bool)dr["Antiguo_Morelos"]) { antiguo_morelos.Visible = false; }
                if (!(bool)dr["Burgos"]) { burgos.Visible = false; }
                if (!(bool)dr["Bustamante"]) { bustamante.Visible = false; }
                if (!(bool)dr["Camargo"]) { camargo.Visible = false; }
                if (!(bool)dr["Casas"]) { casas.Visible = false; }
                if (!(bool)dr["Cruillas"]) { cruillas.Visible = false; }
                if (!(bool)dr["Güemez"]) { guemez.Visible = false; }
                if (!(bool)dr["Gomez_Farias"]) { gomez_farias.Visible = false; }
                if (!(bool)dr["Gonzalez"]) { gonzalez.Visible = false; }
                if (!(bool)dr["Guerrero"]) { guerrero.Visible = false; }
                if (!(bool)dr["Gustavo_Diaz_Ordaz"]) { diaz_ordaz.Visible = false; }
                if (!(bool)dr["Hidalgo"]) { hidalgo.Visible = false; }
                if (!(bool)dr["Jaumave"]) { jaumave.Visible = false; }
                if (!(bool)dr["Jimenez"]) { jimenez.Visible = false; }
                if (!(bool)dr["Llera"]) { llera.Visible = false; }
                if (!(bool)dr["Madero"]) { madero.Visible = false; }
                if (!(bool)dr["Mainero"]) { mainero.Visible = false; }
                if (!(bool)dr["Mante"]) { mante.Visible = false; }
                if (!(bool)dr["Matamoros"]) { matamoros.Visible = false; }
                if (!(bool)dr["Mendez"]) { mendez.Visible = false; }
                if (!(bool)dr["Mier"]) { mier.Visible = false; }
                if (!(bool)dr["Miguel_Aleman"]) { miguel_aleman.Visible = false; }
                if (!(bool)dr["Miquihuana"]) { miquihuana.Visible = false; }
                if (!(bool)dr["Nuevo_Laredo"]) { nuevo_laredo.Visible = false; }
                if (!(bool)dr["Nuevo_Morelos"]) { nuevo_morelos.Visible = false; }
                if (!(bool)dr["Ocampo"]) { ocampo.Visible = false; }
                if (!(bool)dr["Padilla"]) { padilla.Visible = false; }
                if (!(bool)dr["Palmillas"]) { palmillas.Visible = false; }
                if (!(bool)dr["Reynosa"]) { reynosa.Visible = false; }
                if (!(bool)dr["Rio_Bravo"]) { rio_bravo.Visible = false; }
                if (!(bool)dr["San_Carlos"]) { san_carlos.Visible = false; }
                if (!(bool)dr["San_Fernando"]) { sanfer.Visible = false; }
                if (!(bool)dr["San_Nicolas"]) { san_nicolas.Visible = false; }
                if (!(bool)dr["Soto_la_Marina"]) { sotolamarina.Visible = false; }
                if (!(bool)dr["Tampico"]) { tampico.Visible = false; }
                if (!(bool)dr["Tula"]) { tula.Visible = false; }
                if (!(bool)dr["Valle_Hermoso"]) { valle_hermoso.Visible = false; }
                if (!(bool)dr["Victoria"]) { victoria.Visible = false; }
                if (!(bool)dr["Villagran"]) { villagran.Visible = false; }
                if (!(bool)dr["Xicotencatl"]) { xico.Visible = false; }

                id_coordinacion.Text = dr["id_coordinacion"].ToString() ;
                
            }

            dr.Close();

        }

        catch (Exception ex) { throw (ex); }
        finally { cnn.Close(); cnn.Dispose(); }



    }
}