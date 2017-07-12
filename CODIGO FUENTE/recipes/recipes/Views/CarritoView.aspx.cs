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
                id = Request.QueryString["id"];
                BindData();
            }
        }

        private void BindData()
        {
            user_id.Text = id;
            DataTable result = GeneralServices.Show_Data_table("user","F1",Convert.ToInt32(id));
            DataTable result2 = GeneralServices.Show_Data_table("user","F2", Convert.ToInt32(id));
            if (result.Rows.Count>0 && result2.Rows.Count > 0)
            {                                
                txtFecha.Text = result.Rows[0]["or_order_date"].ToString();
                lbl_cantidad.Text = result.Rows[0]["or_total_quantity"].ToString();
                lbl_cost.Text = result.Rows[0]["or_total_price"].ToString();
                grdOrden.DataSource = result2;
                grdOrden.DataBind();
            }
        }

        protected DataTable getPerson()
        {
            return PersonServices.getMyPerson(Convert.ToInt32(user_id.Text));
        }
        private bool check_fields(string qty, int index)
        {
            Label msg = grdOrden.Rows[index].FindControl("lblmsg") as Label;
            
            if (qty == "")
            {
                msg.Text = "Ingrese una cantidad";
                return false;
            }
            try
            {
                int n = int.Parse(qty);
                n = int.Parse(qty);
            }
            catch (Exception e)
            {
                msg.Text = "La cantidad no es un entero";
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
            int result = DateTime.Compare(fecha, actual);
            if (result<=0)
            {
                lbl_msg.InnerText = "La fecha ya paso o no es correcta"
                return false;
            }
            return true;
        }
        protected void ConfirmarOrden()
        {            
            OrderServices.ConfirmOrder(Convert.ToInt32(user_id.Text) ,Convert.ToDateTime(txtFecha.Text));
        }

        protected void grdOrden_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index;
            try
            {
                index = Convert.ToInt32(e.CommandArgument);
            }
            catch (Exception)
            {

                index = 0;
            }
            string com = e.CommandName.ToString();
            int? id_ing;
            try
            {
                id_ing = Convert.ToInt32(grdOrden.DataKeys[index].Value);
            }
            catch (Exception)
            {

                id_ing = null;
            }

            switch (com)
            {
                case "edit_nutrient":
                    grdOrden.EditIndex = index;
                    BindData();
                    break;
                case "update_nutrient":
                    string qty = ((TextBox)grdOrden.Rows[index].FindControl("txtQty")).Text;
                    string per = ((DropDownList)grdOrden.Rows[index].FindControl("DDLPerson")).SelectedValue;
                    string price = ((Label)grdOrden.Rows[index].FindControl("lblunidad")).Text;
                    
                    if (check_fields(qty,index))
                    {
                        float tp = float.Parse(qty) * float.Parse(price);
                        DataTable dt = GeneralServices.Show_Data_table("recipe_order","S2",id_ing);
                        Recipe_orderServices.InsertOrUpdate(id_ing,
                                            Convert.ToInt32(dt.Rows[0]["ro_order"].ToString()),
                                            Convert.ToInt32(dt.Rows[0]["ro_recipe"].ToString()),
                                            Convert.ToInt32(qty),tp,Convert.ToInt32(per));
                        GeneralServices.Show_Data_table("order","U2",id_ing);
                        grdOrden.EditIndex = -1;
                        BindData();
                    }
                    break;
                case "cancel_nutrient":
                    grdOrden.EditIndex = -1;
                    BindData();
                    break;
                case "delete_nutrient":
                    string result = GeneralServices.Delete_this("recipe_order", "recipes..sp_recipe_order", id_ing.ToString());
                    if (result == "success")
                    {
                        GeneralServices.Show_Data_table("order", "U2", id_ing);
                        BindData();
                    }                        
                    else
                    {
                        Label msg = grdOrden.Rows[index].FindControl("lblmsg") as Label;
                        msg.Text = "No se Pudo Eliminar";
                    }
                    break;
                default:
                    break;
            }
        }


        protected void grdOrden_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Button b1;
                b1 = e.Row.FindControl("btn_edit") as Button;
                b1.CommandArgument = e.Row.RowIndex.ToString();
                b1 = e.Row.FindControl("btn_update") as Button;
                b1.CommandArgument = e.Row.RowIndex.ToString();
                b1 = e.Row.FindControl("btn_cancel") as Button;
                b1.CommandArgument = e.Row.RowIndex.ToString();
                b1 = e.Row.FindControl("btn_del") as Button;
                b1.CommandArgument = e.Row.RowIndex.ToString();
                if (grdOrden.EditIndex != -1 && e.Row.RowIndex == grdOrden.EditIndex)
                {
                    b1 = e.Row.FindControl("btn_edit") as Button;
                    b1.Visible = false;
                    b1 = e.Row.FindControl("btn_update") as Button;
                    b1.Visible = true;
                    b1 = e.Row.FindControl("btn_cancel") as Button;
                    b1.Visible = true;
                    b1 = e.Row.FindControl("btn_del") as Button;
                    b1.Visible = false;
                }
                else
                {
                    b1 = e.Row.FindControl("btn_edit") as Button;
                    b1.Visible = true;
                    b1 = e.Row.FindControl("btn_update") as Button;
                    b1.Visible = false;
                    b1 = e.Row.FindControl("btn_cancel") as Button;
                    b1.Visible = false;
                    b1 = e.Row.FindControl("btn_del") as Button;
                    b1.Visible = true;
                }
            }
        }

        
    }
}