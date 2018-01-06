using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace recipes.Services
{
    public static class IngredientServices
    {
        public static string InsertOrUpdate(int? i_ingre, string ingre,string image, string name, int unit, float cost,float qty, int category, int origin)
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
                command.Parameters.AddWithValue("i_image", image);
                command.Parameters.AddWithValue("i_name", name);
                command.Parameters.AddWithValue("i_unit", unit);
                command.Parameters.AddWithValue("i_cost", cost);
                command.Parameters.AddWithValue("i_quantity", qty);
                command.Parameters.AddWithValue("i_factor", (cost/qty));
                command.Parameters.AddWithValue("i_category", category);
                command.Parameters.AddWithValue("i_origin", origin);
                GeneralServices.ExecuteQuery(command, "recipes2..sp_ingredient");
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
            return "success";
        }
        public static DataTable getIngrdientNutrientGrd(int in_ingredient, int nGrid)
        {

            DataTable result = new DataTable();
            try
            {
                SqlCommand command = new SqlCommand();
                command.Parameters.AddWithValue("i_action", "F2");
                command.Parameters.AddWithValue("i_ingredient", in_ingredient);
                command.Parameters.AddWithValue("i_unit", nGrid);
                result = GeneralServices.ExecuteQuery(command, "recipes2..sp_ingredient");
            }
            catch (Exception ex)
            {
                return result;
            }                
            return result;
        }
        public static DataTable CmpID(string id)
        {

            DataTable result = new DataTable();
            try
            {
                SqlCommand command = new SqlCommand();
                command.Parameters.AddWithValue("i_action", "F1");
                command.Parameters.AddWithValue("i_name", id);
                result = GeneralServices.ExecuteQuery(command, "recipes2..sp_ingredient");
            }
            catch (Exception ex)
            {
                return result;
            }
            return result;
        }

        internal static DataTable GetByCatOrigin(string category, string origin)
        {

            DataTable result = new DataTable();
            try
            {
                SqlCommand command = new SqlCommand();
                command.Parameters.AddWithValue("i_action", "F3");
                command.Parameters.AddWithValue("i_category", category);
                command.Parameters.AddWithValue("i_origin", origin);
                result = GeneralServices.ExecuteQuery(command, "recipes2..sp_ingredient");
            }
            catch (Exception ex)
            {
                return result;
            }
            return result;
        }
    }
}