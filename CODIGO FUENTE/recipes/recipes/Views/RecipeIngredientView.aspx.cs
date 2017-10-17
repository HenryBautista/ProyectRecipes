using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using recipes.Services;
using System.Data;

namespace recipes.Views
{
    public partial class RecipeIngredientView : System.Web.UI.Page
    {
        string idrecipe = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                idrecipe = Request.QueryString["valor"];
                if (Session["us_user"] != null)
                {
                    recipe_id.Text = idrecipe;
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
            grdIngredients.DataSource = Recipe_ingredientServices.DataFromRecipe(recipe_id.Text);
            grdIngredients.DataBind();
            DataTable dts = GeneralServices.Show_Data_table("recipe", "S4", Convert.ToInt32(recipe_id.Text));
            txt_code.Text = dts.Rows[0]["re_recipe_id"].ToString();
            txt_nombre.Text = dts.Rows[0]["re_name"].ToString();
            txt_turno.Text = dts.Rows[0]["TURNO"].ToString();
            txt_cost.Text = dts.Rows[0]["re_total_cost"].ToString();
            txt_obs.Text = dts.Rows[0]["re_observation"].ToString();
            txt_url.Text = dts.Rows[0]["re_url_video"].ToString();
            re_iframe.Attributes.Add("src",dts.Rows[0]["re_url_video"].ToString());
        }
        protected DataTable getIngredient()
        {
            return GeneralServices.Show_Data_table("ingredient", "S1", null);
        }

        protected void grdIngredients_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = -1;
            int? id_ing = null;
            string qty = null,obs = null,ingredient = null;
            if (!string.IsNullOrEmpty(e.CommandArgument.ToString()))
            {
                index = Convert.ToInt32(e.CommandArgument);
                id_ing = Convert.ToInt32(grdIngredients.DataKeys[index].Value);                    
            }
            string com = e.CommandName.ToString();
            switch (com)
            {
                case "edit_ingredient":
                    grdIngredients.EditIndex = index;
                    BindData();
                    break;
                case "update_ingredient":
                    qty = ((TextBox)grdIngredients.Rows[index].FindControl("txtQty")).Text;
                    obs = ((TextBox)grdIngredients.Rows[index].FindControl("txtObs")).Text;
                    ingredient = ((DropDownList)grdIngredients.Rows[index].FindControl("DDLingredient")).SelectedValue;
                   Recipe_ingredientServices.InsertOrUpdate(id_ing, Convert.ToInt32(recipe_id.Text), Convert.ToInt32(ingredient), Convert.ToInt32(qty), obs);
                   grdIngredients.EditIndex = -1;
                    BindData();
                    break;
                case "cancel_ingredient":
                    grdIngredients.EditIndex = -1;
                    BindData();
                    break;
                case "delete_ingredient":
                    string result = GeneralServices.Delete_this("recipe_ingredient", "recipes2..sp_recipe_ingredient", id_ing.ToString());
                    if (result == "success")
                        BindData();
                    else
                    {
                        Label msg = grdIngredients.Rows[index].FindControl("lblmsg") as Label;
                        msg.Text = result;
                    }
                    break;
                case "add":
                    qty = ((TextBox)grdIngredients.FooterRow.FindControl("txtfooterqty")).Text;
                    obs = ((TextBox)grdIngredients.FooterRow.FindControl("txtfooterobs")).Text;
                    ingredient = ((DropDownList)grdIngredients.FooterRow.FindControl("DDLfooter")).SelectedValue;
                    if (cmp(ingredient) && check_fields(qty,index))
                    {
                        Recipe_ingredientServices.InsertOrUpdate(null, Convert.ToInt32(recipe_id.Text), Convert.ToInt32(ingredient), Convert.ToInt32(qty), obs);
                        BindData();
                    }
                    break;
                case "add2":
                    qty = ((TextBox)grdIngredients.Controls[0].Controls[0].FindControl("txtemptyqty")).Text;
                    obs = ((TextBox)grdIngredients.Controls[0].Controls[0].FindControl("txtemptyobs")).Text;
                    ingredient = ((DropDownList)grdIngredients.Controls[0].Controls[0].FindControl("DDLempty")).SelectedValue;
                    Recipe_ingredientServices.InsertOrUpdate(null, Convert.ToInt32(recipe_id.Text), Convert.ToInt32(ingredient),Convert.ToInt32(qty),obs);
                    BindData();
                    break;
                default:
                    break;
            }
        }

        private bool cmp(string nutri)
        {
            Label msg = grdIngredients.FooterRow.FindControl("lblmsg") as Label;
            if (Recipe_ingredientServices.CmpID(nutri, recipe_id.Text).Rows.Count > 0)
            {
                msg.Text = "El ingrediente ya existe";
                return false;
            }
            return true;
        }

        private bool check_fields(string qty, int index)
        {
            Label msg;
            try
            {
                msg = grdIngredients.Rows[index].FindControl("lblmsg") as Label;
            }
            catch (Exception)
            {
                msg = grdIngredients.FooterRow.FindControl("lblmsg") as Label;
            }
            if (qty == "")
            {
                msg.Text = "Ingrese una cantidad";
                return false;
            }
            msg.Text = "";
            return true;
        }        

    }
}