﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace recipes.Services
{
    public static class User_recipeServices
    {
        public static string InsertOrUpdate(int? u_recipe, int usr, int recipe)
        {
            try
            {
                string type = "U1";
                if (u_recipe == null)
                {
                    type = "I1";
                }

                SqlCommand command = new SqlCommand();
                command.Parameters.AddWithValue("i_action", type);
                command.Parameters.AddWithValue("i_user_recipe", u_recipe);
                command.Parameters.AddWithValue("i_user", usr);
                command.Parameters.AddWithValue("i_recipe", recipe);
                GeneralServices.ExecuteQuery(command, "recipes2..sp_user_recipe");
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
            return "success";
        }      
    }
}