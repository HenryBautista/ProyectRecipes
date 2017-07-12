using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace recipes.Services
{
    public static class OrderServices
    {
        public static string InsertOrUpdate(int? order, DateTime o_date, int usr, int tqty, float tp)
        {
            try
            {
                string type = "U1";
                if (order == null)
                {
                    type = "I1";
                }

                SqlCommand command = new SqlCommand();
                command.Parameters.AddWithValue("i_action", type);
                command.Parameters.AddWithValue("i_order", order);
                command.Parameters.AddWithValue("i_order_date", o_date);
                command.Parameters.AddWithValue("i_user", usr);
                command.Parameters.AddWithValue("i_total_quantity", tqty);
                command.Parameters.AddWithValue("i_total_price", tp);
                GeneralServices.ExecuteQuery(command, "recipes..sp_order");
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
            return "success";
        }
        public static string ConfirmOrder(int usr, DateTime o_date)
        {
            try
            {
                SqlCommand command = new SqlCommand();
                command.Parameters.AddWithValue("i_action", "U3");
                command.Parameters.AddWithValue("i_order_date", o_date);
                command.Parameters.AddWithValue("i_user", usr);
                GeneralServices.ExecuteQuery(command, "recipes..sp_order");
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
            return "success";
        }
    }
}