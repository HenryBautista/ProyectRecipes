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
    public partial class IngrdientNutrientView : System.Web.UI.Page
    {
        string in_ingredientId;
        protected void Page_Load(object sender, EventArgs e)
        {
            in_ingredientId = Request.QueryString["valor"];
            if (!IsPostBack)
            {
                BindData();
            }
        }

        private void BindData()
        {
            ingredient_id.Text = in_ingredientId;
            DataTable result = GeneralServices.Show_Data_table("ingredient", "F2", Convert.ToInt32(in_ingredientId));
            if (result.Rows.Count>0)
            {
                grdNutrients.DataSource = result;
                grdNutrients.DataBind();
            }
            else
            {
                result.Rows.Add(result.NewRow());
                result.Rows[0]["nu_nutrient"] = -1;
                result.Rows[0]["in_quantity"] = 0;
                grdNutrients.DataSource = result;
                grdNutrients.DataBind();
                //ShowNoResultFound(result, grdNutrients);
            }
            DataTable dts = GeneralServices.Show_Data_table("ingredient", "S4", Convert.ToInt32(in_ingredientId));
            lbl_code.Text = dts.Rows[0]["in_ingredient_id"].ToString();
            lbl_nombre.Text = dts.Rows[0]["in_name"].ToString();
            lbl_unidad.Text = dts.Rows[0]["UNIT"].ToString();
            lbl_cost.Text = dts.Rows[0]["in_cost"].ToString();
            lbl_factor.Text = dts.Rows[0]["in_factor"].ToString();
            lbl_cat.Text = dts.Rows[0]["CATEGORY"].ToString();
            lbl_origin.Text = dts.Rows[0]["ORIGIN"].ToString();
        }
        protected DataTable getNutrient()
        {
            return GeneralServices.Show_Data_table("nutrient","S1",null);

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

                index = -1;
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
                    string qty = ((TextBox)grdNutrients.Rows[index].FindControl("txtQty")).Text;
                    string nutri = ((DropDownList)grdNutrients.Rows[index].FindControl("DDLnutrient")).SelectedValue;
                    if (check_fields(qty,index))
                    {
                        Ingredient_nutrientServices.InsertOrUpdate(id_ing,Convert.ToInt32(nutri), Convert.ToInt32(ingredient_id.Text), Convert.ToInt32(qty));
                        grdNutrients.EditIndex = -1;
                        BindData();
                    }
                    break;
                case "cancel_nutrient":
                    grdNutrients.EditIndex = -1;
                    BindData();
                    break;
                case "delete_nutrient":
                    string result = GeneralServices.Delete_this("ingredient_nutrient", "recipes..sp_ingredient_nutrient", id_ing.ToString());
                    if (result == "success")
                        BindData();
                    else
                    {
                        Label msg = grdNutrients.Rows[index].FindControl("lblmsg") as Label;
                        msg.Text = "No se Pudo Eliminar";
                    }
                    break;
                case "add":
                    string qty2 = ((TextBox)grdNutrients.FooterRow.FindControl("txtfooter")).Text;
                    string nutri2 = ((DropDownList)grdNutrients.FooterRow.FindControl("DDLfooter")).SelectedValue;
                    if (cmp(nutri2) && check_fields(qty2, index))
                    {
                        Ingredient_nutrientServices.InsertOrUpdate(id_ing, Convert.ToInt32(nutri2), Convert.ToInt32(ingredient_id.Text), Convert.ToInt32(qty2));
                        BindData();
                    }
                    break;
                default:
                    break;
            }
        }

        private bool cmp(string nutri)
        {
            Label msg = grdNutrients.FooterRow.FindControl("lblmsg") as Label;
            if (Ingredient_nutrientServices.CmpID(Convert.ToInt32(nutri), Convert.ToInt32(ingredient_id.Text)).Rows.Count > 0)
            {
                msg.Text = "El nutriente ya existe";
                return false;
            }
            return true;
        }

        private bool check_fields( string qty, int index)
        {
            Label msg; 
            try
            {
                msg = grdNutrients.Rows[index].FindControl("lblmsg") as Label;
            }
            catch (Exception)
            {
                msg = grdNutrients.FooterRow.FindControl("lblmsg") as Label;
            }
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

        private void ShowNoResultFound(DataTable source, GridView gv)
        {
            source.Rows.Add(source.NewRow()); // create a new blank row to the DataTable
                                              // Bind the DataTable which contain a blank row to the GridView
            gv.DataSource = source;
            gv.DataBind();
            // Get the total number of columns in the GridView to know what the Column Span should be
            int columnsCount = gv.Columns.Count;
            gv.Rows[0].Cells.Clear();// clear all the cells in the row
            gv.Rows[0].Cells.Add(new TableCell()); //add a new blank cell
            gv.Rows[0].Cells[0].ColumnSpan = columnsCount; //set the column span to the new added cell

            //You can set the styles here
            gv.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            gv.Rows[0].Cells[0].ForeColor = System.Drawing.Color.Red;
            gv.Rows[0].Cells[0].Font.Bold = true;
            //set No Results found to the new added cell
            gv.Rows[0].Cells[0].Text = "No temenos datos!";
        }
        protected void grdNutrients_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DataTable result = GeneralServices.Show_Data_table("ingredient", "F2", Convert.ToInt32(in_ingredientId));
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
    }
}