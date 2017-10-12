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
        

        public static void FillDropwDownList(DropDownList ddl,int concepto,string accion)
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

        private static string chain = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        public static DataTable ExecuteQuery(SqlCommand command, string request_procedure)
        {
            DataTable result = new DataTable();
            SqlConnection con = new SqlConnection();
            con.ConnectionString = chain;
            con.Open();
            command.Connection = con;
            command.CommandText = request_procedure;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandTimeout = 0;
            SqlDataAdapter adapter = new SqlDataAdapter();
            adapter.SelectCommand = command;
            adapter.Fill(result);
            con.Close();
            return result;
        }


        public static DataTable Show_Data_table(string t_name, string type, int? val)
        {
            DataTable result = new DataTable();
            try
            {
                string data = "i_" + t_name;
                t_name = "recipes2..sp_" + t_name;
                SqlCommand command = new SqlCommand();
                command.Parameters.AddWithValue("i_action", type);
                command.Parameters.AddWithValue(data, val);
                result = ExecuteQuery(command, t_name);
            }
            catch (Exception ex)
            {
            }
            return result;
        }

        public static string Delete_this(string table, string sp, string value)
        {
            try
            {
                SqlCommand command = new SqlCommand();
                command.Parameters.AddWithValue("i_action", "D1");
                command.Parameters.AddWithValue("i_" + table, value);
                ExecuteQuery(command, sp);
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
            return "success";
        }
    }
}