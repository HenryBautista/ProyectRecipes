using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace recipes.Services
{
    public static class DiscountServices
    {
        public static string InsertOrUpdate(int? discount, int recipe, int state, float qty)
        {
            try
            {
                string type = "U1";
                if (discount == null)
                {
                    type = "I1";
                }

                SqlCommand command = new SqlCommand();
                command.Parameters.AddWithValue("i_action", type);
                command.Parameters.AddWithValue("i_discount", discount);
                command.Parameters.AddWithValue("i_recipe", recipe);
                command.Parameters.AddWithValue("i_state", state);
                command.Parameters.AddWithValue("i_discount_quantity", qty);
                GeneralServices.ExecuteQuery(command, "recipes2..sp_discount");
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
            return "success";
        }
        
    }
}