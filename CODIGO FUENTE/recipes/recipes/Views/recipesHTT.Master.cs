using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using recipes.Services;

namespace recipes.Views
{
    public partial class recipesHTT : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                string current = this.ContentPlaceHolder1.Page.GetType().Name;
                if (!current.Contains("startpageview"))
                {
                    hero_area.Visible = false;
                }
            }
            GetUser();
        }
        private void GetUser()
        {            
            if (Session["us_user"] != null)
            {
                if (bool.Parse( Session["us_master"].ToString()))
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "ismaster();", true);
                    lbl_master.InnerText = Session["us_user"].ToString().ToUpper();
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "isuser();", true);
                    lbl_user.InnerText = Session["us_user"].ToString().ToUpper();
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "isnormal();", true);
            }
        }
    }
}