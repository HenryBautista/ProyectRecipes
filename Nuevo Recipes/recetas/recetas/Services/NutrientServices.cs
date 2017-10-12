using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace recetas.Services
{
    public static class NutrientServices
    {
        public static string InsertOrUpdate(int? nutri, string name)
        {
            try
            {
                string type = "U1";
                if (nutri == null)
                {
                    type = "I1";
                }

                SqlCommand command = new SqlCommand();
                command.Parameters.AddWithValue("i_action", type);
                command.Parameters.AddWithValue("i_nutrient", nutri);
                command.Parameters.AddWithValue("i_name", name);
                //command.Parameters.AddWithValue("i_quantity", qty);
                GeneralServices.ExecuteQuery(command, "recipes2..sp_nutrient");
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
            return "success";
        }

        internal static DataTable CmpID(string name)
        {

            DataTable result = new DataTable();
            try
            {
                SqlCommand command = new SqlCommand();
                command.Parameters.AddWithValue("i_action", "F1");
                command.Parameters.AddWithValue("i_name", name);
                result = GeneralServices.ExecuteQuery(command, "recipes2..sp_nutrient");
            }
            catch (Exception ex)
            {
                return result;
            }
            return result;
        }
    }
}