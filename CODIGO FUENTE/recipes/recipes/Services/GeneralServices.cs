using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using recipes.Util;

namespace recipes.Services
{
    public static class GeneralServices
    {
        private static string chain = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        public static DataTable ExecuteQuery(SqlCommand command, string request_procedure)
        {            
            DataTable result = new DataTable();
            SqlConnection con = new SqlConnection();
            con.ConnectionString = chain;
            con.Open();
            command.Connection = con;
            command.CommandText = request_procedure;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandTimeout = 0;
            command.ExecuteNonQuery();
            SqlDataAdapter adapter = new SqlDataAdapter();
            adapter.SelectCommand = command;
            adapter.Fill(result);
            con.Close();
            return result;
        }
        
        
        public static DataTable Show_Data_Table(SqlCommand command, string t_name,string type, int val)
        {
            string SpName = "sp_recipe_"+t_name;
            string data = "i_"+t_name;                
            DataTable result = new DataTable();
            SqlConnection con = new SqlConnection();
            con.ConnectionString = chain;
            con.Open();
            command.Connection = con;
            command.CommandText = SpName;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandTimeout = 0;
            command.Parameters.AddWithValue("i_action",type);
            command.Parameters.AddWithValue(data,val);            
            command.ExecuteNonQuery();
            SqlDataAdapter adapter = new SqlDataAdapter();
            adapter.SelectCommand = command;
            adapter.Fill(result);
            con.Close();
            return result;
        }
        public static void Delete_Data_Table(SqlCommand command, string t_name, int val)
        {
            string SpName = "sp_recipe_" + t_name;
            string data = "i_" + t_name;
            SqlConnection con = new SqlConnection();
            con.ConnectionString = chain;
            con.Open();
            command.Connection = con;
            command.CommandText = SpName;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandTimeout = 0;
            command.Parameters.AddWithValue("i_action", "D1");
            command.Parameters.AddWithValue(data, val);
            command.ExecuteNonQuery();
            con.Close();
        }
        public static void Update_t_ingredient(SqlCommand command, int i_ingre,string ingre,string name,int unit,float cost,float factor,int category, int origin)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = chain;
            con.Open();
            command.Connection = con;
            command.CommandText = "sp_recipe_ingredient";
            command.CommandType = CommandType.StoredProcedure;
            command.CommandTimeout = 0;
            command.Parameters.AddWithValue("i_action", "U1");
            command.Parameters.AddWithValue("i_ingredient", i_ingre);
            command.Parameters.AddWithValue("i_ingredient_id", ingre);
            command.Parameters.AddWithValue("i_name", name);
            command.Parameters.AddWithValue("i_unit", unit);
            command.Parameters.AddWithValue("i_cost", cost);
            command.Parameters.AddWithValue("i_factor", factor);
            command.Parameters.AddWithValue("i_category", category);
            command.Parameters.AddWithValue("i_origin", origin);
            command.ExecuteNonQuery();
            con.Close();
        }

