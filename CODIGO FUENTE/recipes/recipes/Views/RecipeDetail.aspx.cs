using recipes.Services;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace recipes.Views
{
    public partial class RecipeDetail : System.Web.UI.Page
    {
        string idrecipe = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            idrecipe = Request.QueryString["valor"];
            if (!IsPostBack)
            {
                if(Session["us_user"] != null)
                {
                    BindData();
                }
                else
                {
                    Response.Redirect("~/Views/Login.aspx");
                }
                
            }
        }
        private void BindData()
        {
            recipe_id.Text = idrecipe;
            grdIngredients.DataSource = GeneralServices.Show_Data_table("recipe", "F1", Convert.ToInt32(recipe_id.Text));
            grdIngredients.DataBind();
            DataTable dts = GeneralServices.Show_Data_table("recipe", "S4", Convert.ToInt32(recipe_id.Text));
            txt_code.Text = dts.Rows[0]["re_recipe_id"].ToString();
            txt_nombre.Text = dts.Rows[0]["re_name"].ToString();
            txt_turno.Text = dts.Rows[0]["TURNO"].ToString();
            txt_cost.Text = dts.Rows[0]["re_total_cost"].ToString();
            txt_obs.Text = dts.Rows[0]["re_observation"].ToString();
            txt_url.Text = dts.Rows[0]["re_url_video"].ToString();
            re_iframe.Attributes.Add("src", dts.Rows[0]["re_url_video"].ToString());
            
        }

        protected void btnCart_ServerClick(object sender, EventArgs e)
        {
            string r="";
            DataTable dt = OrderServices.GetOrdertoUser(Convert.ToInt32(Session["us_id"]));
            DataTable per = PersonServices.getMyPeople(Convert.ToInt32(Session["us_id"]));            
            if (dt.Rows.Count==0)
            {
                OrderServices.InsertOrUpdate(null,DateTime.Now,Convert.ToInt32(Session["us_id"]),0,0);
                dt = OrderServices.GetOrdertoUser(Convert.ToInt32(Session["us_id"]));
                r = Recipe_orderServices.InsertOrUpdate(null, Convert.ToInt32(dt.Rows[0]["or_order"]), Convert.ToInt32(recipe_id.Text), 1, float.Parse(txt_cost.Text), Convert.ToInt32(per.Rows[0]["pe_person"]), 1);
            }
            else
            {                
                if (Recipe_orderServices.CmpRecipeExist(Convert.ToInt32(dt.Rows[0]["or_order"]), Convert.ToInt32(recipe_id.Text)).Rows.Count > 0)
                {

                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "AlertExist();", true);
                }
                else
                {
                    r = Recipe_orderServices.InsertOrUpdate(null, Convert.ToInt32(dt.Rows[0]["or_order"]), Convert.ToInt32(recipe_id.Text), 1, float.Parse(txt_cost.Text), Convert.ToInt32(per.Rows[0]["pe_person"]), 1);
                }
            }            
            if (r != "success")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "AlertError();", true);
            }
        }
    }
}