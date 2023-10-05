using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft;
using Newtonsoft.Json;
using System.Web.Script.Services;

public partial class sistema_sst_Metodos : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    // Método que obtiene los datos de la base de datos y devuelve los datos en formato JSON
    [WebMethod]
    public static object ObtenerDatos(string opcionSeleccionada)
    {
        List<string> columnas = new List<string>();
        List<List<object>> filas = new List<List<object>>();

        // Código para realizar la consulta a la base de datos según la opción seleccionada
        using (SqlConnection connection = new SqlConnection(Principal.CnnStr0))
        {
            connection.Open();
            using (SqlCommand command = new SqlCommand())
            {
                command.Connection = connection;

                // Según la opción seleccionada, configura la consulta SQL
                if (opcionSeleccionada == "1")
                {
                    command.CommandText = "SELECT e.estatus AS descripcion_estado, COUNT(s.id_estatus) AS cantidad_solicitudes " +
                        "FROM sst_atn.Solicitudes s " +
                        "INNER JOIN sst_atn.Estatus e ON s.id_estatus = e.id_estatus " +
                        "where id_origen = 1 " +
                        "GROUP BY e.estatus; ";
                }
                else if (opcionSeleccionada == "2")
                {
                    command.CommandText = "SELECT e.estatus AS descripcion_estado, COUNT(s.id_estatus) AS cantidad_solicitudes " +
                       "FROM sst_atn.Solicitudes s " +
                       "INNER JOIN sst_atn.Estatus e ON s.id_estatus = e.id_estatus " +
                       "where id_origen = 2 " +
                       "GROUP BY e.estatus; ";
                }
                else if (opcionSeleccionada == "3")
                {
                    command.CommandText = "SELECT e.estatus AS descripcion_estado, COUNT(s.id_estatus) AS cantidad_solicitudes " +
                       "FROM sst_atn.Solicitudes s " +
                       "INNER JOIN sst_atn.Estatus e ON s.id_estatus = e.id_estatus " +
                       "where id_origen = 3 " +
                       "GROUP BY e.estatus; ";
                }
                else if (opcionSeleccionada == "4")
                {
                    command.CommandText = "SELECT e.estatus AS descripcion_estado, COUNT(s.id_estatus) AS cantidad_solicitudes " +
                       "FROM sst_atn.Solicitudes s " +
                       "INNER JOIN sst_atn.Estatus e ON s.id_estatus = e.id_estatus " +
                       "where id_origen = 4 " +
                       "GROUP BY e.estatus; ";
                }
                else if (opcionSeleccionada == "5")
                {
                    command.CommandText = "SELECT e.estatus AS descripcion_estado, COUNT(s.id_estatus) AS cantidad_solicitudes " +
                       "FROM sst_atn.Solicitudes s " +
                       "INNER JOIN sst_atn.Estatus e ON s.id_estatus = e.id_estatus " +
                       "where id_origen = 5 " +
                       "GROUP BY e.estatus; ";
                }
                else if (opcionSeleccionada == "6")
                {
                    command.CommandText = "SELECT e.estatus AS descripcion_estado, COUNT(s.id_estatus) AS cantidad_solicitudes " +
                       "FROM sst_atn.Solicitudes s " +
                       "INNER JOIN sst_atn.Estatus e ON s.id_estatus = e.id_estatus " +
                       "where id_origen = 6 " +
                       "GROUP BY e.estatus; ";
                }
                else if (opcionSeleccionada == "7")
                {
                    command.CommandText = "SELECT e.estatus AS descripcion_estado, COUNT(s.id_estatus) AS cantidad_solicitudes " +
                       "FROM sst_atn.Solicitudes s " +
                       "INNER JOIN sst_atn.Estatus e ON s.id_estatus = e.id_estatus " +
                       "where id_origen = 7 " +
                       "GROUP BY e.estatus; ";

                }
                else if (opcionSeleccionada == "8")
                {
                    command.CommandText = "SELECT e.estatus AS descripcion_estado, COUNT(s.id_estatus) AS cantidad_solicitudes " +
                       "FROM sst_atn.Solicitudes s " +
                       "INNER JOIN sst_atn.Estatus e ON s.id_estatus = e.id_estatus " +
                       "where id_origen = 8 " +
                       "GROUP BY e.estatus; ";
                }
                else if (opcionSeleccionada == "9")
                {
                    command.CommandText = "SELECT e.estatus AS descripcion_estado, COUNT(s.id_estatus) AS cantidad_solicitudes " +
                       "FROM sst_atn.Solicitudes s " +
                       "INNER JOIN sst_atn.Estatus e ON s.id_estatus = e.id_estatus " +
                       "where id_origen = 9 " +
                       "GROUP BY e.estatus; ";
                }
                else if (opcionSeleccionada == "10")
                {
                    command.CommandText = "SELECT e.estatus AS descripcion_estado, COUNT(s.id_estatus) AS cantidad_solicitudes " +
                       "FROM sst_atn.Solicitudes s " +
                       "INNER JOIN sst_atn.Estatus e ON s.id_estatus = e.id_estatus " +
                       "where id_origen = 10 " +
                       "GROUP BY e.estatus; ";
                }
                else 
                {
                    command.CommandText = "SELECT o.origen AS descripcion_estado, COUNT(s.id_solicitud) AS cantidad_solicitudes " +
                     "  FROM sst_atn.Solicitudes s " +
                     "  INNER JOIN sst_atn.origen o ON s.id_origen = o.id_origen " +
                     "  GROUP BY o.origen; ";
                }
                // Agrega más casos según las opciones disponibles

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    // Agrega los nombres de las columnas a la lista de columnas
                    for (int i = 0; i < reader.FieldCount; i++)
                    {
                        columnas.Add(reader.GetName(i));
                    }

                    // Agrega los datos a la lista de filas
                    while (reader.Read())
                    {
                        List<object> rowData = new List<object>();
                        for (int i = 0; i < reader.FieldCount; i++)
                        {
                            // Verificar si el valor es nulo y reemplazarlo por un valor predeterminado
                            if (reader.IsDBNull(i))
                            {
                                rowData.Add(0); // Reemplaza los valores nulos por 0
                            }
                            else
                            {
                                // Verificar si el valor es numérico y agregarlo como tal
                                if (reader.GetFieldType(i) == typeof(int) || reader.GetFieldType(i) == typeof(decimal))
                                {
                                    rowData.Add(Convert.ToInt32(reader[i])); // Convertir a int
                                }
                                else
                                {
                                    rowData.Add(reader[i].ToString());
                                }
                            }
                        }
                        filas.Add(rowData);
                        
                    }
                }
            }
        }

        // Crea un objeto JSON con las columnas y las filas
        var result = new
        {
            columnas = columnas,
            filas = filas
        };

        return result;
    }


    [WebMethod]
    public static List<object> ObtenerHistorialObservaciones(int idSolicitud)
    {
        // Conectarse a la base de datos utilizando la clase de conexión
        using (SqlConnection connection = new SqlConnection(Principal.CnnStr0))
        {
            connection.Open();

            // Consulta SQL para obtener el historial de observaciones
            string sql = "SELECT ho.fecha_reg, ho.id_solicitud, ho.id_historial_observaciones, ho.observaciones, e.estatus , s.solicitud FROM sst_atn.historial_observaciones ho INNER JOIN sst_atn.estatus e ON ho.id_estatus = e.id_estatus INNER JOIN sst_atn.solicitudes s on ho.id_solicitud = s.id_solicitud  WHERE ho.id_solicitud = @idSolicitud order by ho.id_historial_observaciones";

            SqlCommand command = new SqlCommand(sql, connection);
            command.Parameters.AddWithValue("@idSolicitud", idSolicitud);

            List<object> historial = new List<object>();

            using (SqlDataReader reader = command.ExecuteReader())
            {
                while (reader.Read())
                {
                    DateTime fechaReg = (DateTime)reader["fecha_reg"];
                    string fechaFormateada = fechaReg.ToString("yyyy-MM-dd HH:mm:ss");

                    historial.Add(new
                    {
                        id_historial_observaciones = reader["id_historial_observaciones"],
                        observaciones = reader["observaciones"],
                        estatus = reader["estatus"],
                        solicitud = reader["solicitud"],
                        fecha_reg = fechaFormateada
                    });
                }
            }

            // Retorna la lista de objetos directamente
            return historial;
        }
    }


    [WebMethod]
    public static string GuardarDatos(int id, string observaciones, string id_estatus)
    {
        try
        {
            
            using (SqlConnection connection = new SqlConnection(Principal.CnnStr0))
            {
                connection.Open();

                    string sql = "INSERT INTO sst_atn.historial_observaciones (id_solicitud, observaciones, id_estatus) VALUES (@id, @observaciones, @id_Estatus)" +
                    " update sst_atn.solicitudes set id_estatus = @id_Estatus where id_solicitud = @Id ";

                SqlCommand command = new SqlCommand(sql, connection);
                command.Parameters.AddWithValue("@Id", id);
                command.Parameters.AddWithValue("@Observaciones", observaciones.ToUpper());
                command.Parameters.AddWithValue("@id_Estatus", id_estatus);

                command.ExecuteNonQuery();


            }

            // Después de guardar los datos exitosamente, puedes retornar 'OK' como respuesta
            return "OK";
        }
        catch (Exception ex)
        {
            // Maneja las excepciones aquí y retorna un mensaje de error si es necesario
            return "Error al guardar los datos: " + ex.Message;
        }
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<Dictionary<string, string>> CargarTablas(string opcion)
    {
        List<Dictionary<string, string>> datos = new List<Dictionary<string, string>>();


        using (SqlConnection con = new SqlConnection(Principal.CnnStr0))
        {
            con.Open();
            string query = "";

            switch (Convert.ToInt32(opcion))
            {
                case 1:
                case 2:
                case 3:
                case 4:
                case 5:
                case 6:
                case 7:
                case 8:
                case 9:
                case 10:
                    query = 
                       "SELECT e.estatus AS Estatus, COUNT(s.id_estatus) AS Cantidad " +
                       "FROM sst_atn.Solicitudes s " +
                       "INNER JOIN sst_atn.Estatus e ON s.id_estatus = e.id_estatus " +
                       "where id_origen = "+ opcion + " " +
                       "GROUP BY e.estatus;";
                    break;
                case 99:
                    query = "SELECT o.origen AS Origen, " +
       " SUM(CASE WHEN e.id_estatus = 0 THEN 1 ELSE 0 END) AS Proceso, " +
       " SUM(CASE WHEN e.id_estatus = 1 THEN 1 ELSE 0 END) AS Atendido, " +
       " sum(CASE WHEN e.id_estatus = 2 THEN 1 ELSE 0 END) AS Finiquitado, " +
       " SUM(CASE WHEN e.id_estatus = 3 THEN 1 ELSE 0 END) AS 'Atendido Negativo', " +
       " SUM(CASE WHEN e.id_estatus = 4 THEN 1 ELSE 0 END) AS Cancelado, " +
       " SUM(CASE WHEN e.id_estatus IN (0,1,2,3,4) THEN 1 ELSE 0 END) AS Total " +
       " FROM sst_atn.Solicitudes s " +
       " INNER JOIN sst_atn.origen o ON s.id_origen = o.id_origen " +
       " INNER JOIN sst_atn.estatus e ON s.id_estatus = e.id_estatus " +
       " GROUP BY o.origen; ";
                    break;
                default:
                    query = "select 'No se encontró la opción seleccionada' as Error";
                    break;
            }

         
         
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        Dictionary<string, string> fila = new Dictionary<string, string>();

                        for (int i = 0; i < reader.FieldCount; i++)
                        {
                            string nombreColumna = reader.GetName(i);
                            string valorColumna = reader[i].ToString();
                            fila[nombreColumna] = valorColumna;
                        }

                        datos.Add(fila);
                    }
                }
            }
        }

        return datos;
    }

    static ConsultaCURP.ws service = new ConsultaCURP.ws();

    [System.Web.Services.WebMethod]
    public static string BuscarCURPlinea(string curp)
    {
        try
        {
            service.Url = Principal.WebConfig("ConsultaCURP.ws");//Establecer la URL del Web Service         
            string mensaje = service.BuscarCURP(curp, Principal.WebConfig("UsKeyAPI"), Principal.WebConfig("PassKeyAPI"));
            //    string mensaje = "";
            return mensaje;
        }
        catch (Exception ex) { return ex.Message; }
    }

}
    
