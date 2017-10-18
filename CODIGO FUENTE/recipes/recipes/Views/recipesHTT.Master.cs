using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using recipes.Services;

namespace recipes.Views
{
    public partial class recipesHTT : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                string current = this.ContentPlaceHolder1.Page.GetType().Name;
                if (!current.Contains("startpageview"))
                {
                    hero_area.Visible = false;
                }
                if (Session["us_user"] != null)
                {
                    BindData();
                }
            }
            GetUser();
        }

        private void BindData()
        {
            grdRecetasPop.DataSource = GeneralServices.Show_Data_table("user", "F2", Convert.ToInt32(Session["us_id"].ToString())); ;
            grdRecetasPop.DataBind();
            grdIngredientesPop.DataSource = GeneralServices.Show_Data_table("user", "F3", Convert.ToInt32(Session["us_id"].ToString()));
            grdIngredientesPop.DataBind();
        }
        private void GetUser()
        {            
            if (Session["us_user"] != null)
            {
                if (bool.Parse( Session["us_master"].ToString()))
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "ismaster();", true);
                    lbl_master.InnerText = Session["us_user"].ToString().ToUpper();
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "isuser();", true);
                    lbl_user.InnerText = Session["us_user"].ToString().ToUpper();
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "isnormal();", true);
            }
            ImageInicio.Src = (PromotionServices.GetInicio()).Rows[0]["pr_image"].ToString();
        }

        protected void grdRecetasPop_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = -1;
            string idreceta = null;
            string com = e.CommandName;
            if (!string.IsNullOrEmpty(e.CommandArgument.ToString()))
            {
                index = Convert.ToInt32(e.CommandArgument);
                idreceta = grdRecetasPop.DataKeys[index].Value.ToString();
            }
            switch (com)
            {
                case "delete_recipe":
                    string result = GeneralServices.Delete_this("recipe_order", "recipes..sp_recipe_order", idreceta);
                    if (result == "success")
                    {
                        BindData();
                    }
                    else
                    {
                        Label msg = grdRecetasPop.Rows[index].FindControl("lblmsg") as Label;
                        msg.Text = "No se Pudo Eliminar";
                    }
                    break;
                default:
                    break;
            }
        }

        protected void grdIngredientesPop_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = -1;
            string idingredient = null;
            string com = e.CommandName;
            if (!string.IsNullOrEmpty(e.CommandArgument.ToString()))
            {
                index = Convert.ToInt32(e.CommandArgument);
                idingredient = grdIngredientesPop.DataKeys[index].Value.ToString();
            }
            switch (com)
            {
                case "delete_ingredient":
                    string result = GeneralServices.Delete_this("recipe_order", "recipes..sp_recipe_order", idingredient);
                    if (result == "success")
                    {
                        BindData();
                    }
                    else
                    {
                        Label msg = grdIngredientesPop.Rows[index].FindControl("lblmsg") as Label;
                        msg.Text = "No se Pudo Eliminar";
                    }
                    break;
                default:
                    break;
            }
        }
    }
}