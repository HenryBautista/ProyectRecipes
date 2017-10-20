using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace recipes.Services
{
    public class OthersServices
    {
        public static string InsertOrUpdateUnit(int? unit, string name, string abbreviation)
        {
            int nro = (GeneralServices.Show_Data_table("concept","S2",null)).Rows.Count;
            try
            {
                string type = "U1";
                if (unit == null)
                {
                    type = "I1";
                    unit = nro + 1;
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

            int nro = (GeneralServices.Show_Data_table("concept", "S2", null)).Rows.Count;
            try
            {
                string type = "U1";
                if (turn == null)
                {
                    type = "I1";
                    turn = nro + 1;
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

            int nro = (GeneralServices.Show_Data_table("concept", "S2", null)).Rows.Count;
            try
            {
                string type = "U1";
                if (category == null)
                {
                    type = "I1";
                    category = nro + 1;
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

            int nro = (GeneralServices.Show_Data_table("concept", "S2", null)).Rows.Count;
            try
            {
                string type = "U1";
                if (origin == null)
                {
                    type = "I1";
                    origin = nro + 1;
                }

                SqlCommand command = new SqlCommand();
                command.Parameters.AddWithValue("i_action", type);
                command.Parameters.AddWithValue("i_concept", 4);
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
        internal static DataTable CmpID(string name)
        {

            DataTable result = new DataTable();
            try
            {
                SqlCommand command = new SqlCommand();
                command.Parameters.AddWithValue("i_action", "F1");
                command.Parameters.AddWithValue("i_name", name);
                result = GeneralServices.ExecuteQuery(command, "recipes2..sp_concept");
            }
            catch (Exception ex)
            {
                return result;
            }
            return result;
        }

        public static string Delete_this(string concept, string correlative)
        {
            try
            {
                SqlCommand command = new SqlCommand();
                command.Parameters.AddWithValue("i_action", "D1");
                command.Parameters.AddWithValue("i_concept" , concept);
                command.Parameters.AddWithValue("i_correlative", correlative);
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