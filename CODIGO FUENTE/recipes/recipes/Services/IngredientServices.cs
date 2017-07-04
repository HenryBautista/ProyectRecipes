using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace recipes.Services
{
    public static class IngredientServices
    {
        public static string InsertOrUpdate(int? i_ingre, string ingre, string name, int unit, float cost, float factor, int category, int origin)
        {
            try
            {
                string type = "U1";
                if (i_ingre == null)
                {
                    type = "I1";
                }

                SqlCommand command = new SqlCommand();
                command.Parameters.AddWithValue("i_action", type);
                command.Parameters.AddWithValue("i_ingredient", i_ingre);
                command.Parameters.AddWithValue("i_ingredient_id", ingre);
                command.Parameters.AddWithValue("i_name", name);
                command.Parameters.AddWithValue("i_unit", unit);
                command.Parameters.AddWithValue("i_cost", cost);
                command.Parameters.AddWithValue("i_factor", factor);
                command.Parameters.AddWithValue("i_category", category);
                command.Parameters.AddWithValue("i_origin", origin);
                GeneralServices.ExecuteQuery(command, "recipes..sp_ingredient");
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
            return "success";
        }
       
    }
}