using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace recipes.Services
{
    public class OthersServices
    {
        public static string InsertOrUpdateUnit(int? unit, string name, string abbreviation)
        {
            try
            {
                string type = "U1";
                if (unit == null)
                {
                    type = "I1";
                }

                SqlCommand command = new SqlCommand();
                command.Parameters.AddWithValue("i_action", type);
                command.Parameters.AddWithValue("i_concept", 2);
                command.Parameters.AddWithValue("i_correlative", unit);
                command.Parameters.AddWithValue("i_name", name);
                command.Parameters.AddWithValue("i_abbreviation", abbreviation);
                GeneralServices.ExecuteQuery(command, "recipes2..sp_concept");
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
            return "success";
        }
        public static string InsertOrUpdateTurn(int? turn, string name, string abbreviation)
        {
            try
            {
                string type = "U1";
                if (turn == null)
                {
                    type = "I1";
                }

                SqlCommand command = new SqlCommand();
                command.Parameters.AddWithValue("i_action", type);
                command.Parameters.AddWithValue("i_concept", 1);
                command.Parameters.AddWithValue("i_correlative", turn);
                command.Parameters.AddWithValue("i_name", name);
                command.Parameters.AddWithValue("i_abbreviation", abbreviation);
                GeneralServices.ExecuteQuery(command, "recipes2..sp_concept");
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
            return "success";
        }
        public static string InsertOrUpdateCategiry(int? category, string name, string abbreviation)
        {
            try
            {
                string type = "U1";
                if (category == null)
                {
                    type = "I1";
                }

                SqlCommand command = new SqlCommand();
                command.Parameters.AddWithValue("i_action", type);
                command.Parameters.AddWithValue("i_concept", 3);
                command.Parameters.AddWithValue("i_correlative", category);
                command.Parameters.AddWithValue("i_name", name);
                command.Parameters.AddWithValue("i_abbreviation", abbreviation);
                GeneralServices.ExecuteQuery(command, "recipes2..sp_concept");
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
            return "success";
        }
        public static string InsertOrUpdateOrigin(int? origin, string name, string abbreviation)
        {
            try
            {
                string type = "U1";
                if (origin == null)
                {
                    type = "I1";
                }

                SqlCommand command = new SqlCommand();
                command.Parameters.AddWithValue("i_action", type);
                command.Parameters.AddWithValue("i_concept", 2);
                command.Parameters.AddWithValue("i_correlative", origin);
                command.Parameters.AddWithValue("i_name", name);
                command.Parameters.AddWithValue("i_abbreviation", abbreviation);
                GeneralServices.ExecuteQuery(command, "recipes2..sp_concept");
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
            return "success";
        }
        
    }
}