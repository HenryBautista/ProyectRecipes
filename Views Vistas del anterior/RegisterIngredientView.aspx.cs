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
    public partial class RegisterIngredientView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                BindData();
        }
        protected void BindData()
        {
            DDL_unit.DataSource = getData(2);
            DDL_unit.DataBind();
            DDL_category.DataSource = getData(3);
            DDL_category.DataBind();
            DDL_origin.DataSource = getData(4);
            DDL_origin.DataBind();
        }
        protected void btn_crear_Click(object sender, EventArgs e)
        {
            if (check_fields())
            {                
                string strname = file_image.FileName.ToString();
                strname = DateTime.Now.ToString("dd.MM.yyyy.hh.mm.ss.ffffff") + strname;
                file_image.PostedFile.SaveAs(Server.MapPath("~/Images/RecipePhotos/") + strname);
                strname = "~/Images/RecipePhotos/" + strname;
                string result = IngredientServices.InsertOrUpdate(null, tbox_code.Text,strname, tbox_name.Text, Int32.Parse(DDL_unit.SelectedValue), float.Parse(tbox_price.Text),Int32.Parse(tbox_qty.Text), Int32.Parse(DDL_category.SelectedValue), Int32.Parse(DDL_origin.SelectedValue));
                if (result == "success")
                {
                    BindData();
                }
                else
                {
                    lbl_msg.InnerText = result;
                }
            }
            
        }
        private bool check_fields()
        {
            if (tbox_code.Text == "")
            {
                lbl_msg.InnerText = "Ingrese un Codigo";
                return false;
            }
            if (IngredientServices.CmpID(tbox_code.Text).Rows.Count>0)
            {
                lbl_msg.InnerText = "El Codigo de ingrediente ya existe";
                return false;
            }
            if (tbox_name.Text == "")
            {
                lbl_msg.InnerText = "Ingrese un Nombre";
                return false;
            }
            if (tbox_price.Text == "")
            {
                lbl_msg.InnerText = "Ingrese un Costo";
                return false;
            }
            if (tbox_qty.Text == "")
            {
                lbl_msg.InnerText = "Ingrese una cantidad";
                return false;
            }
            if (!file_image.HasFile)
            {
                lbl_msg.InnerText = "Ingrese una imagen";
                return false;
            }
            try
            {
                float n = float.Parse(tbox_price.Text);
                n = float.Parse(tbox_qty.Text);
            }
            catch (Exception e)
            {
                lbl_msg.InnerText = "Un dato numerico no es correcto";
                return false;
            }

            lbl_msg.InnerText = "";
            return true;
        }

        protected DataTable getData(int type)
        {
            return GeneralServices.Show_Data_table("concept", "S1", type);
        }
        //-----------------------------------------------------------------------------------------------------------------------------------
    }
}