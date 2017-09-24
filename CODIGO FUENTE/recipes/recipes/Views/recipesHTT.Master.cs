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
                GetUser();
                string current = this.ContentPlaceHolder1.Page.GetType().Name;
                if (!current.Contains("startpageview"))
                {
                    hero_area.Visible = false;
                }
                //ImageInicio.Src = GeneralServices.Show_Data_table("recipes","F2",null).Rows[0]["re_url"].ToString();
            }
        }
        private void GetUser()
        {
            try
            {
                lbl_usuario.InnerText = Session["US_NAME"].ToString();
                lbl_log.Visible = false;
                li_user.Visible = true;
            }
            catch (Exception)
            {
                lbl_log.Visible = true;
                li_user.Visible = false;
            }
        }


    }
}