        public static void Update_t_ingredient_nutrient(SqlCommand command, int i_nutri, int nutri, int ingre, int qty)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = chain;
            con.Open();
            command.Connection = con;
            command.CommandText = "sp_recipe_ingredient_nutrient";
            command.CommandType = CommandType.StoredProcedure;
            command.CommandTimeout = 0;
            command.Parameters.AddWithValue("i_action", "U1");
            command.Parameters.AddWithValue("i_ingredient_nutrient", i_nutri);
            command.Parameters.AddWithValue("i_nutrient", nutri);
            command.Parameters.AddWithValue("i_ingredient", ingre);
            command.Parameters.AddWithValue("i_quantity", qty);
            command.ExecuteNonQuery();
            con.Close();
        }

        public static void Update_t_nutrient(SqlCommand command, int nutri, string name, float qty)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = chain;
            con.Open();
            command.Connection = con;
            command.CommandText = "sp_recipe_nutrient";
            command.CommandType = CommandType.StoredProcedure;
            command.CommandTimeout = 0;
            command.Parameters.AddWithValue("i_action", "U1");
            command.Parameters.AddWithValue("i_nutrient", nutri);
            command.Parameters.AddWithValue("i_name", name);
            command.Parameters.AddWithValue("i_quantity", qty);
            command.ExecuteNonQuery();
            con.Close();
        }
        
        public static void Update_t_recipe_ingredient(SqlCommand command, int r_ingre, int recipe, int ingre, int qty,string obs)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = chain;
            con.Open();
            command.Connection = con;
            command.CommandText = "sp_recipe_recipe_ingredient";
            command.CommandType = CommandType.StoredProcedure;
            command.CommandTimeout = 0;
            command.Parameters.AddWithValue("i_action", "U1");
            command.Parameters.AddWithValue("i_recipe_ingredient", r_ingre);
            command.Parameters.AddWithValue("i_recipe", recipe);
            command.Parameters.AddWithValue("i_ingredient", ingre);
            command.Parameters.AddWithValue("i_quantity", qty);
            command.Parameters.AddWithValue("i_observation", obs);
            command.ExecuteNonQuery();
            con.Close();
        }

        public static void Update_t_recipe_recipe(SqlCommand command, int recipe, string i_recipe, string name, int turn, string image,float tc,string obs,int usr)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = chain;
            con.Open();
            command.Connection = con;
            command.CommandText = "sp_recipe_recipe";
            command.CommandType = CommandType.StoredProcedure;
            command.CommandTimeout = 0;
            command.Parameters.AddWithValue("i_action", "U1");
            command.Parameters.AddWithValue("i_recipe", recipe);
            command.Parameters.AddWithValue("i_recipe_id", i_recipe);
            command.Parameters.AddWithValue("i_name", name);
            command.Parameters.AddWithValue("i_turn", turn);
            command.Parameters.AddWithValue("i_image", image);
            command.Parameters.AddWithValue("i_total", tc);
            command.Parameters.AddWithValue("i_observation", obs);
            command.Parameters.AddWithValue("i_of_user", usr);
            command.ExecuteNonQuery();
            con.Close();
        }

        public static void Update_t_comentary(SqlCommand command, int comentary, int recipe, int text)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = chain;
            con.Open();
            command.Connection = con;
            command.CommandText = "sp_recipe_comentary";
            command.CommandType = CommandType.StoredProcedure;
            command.CommandTimeout = 0;
            command.Parameters.AddWithValue("i_action", "U1");
            command.Parameters.AddWithValue("i_comentary", comentary);
            command.Parameters.AddWithValue("i_recipe", recipe);
            command.Parameters.AddWithValue("i_text", text);
            command.ExecuteNonQuery();
            con.Close();
        }

        public static void Update_t_discount(SqlCommand command, int discount, int recipe, int state,float qty)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = chain;
            con.Open();
            command.Connection = con;
            command.CommandText = "sp_recipe_discount";
            command.CommandType = CommandType.StoredProcedure;
            command.CommandTimeout = 0;
            command.Parameters.AddWithValue("i_action", "U1");
            command.Parameters.AddWithValue("i_discount", discount);
            command.Parameters.AddWithValue("i_recipe", recipe);
            command.Parameters.AddWithValue("i_state", state);
            command.Parameters.AddWithValue("i_discount_quantity", qty);
            command.ExecuteNonQuery();
            con.Close();
        }

        public static void Update_t_user_recipe(SqlCommand command, int u_recipe, int usr, int recipe)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = chain;
            con.Open();
            command.Connection = con;
            command.CommandText = "sp_recipe_user_recipe";
            command.CommandType = CommandType.StoredProcedure;
            command.CommandTimeout = 0;
            command.Parameters.AddWithValue("i_action", "U1");
            command.Parameters.AddWithValue("i_user_recipe", u_recipe);
            command.Parameters.AddWithValue("i_user", usr);
            command.Parameters.AddWithValue("i_recipe", recipe);
            command.ExecuteNonQuery();
            con.Close();
        }

        public static void Update_t_user(SqlCommand command, int usr, string name, string last, string mlast, string mail, string phone,int master)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = chain;
            con.Open();
            command.Connection = con;
            command.CommandText = "sp_recipe_user";
            command.CommandType = CommandType.StoredProcedure;
            command.CommandTimeout = 0;
            command.Parameters.AddWithValue("i_action", "U1");
            command.Parameters.AddWithValue("i_user", usr);
            command.Parameters.AddWithValue("i_name", name);
            command.Parameters.AddWithValue("i_last_name", last);
            command.Parameters.AddWithValue("i_mother_last_name", mlast);
            command.Parameters.AddWithValue("i_mail", mail);
            command.Parameters.AddWithValue("i_phone", phone);
            command.Parameters.AddWithValue("i_master", master);
            command.ExecuteNonQuery();
            con.Close();
        }

        public static void Update_t_person(SqlCommand command, int person, string name, int usr)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = chain;
            con.Open();
            command.Connection = con;
            command.CommandText = "sp_recipe_person";
            command.CommandType = CommandType.StoredProcedure;
            command.CommandTimeout = 0;
            command.Parameters.AddWithValue("i_action", "U1");
            command.Parameters.AddWithValue("i_person", person);
            command.Parameters.AddWithValue("i_name", name);
            command.Parameters.AddWithValue("i_user", usr);
            command.ExecuteNonQuery();
            con.Close();
        }

        public static void Update_t_order(SqlCommand command, int order, DateTime o_date,int usr,int tqty, float tp)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = chain;
            con.Open();
            command.Connection = con;
            command.CommandText = "sp_recipe_order";
            command.CommandType = CommandType.StoredProcedure;
            command.CommandTimeout = 0;
            command.Parameters.AddWithValue("i_action", "U1");
            command.Parameters.AddWithValue("i_order", order);
            command.Parameters.AddWithValue("i_order_date", o_date);
            command.Parameters.AddWithValue("i_user", usr);
            command.Parameters.AddWithValue("i_total_quantity", tqty);
            command.Parameters.AddWithValue("i_total_price", tp);
            command.ExecuteNonQuery();
            con.Close();
        }

        public static void Update_t_recipe_order(SqlCommand command, int r_order,int order, int recipe,int qty, float price, string person)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = chain;
            con.Open();
            command.Connection = con;
            command.CommandText = "sp_recipe_recipe_order";
            command.CommandType = CommandType.StoredProcedure;
            command.CommandTimeout = 0;
            command.Parameters.AddWithValue("i_action", "U1");
            command.Parameters.AddWithValue("i_recipe_order", r_order);
            command.Parameters.AddWithValue("i_order", order);
            command.Parameters.AddWithValue("i_recipe", recipe);
            command.Parameters.AddWithValue("i_quantity", qty);
            command.Parameters.AddWithValue("i_price", price);
            command.Parameters.AddWithValue("i_person", person);
            command.ExecuteNonQuery();
            con.Close();
        }

        public static void Update_t_promotion(SqlCommand command, int promotion, string name, string title, string txt1, string txt2, string image1,string image2)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = chain;
            con.Open();
            command.Connection = con;
            command.CommandText = "sp_recipe_promotion";
            command.CommandType = CommandType.StoredProcedure;
            command.CommandTimeout = 0;
            command.Parameters.AddWithValue("i_action", "U1");
            command.Parameters.AddWithValue("i_promotion", promotion);
            command.Parameters.AddWithValue("i_name", name);
            command.Parameters.AddWithValue("i_title", title);
            command.Parameters.AddWithValue("i_text1", txt1);
            command.Parameters.AddWithValue("i_text2", txt2);
            command.Parameters.AddWithValue("i_image1", image1);
            command.Parameters.AddWithValue("i_image2", image2);
            command.ExecuteNonQuery();
            con.Close();
        }
    }
}