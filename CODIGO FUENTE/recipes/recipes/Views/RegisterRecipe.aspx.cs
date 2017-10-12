using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using recipes.Services;
using System.Globalization;
using System.Data;

namespace recipes.Views
{
    public partial class RegisterRecipe : System.Web.UI.Page
    {
        int usr = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["us_user"] != null)
            {
                BindData();
            }
            else
            {
                Response.Redirect("~/Views/Login.aspx");
            }
        }

        private void BindData()
        {
            DDL_unit.DataSource = ConceptServices.GetConcept(1);
            DDL_unit.DataBind();
            grdRecipes.DataSource = GeneralServices.Show_Data_table("recipe","S3",null);
            grdRecipes.DataBind();
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(RecipeID.Text))
            {
                if (file_image.HasFile)
                {
                    string strname = file_image.FileName.ToString();
                    strname = DateTime.Now.ToString("dd.MM.yyyy.hh.mm.ss.ffffff") + strname;
                    file_image.PostedFile.SaveAs(Server.MapPath("~/Images/RecipePhotos/") + strname);
                    strname = "~/Images/RecipePhotos/" + strname;
                    string result = RecipeServices.InsertOrUpdate(null,tbox_id.Text,
                        tbox_name.Text,Convert.ToInt32(DDL_unit.SelectedValue),
                        strname,tbox_url.Text,0,tbox_Observation.Text,usr);
                }
                else
                {

                    string result = RecipeServices.InsertOrUpdate(null, tbox_id.Text,
                        tbox_name.Text, Convert.ToInt32(DDL_unit.SelectedValue),
                        null, tbox_url.Text, 0, tbox_Observation.Text, usr);
                }
            }
            else
            {
                if (file_image.HasFile)
                {
                    string strname = file_image.FileName.ToString();
                    strname = DateTime.Now.ToString("dd.MM.yyyy.hh.mm.ss.ffffff") + strname;
                    file_image.PostedFile.SaveAs(Server.MapPath("~/Images/RecipePhotos/") + strname);
                    strname = "~/Images/RecipePhotos/" + strname;
                    string old = (GeneralServices.Show_Data_table("recipe", "S2", Convert.ToInt32(RecipeID.Text))).Rows[0]["re_image"].ToString();
                    string result = RecipeServices.InsertOrUpdate(Convert.ToInt32(RecipeID.Text),tbox_id.Text,
                        tbox_name.Text,Convert.ToInt32(DDL_unit.SelectedValue),
                        strname,tbox_url.Text,0,tbox_Observation.Text,usr);
                    if (result == "success")
                    {
                        System.IO.File.Delete(Server.MapPath(old));
                    }
                    else
                    {
                        System.IO.File.Delete(Server.MapPath(strname));
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "AlertError();", true);
                    }
                }
                else
                {
                    string old = (GeneralServices.Show_Data_table("recipe", "S2", Convert.ToInt32(RecipeID.Text))).Rows[0]["re_image"].ToString();
                    RecipeServices.InsertOrUpdate(Convert.ToInt32(RecipeID.Text), tbox_id.Text,
                        tbox_name.Text, Convert.ToInt32(DDL_unit.SelectedValue),
                        old, tbox_url.Text, 0, tbox_Observation.Text, usr);
                }
            }
            BindData();
        }
        protected void grdIngredients_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = -1;
            string idrecipe = null;
            TextInfo ti = CultureInfo.CurrentCulture.TextInfo;
            if ((!string.IsNullOrEmpty(e.CommandArgument.ToString())) && e.CommandName == "edit_recipe")
            {
                index = Convert.ToInt32(e.CommandArgument);
                idrecipe = grdRecipes.DataKeys[index].Value.ToString();
                DataTable dt = GeneralServices.Show_Data_table("recipe", "S2", Convert.ToInt32(idrecipe));
                RecipeID.Text = idrecipe;
                tbox_id .Text = dt.Rows[0]["re_recipe_id"].ToString();
                tbox_name.Text = dt.Rows[0]["re_name"].ToString();
                tbox_url.Text = dt.Rows[0]["re_url_video"].ToString();
                tbox_Observation.Text = dt.Rows[0]["re_observation"].ToString();
                DDL_unit.SelectedValue = dt.Rows[0]["re_turn"].ToString();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
            }
            if ((!string.IsNullOrEmpty(e.CommandArgument.ToString())) && e.CommandName == "delete_recipe")
            {
                index = Convert.ToInt32(e.CommandArgument);
                idrecipe = grdRecipes.DataKeys[index].Value.ToString();
                string old = (GeneralServices.Show_Data_table("recipe", "S2", Convert.ToInt32(idrecipe))).Rows[0]["re_image"].ToString();
                string result = GeneralServices.Delete_this("recipe", "recipes2..sp_recipe", idrecipe);
                if (result == "success")
                {
                    if (!string.IsNullOrEmpty(old))
                    {                        
                        System.IO.File.Delete(Server.MapPath(old));
                    }
                    BindData();
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "AlertError();", true);
                }
            }
        }
    }
}