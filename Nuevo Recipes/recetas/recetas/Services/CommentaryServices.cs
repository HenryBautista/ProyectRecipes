﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace recetas.Services
{
    public class CommentaryServices
    {
        public static string InsertOrUpdate(int? commentary, int recipe, string text)
        {
            try
            {
                string type = "U1";
                if (commentary == null)
                {
                    type = "I1";
                }

                SqlCommand command = new SqlCommand();
                command.Parameters.AddWithValue("i_action", type);
                command.Parameters.AddWithValue("i_commentary", commentary);
                command.Parameters.AddWithValue("i_recipe", recipe);
                command.Parameters.AddWithValue("i_text", text);
                GeneralServices.ExecuteQuery(command, "recipes2..sp_commentary");
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
            return "success";
        }
        
    }
}