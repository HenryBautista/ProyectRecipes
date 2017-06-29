using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace recipes.Services
{
    public class Recipe_ingredient
    {
        public static string InsertOrUpdate(int? r_ingre, int recipe, int ingre, int qty, string obs)
        {
            string ms = "Update Ok";
            try
            {
                string type = "U1";
                if (r_ingre == null)
                {
                    type = "I1";
                    ms = "Insert Ok";
                }

                SqlCommand command = new SqlCommand();
                command.Parameters.AddWithValue("i_action", type);
                command.Parameters.AddWithValue("i_recipe_ingredient", r_ingre);
                command.Parameters.AddWithValue("i_recipe", recipe);
                command.Parameters.AddWithValue("i_ingredient", ingre);
                command.Parameters.AddWithValue("i_quantity", qty);
                command.Parameters.AddWithValue("i_observation", obs);
                GeneralServices.ExecuteQuery(command, "recipes..sp_recipe_ingredient");
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
            return ms;
        }
        
    }
}