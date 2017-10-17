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
    public partial class CarritoView : System.Web.UI.Page
    {
        string id;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["us_user"] != null)
                {
                    id = Session["us_id"].ToString();
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
            user_id.Text = id;
            DataTable result = GeneralServices.Show_Data_table("user", "F1", Convert.ToInt32(id));
            DataTable result2 = GeneralServices.Show_Data_table("user", "F2", Convert.ToInt32(id));
            if (result.Rows.Count > 0 && result2.Rows.Count > 0)
            {
                //txtFecha.Text = result.Rows[0]["or_order_date"].ToString();
                lbl_cantidad.Text = result.Rows[0]["or_total_quantity"].ToString();
                lbl_cost.Text = result.Rows[0]["or_total_price"].ToString();
                grdRecetas.DataSource = result2;
                grdRecetas.DataBind();
                grdIngredients.DataSource = GeneralServices.Show_Data_table("user", "F3", Convert.ToInt32(id));
                grdIngredients.DataBind();
            }
        }

        protected DataTable getPerson()
        {
            return PersonServices.getMyPeople(Convert.ToInt32(user_id.Text));
        }
        private bool check_fields(string qty, int index)
        {
            Label msg = grdRecetas.Rows[index].FindControl("lblmsg") as Label;
            if (Convert.ToInt32(qty)<=0)
            {
                msg.Text = "La cantidad debe ser mayor a 0";
                return false;
            }
            msg.Text = "";
            return true;
        }

        private bool checkOrder()
        {
            string now = DateTime.Now.ToString("dd.MM.yyyy.hh.mm.ss.ffffff");
            DateTime actual = Convert.ToDateTime(now);
            DateTime fecha = Convert.ToDateTime(txtFecha.Text);
            int result = DateTime.Compare(DateTime.Now, actual);
            if (result <= 0)
            {
                lbl_msg.InnerText = "La fecha ya paso o no es correcta";
                return false;
            }
            return true;
        }
        protected void ConfirmarOrden()
        {
            OrderServices.ConfirmOrder(Convert.ToInt32(user_id.Text), Convert.ToDateTime("txtFecha.Text"));
        }

        protected void grdOrden_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            int index = -1;
            string idreceta = null;
            string com = e.CommandName;
            if (!string.IsNullOrEmpty(e.CommandArgument.ToString()))
            {
                index = Convert.ToInt32(e.CommandArgument);
                idreceta = grdRecetas.DataKeys[index].Value.ToString();
            }
            switch (com)
            {
                case "edit_recipe":
                    grdRecetas.EditIndex = index;
                    BindData();
                    break;
                case "update_recipe":
                    string qty = ((TextBox)grdRecetas.Rows[index].FindControl("txtQty")).Text;
                    string per = ((DropDownList)grdRecetas.Rows[index].FindControl("DDLPerson")).SelectedValue;
                    string price = ((Label)grdRecetas.Rows[index].FindControl("lblunidad")).Text;
                    if (check_fields(qty, index))
                    {
                        DataTable dt = GeneralServices.Show_Data_table("recipe_order", "S2", Convert.ToInt32(idreceta));
                        Recipe_orderServices.InsertOrUpdate(Convert.ToInt32(idreceta),
                                            Convert.ToInt32(dt.Rows[0]["ro_order"].ToString()),
                                            Convert.ToInt32(dt.Rows[0]["ro_key"].ToString()),
                                            Convert.ToInt32(qty), (Convert.ToInt32(qty) * Convert.ToInt32(price)), Convert.ToInt32(per),1);
                        grdRecetas.EditIndex = -1;
                        BindData();
                    }
                    break;
                case "cancel_recipe":
                    grdRecetas.EditIndex = -1;
                    BindData();
                    break;
                case "delete_recipe":
                    string result = GeneralServices.Delete_this("recipe_order", "recipes..sp_recipe_order", idreceta);
                    if (result == "success")
                    {
                        BindData();
                    }
                    else
                    {
                        Label msg = grdRecetas.Rows[index].FindControl("lblmsg") as Label;
                        msg.Text = "No se Pudo Eliminar";
                    }
                    break;
                default:
                    break;
            }
        }
        
        protected void btn_cart_Click(object sender, EventArgs e)
        {

        }

        protected void btnPrint_Click(object sender, EventArgs e)
        {

        }
}
}