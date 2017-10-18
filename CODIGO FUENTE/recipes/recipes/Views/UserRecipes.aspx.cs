using recipes.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace recipes.Views
{
    public partial class UserRecipes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["us_user"] != null && bool.Parse(Session["us_master"].ToString()))
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
            grdUserRecipes.DataSource = GeneralServices.Show_Data_table("recipe", "S6", null);
            grdUserRecipes.DataBind();
        }
    }
}