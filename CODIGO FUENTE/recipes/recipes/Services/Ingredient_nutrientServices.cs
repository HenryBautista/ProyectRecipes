using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace recipes.Services
{
    public static class Ingredient_nutrientServices
    {
        public static string InsertOrUpdate(int? i_nutri, int nutri, int ingre, int qty)
        {
            string ms = "Update Ok";
            try
            {
                string type = "U1";
                if (i_nutri == null)
                {
                    type = "I1";
                    ms = "Insert Ok";
                }

                SqlCommand command = new SqlCommand();
                command.Parameters.AddWithValue("i_action", type);
                command.Parameters.AddWithValue("i_ingredient_nutrient", i_nutri);
                command.Parameters.AddWithValue("i_nutrient", nutri);
                command.Parameters.AddWithValue("i_ingredient", ingre);
                command.Parameters.AddWithValue("i_quantity", qty);
                GeneralServices.ExecuteQuery(command, "recipes..sp_ingredient_nutrient");
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
            return ms;
        }
                
    }
}