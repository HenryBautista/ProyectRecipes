using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using recipes.Util;

namespace recipes.Services
{
    public static class GeneralServices
    {
        private static string chain = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        public static DataTable ExecuteQuery(SqlCommand command, string t_name)
        {
            t_name = "sp_recipe_" + t_name;
            DataTable result = new DataTable();
            SqlConnection con = new SqlConnection();
            con.ConnectionString = chain;
            con.Open();
            command.Connection = con;
            command.CommandText = t_name;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandTimeout = 0;
            command.ExecuteNonQuery();
            SqlDataAdapter adapter = new SqlDataAdapter();
            adapter.SelectCommand = command;
            adapter.Fill(result);
            con.Close();
            return result;
        }
        public static DataTable Show_Data_table(string t_name, string type, int val)
        {
            DataTable result = new DataTable();
            try
            {
                string data = "i_" + t_name;
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

        public static string Delete_Data_Table(string t_name, int val)
        {
            try
            {
                string data = "i_" + t_name;
                SqlCommand command = new SqlCommand();
                command.Parameters.AddWithValue("i_action", "D1");
                command.Parameters.AddWithValue(data, val);
                ExecuteQuery(command,t_name);
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
            return "Ok";
        }        
    }
}