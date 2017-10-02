using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace recipes.Services
{
    public class ConsultServices
    {
        public static string InsertOrUpdate(int? consult, string name, string email, string text)
        {
            try
            {
                string type = "U1";
                if (consult == null)
                {
                    type = "I1";
                }

                SqlCommand command = new SqlCommand();
                command.Parameters.AddWithValue("i_action", type);
                command.Parameters.AddWithValue("i_consult", consult);
                command.Parameters.AddWithValue("i_email", email);
                command.Parameters.AddWithValue("i_name", name);
                command.Parameters.AddWithValue("i_text", text);
                command.Parameters.AddWithValue("i_is", true);
                GeneralServices.ExecuteQuery(command, "recipes2..sp_consult");
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
            return "success";
        }
    }
}