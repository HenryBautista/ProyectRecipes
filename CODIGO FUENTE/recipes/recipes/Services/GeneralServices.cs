﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace recipes.Services
{
    public static class GeneralServices
    {
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
            //command.ExecuteNonQuery();
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
                t_name = "recipes..sp_" + t_name;
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
    }
}