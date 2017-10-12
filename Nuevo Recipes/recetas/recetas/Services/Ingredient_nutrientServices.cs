using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace recetas.Services
{
    public static class Ingredient_nutrientServices
    {
        public static string InsertOrUpdate(int? i_nutri, int nutri, int ingre, int qty)
        {
            try
            {
                string type = "U1";
                if (i_nutri == null)
                {
                    type = "I1";
                }

                SqlCommand command = new SqlCommand();
                command.Parameters.AddWithValue("i_action", type);
                command.Parameters.AddWithValue("i_ingredient_nutrient", i_nutri);
                command.Parameters.AddWithValue("i_nutrient", nutri);
                command.Parameters.AddWithValue("i_ingredient", ingre);
                command.Parameters.AddWithValue("i_quantity", qty);
                GeneralServices.ExecuteQuery(command, "recipes2..sp_ingredient_nutrient");
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
            return "success";
        }

        internal static DataTable CmpID(int nutri,int in_ingre)
        {
            DataTable result = new DataTable();
            try
            {
                SqlCommand command = new SqlCommand();
                command.Parameters.AddWithValue("i_action", "F1");
                command.Parameters.AddWithValue("i_nutrient", nutri);
                command.Parameters.AddWithValue("i_ingredient", in_ingre);
                result = GeneralServices.ExecuteQuery(command, "recipes2..sp_ingredient_nutrient");
            }
            catch (Exception ex)
            {
                return result;
            }


            return result;
        }
    }
}