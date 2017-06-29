using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace recipes.Services
{
    public static class NutrientServices
    {
        public static string InsertOrUpdate(int? nutri, string name)
        {
            string ms = "Update Ok";
            try
            {
                string type = "U1";
                if (nutri == null)
                {
                    type = "I1";
                    ms = "Insert Ok";
                }

                SqlCommand command = new SqlCommand();
                command.Parameters.AddWithValue("i_action", type);
                command.Parameters.AddWithValue("i_nutrient", nutri);
                command.Parameters.AddWithValue("i_name", name);
                //command.Parameters.AddWithValue("i_quantity", qty);
                GeneralServices.ExecuteQuery(command, "recipes..sp_nutrient");
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
            return ms;
        }
       
    }
}