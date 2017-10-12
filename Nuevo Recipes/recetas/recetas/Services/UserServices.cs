using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace recetas.Services
{
    public static class UserServices
    {

        public static string InsertOrUpdate(int? usr, string name, string last, string mlast, string pass, string mail, string phone, int master)
        {
            try
            {
                string type = "U1";
                if (usr == null)
                {
                    type = "I1";
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
                command.Parameters.AddWithValue("i_password", pass);
                GeneralServices.ExecuteQuery(command, "recipes2..sp_user");
                return "success";

            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }


        public static string InsertOrUpdateData(int? usr, string name, string last, string mlast, string phone)
        {
            try
            {
                string type = "U2";
                if (usr == null)
                {
                    type = "I1";
                }

                SqlCommand command = new SqlCommand();
                command.Parameters.AddWithValue("i_action", type);
                command.Parameters.AddWithValue("i_user", usr);
                command.Parameters.AddWithValue("i_name", name);
                command.Parameters.AddWithValue("i_last_name", last);
                command.Parameters.AddWithValue("i_mother_last_name", mlast);
                command.Parameters.AddWithValue("i_phone", phone);
                GeneralServices.ExecuteQuery(command, "recipes2..sp_user");
                return "success";

            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }
        public static bool ThisEmailExits(string mail)
        {
            try
            {
                SqlCommand command = new SqlCommand();
                command.Parameters.AddWithValue("i_action", "F1");
                command.Parameters.AddWithValue("i_mail", mail);
                DataTable table = GeneralServices.ExecuteQuery(command, "recipes2..sp_user");
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

        public static DataTable GetThisUser(string user)
        {
            try
            {
                SqlCommand command = new SqlCommand();
                command.Parameters.AddWithValue("i_action", "S3");
                command.Parameters.AddWithValue("i_user", user);
                return GeneralServices.ExecuteQuery(command, "recipes2..sp_user");
            }
            catch (Exception)
            {
                return new DataTable();
            }
        }
        public static DataTable GetThisUserByMail(string mail)
        {
            try
            {
                SqlCommand command = new SqlCommand();
                command.Parameters.AddWithValue("i_action", "S2");
                command.Parameters.AddWithValue("i_mail", mail);
                return GeneralServices.ExecuteQuery(command, "recipes2..sp_user");
            }
            catch (Exception)
            {
                return new DataTable();
            }
        }
    }
}