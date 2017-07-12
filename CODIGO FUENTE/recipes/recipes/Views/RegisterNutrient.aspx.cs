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
    public partial class RegisterNutrient : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindData();
            }
        }

        private void BindData()
        {
            DataTable result = GeneralServices.Show_Data_table("nutrient", "S1", null);
            if (result.Rows.Count > 0)
            {
                grdNutrients.DataSource = result;
                grdNutrients.DataBind();
            }
            else
            {
                result.Rows.Add(result.NewRow());
                result.Rows[0]["nu_name"] = "";
                grdNutrients.EditIndex = 0;
                grdNutrients.DataSource = result;
                grdNutrients.DataBind();
            }
        }
        protected void grdNutrients_RowDataBound(object sender, GridViewRowEventArgs e)
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
                if (grdNutrients.EditIndex != -1 && e.Row.RowIndex == grdNutrients.EditIndex)
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

        protected void grdNutrients_RowCommand(object sender, GridViewCommandEventArgs e)
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
                id_ing = Convert.ToInt32(grdNutrients.DataKeys[index].Value);
            }
            catch (Exception)
            {

                id_ing = null;
            }

            switch (com)
            {
                case "edit_nutrient":
                    grdNutrients.EditIndex = index;
                    BindData();
                    break;
                case "update_nutrient":
                    string name = ((TextBox)grdNutrients.Rows[index].FindControl("txtQty")).Text;
                    if (check_fields(name, index))
                    {
                        NutrientServices.InsertOrUpdate(id_ing, name);
                        grdNutrients.EditIndex = -1;
                        BindData();
                    }
                    break;
                case "cancel_nutrient":
                    grdNutrients.EditIndex = -1;
                    BindData();
                    break;
                case "delete_nutrient":
                    string result = GeneralServices.Delete_this("nutrient", "recipes..sp_nutrient", id_ing.ToString());
                    if (result == "success")
                        BindData();
                    else
                    {
                        Label msg = grdNutrients.Rows[index].FindControl("lblmsg") as Label;
                        msg.Text = "No se Pudo Eliminar";
                    }
                    break;
                case "add":
                    name = ((TextBox)grdNutrients.FooterRow.FindControl("txtfooter")).Text;
                    if (check_fields(name, index))
                    {
                        NutrientServices.InsertOrUpdate(id_ing, name);
                        BindData();
                    }
                    break;
                default:
                    break;
            }
        }

        private bool check_fields( string name, int index)
        {
            Label msg = grdNutrients.Rows[index].FindControl("lblmsg") as Label;

            if (name == "")
            {
                msg.Text = "Ingrese una nombre";
                return false;
            }
            try
            {
                if (NutrientServices.CmpID(name).Rows.Count > 1)
                {
                    msg.Text = "El nutriente ya existe";
                    return false;
                }
            }
            catch (Exception e)
            {
                msg.Text = "ok";
            }
            msg.Text = "";
            return true;
        }
      
    }
}