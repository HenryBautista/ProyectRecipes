using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace recetas.Services
{
    public class GeneralServices
    {
        public static string cadena = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        

        public void FillDropwDownList(DropDownList ddl,int concepto,string accion)
        {
            DataTable dt = new DataTable();
            using (SqlConnection conexion = new SqlConnection(cadena))
            {
                conexion.Open();
                using (SqlCommand comando = new SqlCommand())
                {
                    comando.Connection = conexion;
                    comando.CommandText = "recipes2..sp_concept";
                    comando.CommandType = CommandType.StoredProcedure;
                    comando.CommandTimeout = 0;
                    comando.Parameters.AddWithValue("@i_action", accion);
                    comando.Parameters.AddWithValue("@i_concept",concepto);
                    ddl.DataSource = comando.ExecuteReader();
                    ddl.DataTextField = "co_name";
                    ddl.DataValueField = "co_correlative";
                    ddl.DataBind();
                    conexion.Close();
                }
            }
            ddl.Items.Insert(0, new ListItem("Seleccionar...", "0"));
        }
    }
}