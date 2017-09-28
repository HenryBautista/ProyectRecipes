using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace recipes.Services
{
    public static class PersonServices
    {
        public static string InsertOrUpdate(int? person, string name, int usr)
        {
            try
            {
                string type = "U1";
                if (person == null)
                {
                    type = "I1";
                }

                SqlCommand command = new SqlCommand();
                command.Parameters.AddWithValue("i_action", type);
                command.Parameters.AddWithValue("i_person", person);
                command.Parameters.AddWithValue("i_name", name);
                command.Parameters.AddWithValue("i_user", usr);
                GeneralServices.ExecuteQuery(command, "recipes2..sp_person");
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
            return "success";
        }

        public static DataTable getMyPerson(int usr)
        {
            DataTable result = new DataTable();
            try
            {
                SqlCommand command = new SqlCommand();
                command.Parameters.AddWithValue("i_action", "S3");
                command.Parameters.AddWithValue("i_user", usr);
                result = GeneralServices.ExecuteQuery(command, "recipes2..sp_person");
            }
            catch (Exception ex)
            {
                return result;
            }
            return result;
        }

        internal static DataTable GetThisPerson(string person)
        {
            DataTable result = new DataTable();
            try
            {
                SqlCommand command = new SqlCommand();
                command.Parameters.AddWithValue("i_action", "S2");
                command.Parameters.AddWithValue("i_person", person);
                result = GeneralServices.ExecuteQuery(command, "recipes2..sp_person");
            }
            catch (Exception ex)
            {
                return result;
            }
            return result;
        }
    }
}