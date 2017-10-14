﻿using recipes.Services;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace recipes.Views
{
    public partial class StartPageView : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                BindData();
            }            
        }

        private void BindData()
        {   
            repeateringredients.DataSource = GeneralServices.Show_Data_table("ingredient","S3",null);
            repeateringredients.DataBind();
            repeaterItem.DataSource = GeneralServices.Show_Data_table("promotion", "S1", null);
            repeaterItem.DataBind();
        }

        protected void btnComprar_Click(object sender, EventArgs e)
        {
            string r="";
            int idingredient = Convert.ToInt32(((Button)sender).CommandArgument);
            DataTable dt = OrderServices.GetOrdertoUser(Convert.ToInt32(Session["us_id"]));
            DataTable per = PersonServices.getMyPeople(Convert.ToInt32(Session["us_id"]));
            DataTable ing = GeneralServices.Show_Data_table("ingredient","S2",idingredient);
            if (dt.Rows.Count == 0)
            {
                OrderServices.InsertOrUpdate(null, DateTime.Now, Convert.ToInt32(Session["us_id"]), 0, 0);
                dt = OrderServices.GetOrdertoUser(Convert.ToInt32(Session["us_id"]));
                r = Recipe_orderServices.InsertOrUpdate(null, Convert.ToInt32(dt.Rows[0]["or_order"]), idingredient, 1, float.Parse(ing.Rows[0]["in_factor"].ToString()), Convert.ToInt32(per.Rows[0]["pe_person"]), 0);
            }
            else
            {
                if (Recipe_orderServices.CmpIngredientExist(Convert.ToInt32(dt.Rows[0]["or_order"]), idingredient).Rows.Count > 0)
                {

                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "AlertExist();", true);
                }
                else
                {
                    r = Recipe_orderServices.InsertOrUpdate(null, Convert.ToInt32(dt.Rows[0]["or_order"]), idingredient, 1, float.Parse(ing.Rows[0]["in_factor"].ToString()), Convert.ToInt32(per.Rows[0]["pe_person"]), 0);
                }
            }
            if (r != "success")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "AlertError();", true);
            }
        }        
    }
}