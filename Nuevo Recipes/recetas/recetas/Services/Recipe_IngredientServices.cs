using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace recetas.Services
{
    public class Recipe_ingredientServices
    {
        public static string InsertOrUpdate(int? r_ingre, int recipe, int ingre, int qty, string obs)
        {
            try
            {
                string type = "U1";
                if (r_ingre == null)
                {
                    type = "I1";
                }

                SqlCommand command = new SqlCommand();
                command.Parameters.AddWithValue("i_action", type);
                command.Parameters.AddWithValue("i_recipe_ingredient", r_ingre);
                command.Parameters.AddWithValue("i_recipe", recipe);
                command.Parameters.AddWithValue("i_ingredient", ingre);
                command.Parameters.AddWithValue("i_quantity", qty);
                command.Parameters.AddWithValue("i_observation", obs);
                GeneralServices.ExecuteQuery(command, "recipes2..sp_recipe_ingredient");
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
            return "success";
        }

        internal static DataTable CmpID(string ing, string recipe)
        {
            DataTable result = new DataTable();
            try
            {
                SqlCommand command = new SqlCommand();
                command.Parameters.AddWithValue("i_action", "F2");
                command.Parameters.AddWithValue("i_recipe", recipe);
                command.Parameters.AddWithValue("i_ingredient", ing);
                result = GeneralServices.ExecuteQuery(command, "recipes2..sp_recipe_ingredient");
            }
            catch (Exception ex)
            {
                return result;
            }
            return result;
        }
    }
}