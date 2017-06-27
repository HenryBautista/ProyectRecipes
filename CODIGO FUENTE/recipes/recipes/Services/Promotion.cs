﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace recipes.Services
{
    public class Promotion
    {
        public static string InsertOrUpdate(int? promotion, string name, string title, string txt1, string txt2, string image1, string image2)
        {
            string ms = "Update Ok";
            try
            {
                string type = "U1";
                if (promotion == null)
                {
                    type = "I1";
                    ms = "Insert Ok";
                }

                SqlCommand command = new SqlCommand();
                command.Parameters.AddWithValue("i_action", type);
                command.Parameters.AddWithValue("i_promotion", promotion);
                command.Parameters.AddWithValue("i_name", name);
                command.Parameters.AddWithValue("i_title", title);
                command.Parameters.AddWithValue("i_text1", txt1);
                command.Parameters.AddWithValue("i_text2", txt2);
                command.Parameters.AddWithValue("i_image1", image1);
                command.Parameters.AddWithValue("i_image2", image2);
                GeneralServices.ExecuteQuery(command, "promotion");
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
            return ms;
        }
        
    }
}