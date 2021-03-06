﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace recipes.Services
{
    public static class PromotionServices
    {
        public static string InsertOrUpdate(int? promotion, string name, string title, string txt1, string image1)
        {
            try
            {
                string type = "U1";
                if (promotion == null)
                {
                    type = "I1";
                }

                SqlCommand command = new SqlCommand();
                command.Parameters.AddWithValue("i_action", type);
                command.Parameters.AddWithValue("i_promotion", promotion);
                command.Parameters.AddWithValue("i_name", name);
                command.Parameters.AddWithValue("i_title", title);
                command.Parameters.AddWithValue("i_text", txt1);
                command.Parameters.AddWithValue("i_image", image1);
                GeneralServices.ExecuteQuery(command, "recipes2..sp_promotion");
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
            return "success";
        }


        internal static DataTable GetInicio()
        {

            DataTable result = new DataTable();
            try
            {
                SqlCommand command = new SqlCommand();
                command.Parameters.AddWithValue("i_action", "F1");
                result = GeneralServices.ExecuteQuery(command, "recipes2..sp_promotion");
            }
            catch (Exception ex)
            {
                return result;
            }
            return result;
        }
    }
}