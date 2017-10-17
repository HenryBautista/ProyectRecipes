using recipes.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace recipes.Views
{
    public partial class ContactAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["us_user"]!=null && bool.Parse(Session["us_master"].ToString()))
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
            grdConsultas.DataSource = GeneralServices.Show_Data_table("consult","S3",null);
            grdConsultas.DataBind();
        }

        protected void grdConsultas_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void check_CheckedChanged(object sender, EventArgs e)
        {
            GridViewRow row = ((GridViewRow)((CheckBox)sender).NamingContainer);
            int index = row.RowIndex;
            string idconsulta = grdConsultas.DataKeys[index].Value.ToString();
            ConsultServices.InsertOrUpdate(Convert.ToInt32(idconsulta), null, null, null);

        }
    }
}