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
    public partial class RegisterPromotion : System.Web.UI.Page
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
            grdPromotion.DataSource = GeneralServices.Show_Data_table("promotion","S1",null);
            grdPromotion.DataBind();
        }

        protected void btn_createPromotion_Click(object sender, EventArgs e)
        {
            if (checkFields())
            {
                string strname = flpImage1.FileName.ToString();
                string strname2 = null;
                strname = DateTime.Now.ToString("dd.MM.yyyy.hh.mm.ss.ffffff") + strname;
                flpImage1.PostedFile.SaveAs(Server.MapPath("~/Images/PromotionPhotos/") + strname);
                strname = "~/Images/PromotionPhotos/" + strname;
                PromotionServices.InsertOrUpdate(
                    null,txtName.Text,txtTitle.Text,txtDetalles.Text,null,strname,strname2);
                BindData();
            }
        }

        private bool checkFields()
        {
            if (txtName.Text == "")
            {
                lblError.Text = "introduzca un nombre" ;
                return false;
            }
            if (txtTitle.Text == "")
            {
                lblError.Text = "introduzca un titulo";
                return false;
            }
            if (txtDetalles.Text == "")
            {
                lblError.Text = "introduzca los detalles de la promocion";
                return false;
            }
            if (!flpImage1.HasFile)
            {
                lblError.Text = "introduzca una imagen";
                return false;
            }
            return true;
        }

        protected void grdPromotion_RowCommand(object sender, GridViewCommandEventArgs e)
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
            int? id_pro;
            try
            {
                id_pro = Convert.ToInt32(grdPromotion.DataKeys[index].Value);
            }
            catch (Exception)
            {

                id_pro = null;
            }

            switch (com)
            {
                case "edit_promotion":
                    grdPromotion.EditIndex = index;
                    BindData();
                    break;
                case "update_promotion":
                    string name = ((TextBox)grdPromotion.Rows[index].FindControl("txtname")).Text;
                    string title = ((TextBox)grdPromotion.Rows[index].FindControl("txttitle")).Text;
                    string texto = ((TextBox)grdPromotion.Rows[index].FindControl("txt1")).Text;
                    FileUpload img1 = ((FileUpload)grdPromotion.Rows[index].FindControl("img1"));
                    if (check_fields(name,title,texto, index) && img1.HasFile )
                    {
                        string strname = img1.FileName.ToString();
                        string strname2 = null;
                        strname = DateTime.Now.ToString("dd.MM.yyyy.hh.mm.ss.ffffff") + strname;
                        img1.PostedFile.SaveAs(Server.MapPath("~/Images/PromotionPhotos/") + strname);
                        strname = "~/Images/PromotionPhotos/" + strname;
                        PromotionServices.InsertOrUpdate(id_pro, name, title, texto, null, strname, strname2);
                        grdPromotion.EditIndex = -1;
                        BindData();

                    }
                    else
                    {
                        if (check_fields(name, title, texto, index))
                        {
                            DataTable dt = GeneralServices.Show_Data_table("promotion","S2",id_pro);
                            PromotionServices.InsertOrUpdate(id_pro, name, title, texto, null, dt.Rows[0]["pr_image1"].ToString(), dt.Rows[0]["pr_image2"].ToString());

                            grdPromotion.EditIndex = -1;
                            BindData();
                        }
                    }
                    break;
                case "cancel_promotion":
                    grdPromotion.EditIndex = -1;
                    BindData();
                    break;
                case "delete_promotion":
                    string result = GeneralServices.Delete_this("promotion", "recipes2..sp_promotion", id_pro.ToString());
                    if (result == "success")
                    {
                        string ruta1 = ((Image)grdPromotion.Rows[index].FindControl("img1")).ImageUrl;
                        System.IO.File.Delete(Server.MapPath(ruta1));
                        BindData();
                    }
                    else
                    {
                        Label msg = grdPromotion.Rows[index].FindControl("lblmsg") as Label;
                        msg.Text = "No se Pudo Eliminar";
                    }
                    break;
                default:
                    break;
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

        protected void grdPromotion_RowDataBound(object sender, GridViewRowEventArgs e)
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
                if (grdPromotion.EditIndex != -1 && e.Row.RowIndex == grdPromotion.EditIndex)
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