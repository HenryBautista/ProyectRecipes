using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using recipes.Services;
using System.Data;
using System.Globalization;

namespace recipes.Views
{
    public partial class RegisterPromotion : System.Web.UI.Page
    {   
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["us_user"] != null && bool.Parse(Session["us_master"].ToString()))
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
            grdPromotion.DataSource = GeneralServices.Show_Data_table("promotion","S1",null);
            grdPromotion.DataBind();
        }

        protected void btn_createPromotion_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(promotionID.Text))
            {
                if (file_image.HasFile)
                {
                    string strname = file_image.FileName.ToString();
                    strname = DateTime.Now.ToString("dd.MM.yyyy.hh.mm.ss.ffffff") + strname;
                    file_image.PostedFile.SaveAs(Server.MapPath("~/Images/PromotionPhotos/") + strname);
                    strname = "~/Images/PromotionPhotos/" + strname;
                    string result = PromotionServices.InsertOrUpdate(
                    null, tbox_name.Text, tbox_tittle.Text, tbox_detail.Text, strname);
                }
                else
                {
                    string result = PromotionServices.InsertOrUpdate(
                    null, tbox_name.Text, tbox_tittle.Text, tbox_detail.Text, null);
                }
            }
            else
            {
                if (file_image.HasFile)
                {
                    string strname = file_image.FileName.ToString();
                    strname = DateTime.Now.ToString("dd.MM.yyyy.hh.mm.ss.ffffff") + strname;
                    file_image.PostedFile.SaveAs(Server.MapPath("~/Images/PromotionPhotos/") + strname);
                    strname = "~/Images/PromotionPhotos/" + strname;
                    string old = (GeneralServices.Show_Data_table("promotion", "S2", Convert.ToInt32(promotionID.Text))).Rows[0]["pr_image"].ToString();
                    string result = PromotionServices.InsertOrUpdate(
                    Convert.ToInt32(promotionID.Text), tbox_name.Text, tbox_tittle.Text, tbox_detail.Text, strname);
                    if (result == "success" && !string.IsNullOrEmpty(old))
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
                    string old = (GeneralServices.Show_Data_table("promotion", "S2", Convert.ToInt32(promotionID.Text))).Rows[0]["pr_image"].ToString();
                    string result = PromotionServices.InsertOrUpdate(
                    Convert.ToInt32(promotionID.Text), tbox_name.Text, tbox_tittle.Text, tbox_detail.Text, old);
                }
            }
            BindData();
        }
        protected void grdPromotion_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = -1;
            string idpromotion = null;
            TextInfo ti = CultureInfo.CurrentCulture.TextInfo;
            if ((!string.IsNullOrEmpty(e.CommandArgument.ToString())) && e.CommandName == "edit_promotion")
            {
                index = Convert.ToInt32(e.CommandArgument);
                idpromotion = grdPromotion.DataKeys[index].Value.ToString();
                DataTable dt = GeneralServices.Show_Data_table("promotion", "S2", Convert.ToInt32(idpromotion));
                promotionID.Text = idpromotion;
                tbox_name.Text = dt.Rows[0]["pr_name"].ToString();
                tbox_tittle.Text = dt.Rows[0]["pr_title"].ToString();
                tbox_detail.Text = dt.Rows[0]["pr_text"].ToString();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
            }
            if ((!string.IsNullOrEmpty(e.CommandArgument.ToString())) && e.CommandName == "delete_promotion")
            {
                index = Convert.ToInt32(e.CommandArgument);
                idpromotion = grdPromotion.DataKeys[index].Value.ToString();
                string old = (GeneralServices.Show_Data_table("promotion", "S2", Convert.ToInt32(idpromotion))).Rows[0]["pr_image"].ToString();
                string result = GeneralServices.Delete_this("promotion", "recipes2..sp_promotion", idpromotion);
                if (result == "success" && !string.IsNullOrEmpty(old))
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

        private bool check_fields(string name, string title, string texto, int index)
        {
            Label msg = (Label)grdPromotion.Rows[index].FindControl("lblmsg");
            if (name == "")
            {
                msg.Text = "Ingrese un nombre" ;
                return false;
            }
            if (title == "")
            {
                msg.Text = "Ingrese un titulo";
                return false;
            }
            if (texto == "")
            {
                msg.Text = "Ingrese el detalle";
                return false;
            }
            return true;
        }

    }
}