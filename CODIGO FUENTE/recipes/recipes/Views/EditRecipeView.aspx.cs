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
    public partial class EditRecipeView : System.Web.UI.Page
    {
        int recipe_index;
        protected void Page_Load(object sender, EventArgs e)
        {
            recipe_index = Convert.ToInt32(Request.QueryString["RecID"]);
            if (!IsPostBack)
            {
                BindData();
            }
        }

        private void BindData()
        {
            DataTable result = GeneralServices.Show_Data_table("recipe", "S4", recipe_index);
            lblRecipeName.Text = result.Rows[0]["re_name"].ToString();
            lblTurno.Text = result.Rows[0]["TURNO"].ToString();
            lblRecipe.Text = result.Rows[0]["re_observation"].ToString();
            lblTotalCost.Text = result.Rows[0]["re_total_cost"].ToString();
            ImagenRecipe.ImageUrl = result.Rows[0]["re_image"].ToString();
            lblid.Text = result.Rows[0]["re_recipe"].ToString();
            result = GeneralServices.Show_Data_table("recipe", "F1", recipe_index);
            if (result.Rows.Count > 0)
            {
                grdIngredientes.DataSource = result;
                grdIngredientes.DataBind();
            }
            else
            {
                result.Rows.Add(result.NewRow());
                result.Rows[0]["in_ingredient"] = 1;
                result.Rows[0]["ri_observation"] = "No hay Ingredientes en la receta";
                result.Rows[0]["in_category"] = 1;
                result.Rows[0]["in_unit"] = 1;
                result.Rows[0]["in_origin"] = 1;
                result.Rows[0]["ri_quantity"] = 0;
                grdIngredientes.DataSource = result;
                grdIngredientes.DataBind();
            }
        }
        protected DataTable getData(int type)
        {
            return GeneralServices.Show_Data_table("concept", "S1", type);
        }
        protected DataTable getIng()
        {
            return GeneralServices.Show_Data_table("ingredient", "S1", null);
        }

        protected void grdIngredientes_RowCommand(object sender, GridViewCommandEventArgs e)
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
                id_ing = Convert.ToInt32(grdIngredientes.DataKeys[index].Value);
            }
            catch (Exception)
            {
                id_ing = null;
            }
            switch (com)
            {
                case "edit_ingredient":
                    grdIngredientes.EditIndex = index;
                    BindData();
                    break;
                case "update_ingredient":
                    string qty = ((TextBox)grdIngredientes.Rows[index].FindControl("txtQty")).Text;
                    string obs = ((TextBox)grdIngredientes.Rows[index].FindControl("txtObs")).Text;
                    string ing = ((DropDownList)grdIngredientes.Rows[index].FindControl("DDLingredient")).SelectedValue;
                    if (check_fields(qty, index))
                    {
                        Recipe_ingredientServices.InsertOrUpdate(id_ing, Convert.ToInt32(lblid.Text),
                            Convert.ToInt32(ing), Convert.ToInt32(qty), obs);
                        grdIngredientes.EditIndex = -1;
                        BindData();
                    }
                    break;
                case "cancel_ingredient":
                    grdIngredientes.EditIndex = -1;
                    BindData();
                    break;
                case "delete_ingredient":
                    string result = GeneralServices.Delete_this("recipe_ingredient", "recipes..sp_recipe_ingredient", id_ing.ToString());
                    if (result == "success")
                        BindData();
                    else
                    {
                        Label msg = grdIngredientes.Rows[index].FindControl("lblmsg") as Label;
                        msg.Text = "No se Pudo Eliminar";
                    }
                    break;
                case "add_ingredient":
                    string qtyF = ((TextBox)grdIngredientes.FooterRow.FindControl("txtQty")).Text;
                    string obsF = ((TextBox)grdIngredientes.FooterRow.FindControl("txtObs")).Text;
                    string ingF = ((DropDownList)grdIngredientes.FooterRow.FindControl("DDLingredient")).SelectedValue;
                    if (cmp(ingF) && check_fields(qtyF, index))
                    {
                        Recipe_ingredientServices.InsertOrUpdate(null, Convert.ToInt32(lblid.Text),
                            Convert.ToInt32(ingF), Convert.ToInt32(qtyF), obsF);
                        grdIngredientes.EditIndex = -1;
                        BindData();
                    }
                    break;
                default:
                    break;
            }
        }

        private bool cmp(string ingF)
        {
            Label msg = grdIngredientes.FooterRow.FindControl("lblmsg") as Label;
            if ((Recipe_ingredientServices.CmpID(ingF,lblid.Text)).Rows.Count >0)
            {
                msg.Text = "El ingrediente ya esta en la lista";
                return false;
            }
            return true;
        }     

        private bool check_fields(string qty, int index)
        {
            Label msg;
            try
            {
                msg = grdIngredientes.Rows[index].FindControl("lblmsg") as Label;
            }
            catch (Exception)
            {
                msg = grdIngredientes.FooterRow.FindControl("lblmsg") as Label;
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

        protected void grdIngredientes_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Button b1;
                if (grdIngredientes.EditIndex != -1 && e.Row.RowIndex == grdIngredientes.EditIndex)
                {
                    b1 = e.Row.FindControl("btn_update") as Button;
                    b1.CommandArgument = e.Row.RowIndex.ToString();
                    b1 = e.Row.FindControl("btn_cancel") as Button;
                    b1.CommandArgument = e.Row.RowIndex.ToString();
                }
                else
                {
                    b1 = e.Row.FindControl("btn_edit") as Button;
                    b1.CommandArgument = e.Row.RowIndex.ToString();
                    b1 = e.Row.FindControl("btn_del") as Button;
                    b1.CommandArgument = e.Row.RowIndex.ToString();
                }
            }
        }
    }
}