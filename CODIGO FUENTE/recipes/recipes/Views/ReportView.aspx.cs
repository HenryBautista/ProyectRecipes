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
    public partial class ReportView : System.Web.UI.Page
    {
        string id;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["us_user"] != null)
                {
                    id = Request.QueryString["valor"].ToString();
                    order_id.Text = id;
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
            DataTable result2 = GeneralServices.Show_Data_table("order", "F2", Convert.ToInt32(order_id.Text));
            if (result.Rows.Count > 0 && result2.Rows.Count > 0)
            {
                lblusuario.Text = Session["us_user"].ToString();
                lblFecha.Text = result.Rows[0]["or_order_date"].ToString();
                lblCantidad.Text = result.Rows[0]["or_total_quantity"].ToString();
                lblTotal.Text = result.Rows[0]["or_total_price"].ToString();
                grdRecetas.DataSource = result2;
                grdRecetas.DataBind();
                grdIngredients.DataSource = GeneralServices.Show_Data_table("order", "F3", Convert.ToInt32(order_id.Text));
                grdIngredients.DataBind();
            }
        }
        protected DataTable getPerson()
        {
            return PersonServices.getMyPeople(Convert.ToInt32(user_id.Text));
        }
    }
}