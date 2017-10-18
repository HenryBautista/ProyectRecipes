using recipes.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace recipes.Views
{
    public partial class OrderList : System.Web.UI.Page
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
            grdOrdenes.DataSource = GeneralServices.Show_Data_table("order", "S7", null);
            grdOrdenes.DataBind();
            all.Visible = true;
            Button1.Visible = false;
        }
        protected void check_CheckedChanged(object sender, EventArgs e)
        {
            GridViewRow row = ((GridViewRow)((CheckBox)sender).NamingContainer);
            int index = row.RowIndex;
            string idorder = grdOrdenes.DataKeys[index].Value.ToString();
            OrderServices.OkOrder(Convert.ToInt32(idorder));
            BindData();
        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            grdOrdenes.DataSource = GeneralServices.Show_Data_table("order", "S8", null);
            grdOrdenes.DataBind();
            all.Visible = false;
            Button1.Visible = true;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            BindData();
        }
    }
}