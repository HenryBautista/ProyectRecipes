using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using recipes.Services;
using System.Globalization;

namespace recipes.Views
{
    public partial class RegisterNutrient : System.Web.UI.Page
    {
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
        //llena el grid con la consulta 
        private void BindData()
        {
            grdNutrients.DataSource = GeneralServices.Show_Data_table("nutrient","S1",null);
            grdNutrients.DataBind();
        }
        //comandos del grid
         protected void grdNutrients_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = -1;
            string idnutrient = null;
            string name;
            TextInfo ti = CultureInfo.CurrentCulture.TextInfo;
            if (!string.IsNullOrEmpty(e.CommandArgument.ToString()))
            {
                index = Convert.ToInt32(e.CommandArgument);
                idnutrient = grdNutrients.DataKeys[index].Value.ToString();
            }
            switch (e.CommandName.ToString())
            {//si no hay datos en el grid esta el add2
                case "add2":
                    name = ((TextBox)grdNutrients.Controls[0].Controls[0].FindControl("txtempty")).Text;
                    name.TrimEnd().TrimStart();
                    name = ti.ToTitleCase(name);
                    NutrientServices.InsertOrUpdate(null, name);
                    BindData();
                    break;
                    // desde el footer
                case "add":
                    name = ((TextBox)grdNutrients.FooterRow.FindControl("txtfooter")).Text;
                    name.TrimEnd().TrimStart();
                    name = ti.ToTitleCase(name);
                    if (check_fields(name,index))
                    {
                        NutrientServices.InsertOrUpdate(null, name);
                        BindData();
                    }
                    break;
                case "edit_nutrient":
                    grdNutrients.EditIndex = index;
                    BindData();
                    break;
                case "delete_nutrient":
                    string result = GeneralServices.Delete_this("nutrient", "recipes2..sp_nutrient", idnutrient);
                    if (result != "success")
                    {
                        Label msg = grdNutrients.Rows[index].FindControl("lblmsg") as Label;
                        msg.Text = result;
                    }
                    else
                    {
                        BindData();
                    }
                    break;
                case "update_nutrient":
                    name = ((TextBox)grdNutrients.Rows[index].FindControl("txtname")).Text;
                    name.TrimEnd().TrimStart();
                    name = ti.ToTitleCase(name);
                    if (check_fields(name, index))
                    {
                        NutrientServices.InsertOrUpdate(Convert.ToInt32(idnutrient), name);
                        grdNutrients.EditIndex = -1;
                        BindData();
                    }
                    break;
                case "cancel_nutrient":
                    grdNutrients.EditIndex = -1;
                    BindData();
                    break;
                default:
                    break;
            }
        }
         private bool check_fields(string name, int index)
         {
             Label msg;
             if (index!=-1)
             {                 
                msg = grdNutrients.Rows[index].FindControl("lblmsg") as Label;
             }
             else
             {
                 msg = grdNutrients.FooterRow.FindControl("lblmsg2") as Label;
             }
             if (name == "")
             {
                 msg.Text = "Ingrese un nombre";
                 return false;
             }
             try
             {
                 if (NutrientServices.CmpID(name).Rows.Count == 1)
                 {
                     msg.Text = "El nutriente ya existe";
                     return false;
                 }
             }
             catch (Exception e)
             {
                 msg.Text = e.Message;
             }
             msg.Text = "";
             return true;
         }
    }
}