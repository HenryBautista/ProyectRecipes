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
                BindData();
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
            
        }
    }
}