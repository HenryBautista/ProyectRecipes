using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace recipes.Services
{
    public static class Recipe_orderServices
    {
        public static string InsertOrUpdate(int? r_order, int order, int recipeOingredient, int qty, float price, int person,int isrecipe )
        {
            try
            {
                string type = "U1";
                if (r_order == null)
                {
                    type = "I1";
                }

                SqlCommand command = new SqlCommand();
                command.Parameters.AddWithValue("i_action", type);
                command.Parameters.AddWithValue("i_recipe_order", r_order);
                command.Parameters.AddWithValue("i_order", order);
                command.Parameters.AddWithValue("i_key", recipeOingredient);
                command.Parameters.AddWithValue("i_type", isrecipe);
                command.Parameters.AddWithValue("i_quantity", qty);
                command.Parameters.AddWithValue("i_price", price);
                command.Parameters.AddWithValue("i_person", person);
                GeneralServices.ExecuteQuery(command, "recipes2..sp_recipe_order");
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
            return "success";
        }

        internal static DataTable CmpRecipeExist(int order, int recipeOingredient)
        {
            DataTable result = new DataTable();

            try
            {
                SqlCommand command = new SqlCommand();
                command.Parameters.AddWithValue("i_action", "F1");
                command.Parameters.AddWithValue("i_order", order);
                command.Parameters.AddWithValue("i_key", recipeOingredient);
                result = GeneralServices.ExecuteQuery(command, "recipes2..sp_recipe_order");
            }
            catch (Exception ex)
            {
                return result;
            }
            return result;
        }
        internal static DataTable CmpIngredientExist(int order, int recipeOingredient)
        {
            DataTable result = new DataTable();

            try
            {
                SqlCommand command = new SqlCommand();
                command.Parameters.AddWithValue("i_action", "F2");
                command.Parameters.AddWithValue("i_order", order);
                command.Parameters.AddWithValue("i_key", recipeOingredient);
                result = GeneralServices.ExecuteQuery(command, "recipes2..sp_recipe_order");
            }
            catch (Exception ex)
            {
                return result;
            }
            return result;
        }
    }
}