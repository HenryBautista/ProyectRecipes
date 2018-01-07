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
    public partial class ReportViewAdmin : System.Web.UI.Page
    {
        string id;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["us_user"] != null)
                {
                    this.id = Request.QueryString["valor"].ToString();
                    order_id.Text = this.id;
                    user_id.Text = Session["us_id"].ToString();
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
            DataTable result = GeneralServices.Show_Data_table("order", "S2", Convert.ToInt32(order_id.Text));
            if (result.Rows.Count > 0 )
            {
                lblusuario.Text = Session["us_user"].ToString();
                lblFecha.Text = result.Rows[0]["or_order_date"].ToString();
                lblCantidad.Text = result.Rows[0]["or_total_quantity"].ToString();
                lblTotal.Text = result.Rows[0]["or_total_price"].ToString();
                grdIngredients.DataSource = GeneralServices.Show_Data_table("order", "S9", Convert.ToInt32(order_id.Text));
                grdIngredients.DataBind();
            }
        }
    }
}