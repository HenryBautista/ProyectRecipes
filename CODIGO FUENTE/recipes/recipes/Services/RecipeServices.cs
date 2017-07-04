using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace recipes.Services
{
    public static class RecipeServices
    {
        public static string InsertOrUpdate(int? recipe, string i_recipe, string name, int turn, string image, float tc, string obs, int usr)
        {
            try
            {
                string type = "U1";
                if (recipe == null)
                {
                    type = "I1";
                }

                SqlCommand command = new SqlCommand();
                command.Parameters.AddWithValue("i_action", type);
                command.Parameters.AddWithValue("i_recipe", recipe);
                command.Parameters.AddWithValue("i_recipe_id", i_recipe);
                command.Parameters.AddWithValue("i_name", name);
                command.Parameters.AddWithValue("i_turn", turn);
                command.Parameters.AddWithValue("i_image", image);
                command.Parameters.AddWithValue("i_total_cost", tc);
                command.Parameters.AddWithValue("i_observation", obs);
                command.Parameters.AddWithValue("i_of_user", usr);
                GeneralServices.ExecuteQuery(command, "recipes..sp_recipe");
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
            return "success";
        }

        internal static DataTable GetAllRecipes()
        {
            DataTable result = new DataTable();
            try
            {
                SqlCommand command = new SqlCommand();
                command.Parameters.AddWithValue("i_action", "S1");
                result = GeneralServices.ExecuteQuery(command, "recipes..sp_recipe_recipe");
            }
            catch (Exception)
            {
                result = new DataTable();
            }
            return result;
        }
    }
}