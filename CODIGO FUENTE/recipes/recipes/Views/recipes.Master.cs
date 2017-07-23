using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace recipes.Views
{
    public partial class recipes : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                GetUser();
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

        protected void btn_logout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("StartPageView.aspx");
        }
    }
}