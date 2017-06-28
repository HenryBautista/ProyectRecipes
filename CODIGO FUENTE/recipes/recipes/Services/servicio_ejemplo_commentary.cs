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
    public static class CommentaryServices
    {

        public static string insert_commentary(int recipe, string text)
        {  
            try
            {
                SqlCommand command = new SqlCommand();
                command.Parameters.AddWithValue("i_action", "I1");
                command.Parameters.AddWithValue("i_recipe", recipe);
                command.Parameters.AddWithValue("i_text", text);
                GeneralServices.ExecuteQuery(command, "recipes..sp_commentary");
                return "success";
            }
            catch (Exception ex)
            {
                return ex.Message;
            }

        }

        public static string delete_commentary(int commentary)
        {  
            try
            {
                SqlCommand command = new SqlCommand();
                command.Parameters.AddWithValue("i_action", "D1");
                command.Parameters.AddWithValue("i_commentary", commentary);
                GeneralServices.ExecuteQuery(command, "recipes..sp_commentary");
                return "success";
            }
            catch (Exception ex)
            {
                return ex.Message;
            }

        }

        public static string update_commentary(int commentary, int recipe, string text)
        {  
            try
            {
                SqlCommand command = new SqlCommand();
                command.Parameters.AddWithValue("i_action", "U1");
                command.Parameters.AddWithValue("i_commentary", commentary);
                command.Parameters.AddWithValue("i_recipe", recipe);
                command.Parameters.AddWithValue("i_text", text);
                GeneralServices.ExecuteQuery(command, "recipes..sp_commentary");
                return "success";
            }
            catch (Exception ex)
            {
                return ex.Message;
            }

        }

        public static DataTable select_commentary(int commentary, int recipe, string text)
        {  
            DataTable result = new DataTable();
            try
            {
                SqlCommand command = new SqlCommand();
                command.Parameters.AddWithValue("i_action", "S1");
                result = GeneralServices.ExecuteQuery(command, "recipes..sp_commentary");
                return result;
            }
            catch (Exception ex)
            {
                return result;
            }

        }
    }
}