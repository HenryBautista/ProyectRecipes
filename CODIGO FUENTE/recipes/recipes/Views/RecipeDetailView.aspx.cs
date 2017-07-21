using recipes.Services;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace recipes.Views
{
    public partial class RecipeDetailView : System.Web.UI.Page
    {
        int recipe_index;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["RecID"] != "")
                {
                    recipe_index = Convert.ToInt32(Request.QueryString["RecID"]);
                    FillRecipe();
                }
            }
        }
        private void FillRecipe()
        {
            DataTable result = GeneralServices.Show_Data_table("recipe","S4",recipe_index);
            lblRecipeName.Text = result.Rows[0]["re_name"].ToString();
            lblTurno.Text = result.Rows[0]["TURNO"].ToString();
            lblRecipe.Text = result.Rows[0]["re_observation"].ToString();
            lblTotalCost.Text = result.Rows[0]["re_total_cost"].ToString();
            ImagenRecipe.ImageUrl = result.Rows[0]["re_image"].ToString();
            lblid.Text = result.Rows[0]["re_recipe"].ToString();
            result = GeneralServices.Show_Data_table("recipe","F1",recipe_index);
            grdIngredients.DataSource = result;
            grdIngredients.DataBind();
        }

        protected void Edit_Click(object sender, EventArgs e)
        {
            Response.Redirect("EditRecipeView.aspx?RecID=" + lblid.Text);
        }

        protected void grdIngredients_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string ingredientId = grdIngredients.DataKeys[e.Row.RowIndex].Value.ToString();
                GridView grdNutrientes = e.Row.FindControl("grdNutrientes") as GridView;
                grdNutrientes.DataSource = GeneralServices.Show_Data_table("ingredient", "F2", Convert.ToInt32(ingredientId)); ;
                grdNutrientes.DataBind();
            }
        }
    }
}