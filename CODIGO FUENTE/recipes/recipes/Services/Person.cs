using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace recipes.Services
{
    public class Person
    {
        public static string InsertOrUpdate(int? person, string name, int usr)
        {
            string ms = "Update Ok";
            try
            {
                string type = "U1";
                if (person == null)
                {
                    type = "I1";
                    ms = "Insert Ok";
                }

                SqlCommand command = new SqlCommand();
                command.Parameters.AddWithValue("i_action", type);
                command.Parameters.AddWithValue("i_person", person);
                command.Parameters.AddWithValue("i_name", name);
                command.Parameters.AddWithValue("i_user", usr);
                GeneralServices.ExecuteQuery(command, "person");
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
            return ms;
        }

    }
}