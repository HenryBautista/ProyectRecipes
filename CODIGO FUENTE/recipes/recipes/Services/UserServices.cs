using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace recipes.Services
{
    public static class UserServices
    {

        public static string InsertOrUpdate(int? usr, string name, string last, string mlast, string mail, string phone, int master)
        {
            string ms = "Update Ok";
            try
            {
                string type = "U1";
                if (usr == null)
                {
                    type = "I1";
                    ms = "Insert Ok";
                }

                SqlCommand command = new SqlCommand();
                command.Parameters.AddWithValue("i_action", type);
                command.Parameters.AddWithValue("i_user", usr);
                command.Parameters.AddWithValue("i_name", name);
                command.Parameters.AddWithValue("i_last_name", last);
                command.Parameters.AddWithValue("i_mother_last_name", mlast);
                command.Parameters.AddWithValue("i_mail", mail);
                command.Parameters.AddWithValue("i_phone", phone);
                command.Parameters.AddWithValue("i_master", master);
                GeneralServices.ExecuteQuery(command, "recipes..sp_user");
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
            return ms;
        }

        public static bool ThisEmailExits(string mail)
        {
            try
            {
                SqlCommand command = new SqlCommand();
                command.Parameters.AddWithValue("i_action", "F1");
                command.Parameters.AddWithValue("i_mail", mail);
                DataTable table = GeneralServices.ExecuteQuery(command, "recipes..sp_user");
                if (table.Rows.Count >= 1)
                    return true;
                else
                    return false;
            }
            catch (Exception)
            {
                return true;
            }
        }
    }
}