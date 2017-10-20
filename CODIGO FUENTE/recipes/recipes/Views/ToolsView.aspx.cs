using recipes.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace recipes.Views
{
    public partial class ToolsView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
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
        }

        //llena el grid con la consulta 
        private void BindData()
        {
            grdTurnos.DataSource = ConceptServices.GetConcept(1);
            grdTurnos.DataBind();
            grdCategorias.DataSource = ConceptServices.GetConcept(3);
            grdCategorias.DataBind();
            grdOrigen.DataSource = ConceptServices.GetConcept(4);
            grdOrigen.DataBind();
            grdUnidad.DataSource = ConceptServices.GetConcept(2);
            grdUnidad.DataBind();
        }
        protected void grdTurnos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = -1;
            string idcorrelative = null;
            string name, abbrebiation;
            if (!string.IsNullOrEmpty(e.CommandArgument.ToString()))
            {
                index = Convert.ToInt32(e.CommandArgument);
                idcorrelative = grdTurnos.DataKeys[index].Value.ToString();
            }
            switch (e.CommandName.ToString())
            {//si no hay datos en el grid esta el add2
                case "add2":
                    name = ((TextBox)grdTurnos.Controls[0].Controls[0].FindControl("txtempty")).Text;
                    name.TrimEnd().TrimStart();
                    abbrebiation = ((TextBox)grdTurnos.Controls[0].Controls[0].FindControl("txtemptyAB")).Text;
                    OthersServices.InsertOrUpdateTurn(null, name.ToUpper(), abbrebiation.ToUpper());
                    BindData();
                    break;
                // desde el footer
                case "add":
                    name = ((TextBox)grdTurnos.FooterRow.FindControl("txtfooter")).Text;
                    name.TrimEnd().TrimStart();
                    abbrebiation = ((TextBox)grdTurnos.FooterRow.FindControl("txtfooterAB")).Text;
                    if (check_fields1(name, index))
                    {
                        OthersServices.InsertOrUpdateTurn(null, name.ToUpper(), abbrebiation.ToUpper());
                        BindData();
                    }
                    break;
                case "edit_nutrient":
                    grdTurnos.EditIndex = index;
                    BindData();
                    break;
                case "delete_nutrient":
                    string result = OthersServices.Delete_this("1", idcorrelative);
                    if (result != "success")
                    {
                        Label msg = grdTurnos.Rows[index].FindControl("lblmsg") as Label;
                        msg.Text = result;
                    }
                    else
                    {
                        BindData();
                    }
                    break;
                case "update_nutrient":
                    name = ((TextBox)grdTurnos.Rows[index].FindControl("txtname")).Text;
                    name.TrimEnd().TrimStart();
                    abbrebiation = ((TextBox)grdTurnos.Rows[index].FindControl("txtAB")).Text;;
                    
                        OthersServices.InsertOrUpdateTurn(Convert.ToInt32(idcorrelative), name.ToUpper(), abbrebiation.ToUpper());
                        grdTurnos.EditIndex = -1;
                        BindData();
                    break;
                case "cancel_nutrient":
                    grdTurnos.EditIndex = -1;
                    BindData();
                    break;
                default:
                    break;
            }
        }
        private bool check_fields1(string name, int index)
        {
            Label msg;
            if (index != -1)
            {
                msg = grdTurnos.Rows[index].FindControl("lblmsg") as Label;
            }
            else
            {
                msg = grdTurnos.FooterRow.FindControl("lblmsg2") as Label;
            }
            if (name == "")
            {
                msg.Text = "Ingrese un nombre";
                return false;
            }
            try
            {
                if (OthersServices.CmpID(name).Rows.Count == 1)
                {
                    msg.Text = "El registro ya existe";
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

        protected void grdCategorias_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = -1;
            string idcorrelative = null;
            string name, abbrebiation;
            if (!string.IsNullOrEmpty(e.CommandArgument.ToString()))
            {
                index = Convert.ToInt32(e.CommandArgument);
                idcorrelative = grdCategorias.DataKeys[index].Value.ToString();
            }
            switch (e.CommandName.ToString())
            {//si no hay datos en el grid esta el add2
                case "add2":
                    name = ((TextBox)grdCategorias.Controls[0].Controls[0].FindControl("txtempty")).Text;
                    name.TrimEnd().TrimStart();
                    abbrebiation = ((TextBox)grdCategorias.Controls[0].Controls[0].FindControl("txtemptyAB")).Text;
                    OthersServices.InsertOrUpdateCategiry(null, name.ToUpper(), abbrebiation.ToUpper());
                    BindData();
                    break;
                // desde el footer
                case "add":
                    name = ((TextBox)grdCategorias.FooterRow.FindControl("txtfooter")).Text;
                    name.TrimEnd().TrimStart();
                    abbrebiation = ((TextBox)grdCategorias.FooterRow.FindControl("txtfooterAB")).Text;
                    if (check_fields2(name, index))
                    {
                        OthersServices.InsertOrUpdateCategiry(null, name.ToUpper(), abbrebiation.ToUpper());
                        BindData();
                    }
                    break;
                case "edit_nutrient":
                    grdCategorias.EditIndex = index;
                    BindData();
                    break;
                case "delete_nutrient":
                    string result = OthersServices.Delete_this("3", idcorrelative);
                    if (result != "success")
                    {
                        Label msg = grdCategorias.Rows[index].FindControl("lblmsg") as Label;
                        msg.Text = result;
                    }
                    else
                    {
                        BindData();
                    }
                    break;
                case "update_nutrient":
                    name = ((TextBox)grdCategorias.Rows[index].FindControl("txtname")).Text;
                    name.TrimEnd().TrimStart();
                    abbrebiation = ((TextBox)grdCategorias.Rows[index].FindControl("txtAB")).Text;;
                    
                        OthersServices.InsertOrUpdateCategiry(Convert.ToInt32(idcorrelative), name.ToUpper(), abbrebiation.ToUpper());
                        grdCategorias.EditIndex = -1;
                        BindData();
                    break;
                case "cancel_nutrient":
                    grdCategorias.EditIndex = -1;
                    BindData();
                    break;
                default:
                    break;
            }
        }

        private bool check_fields2(string name, int index)
        {
            Label msg;
            if (index != -1)
            {
                msg = grdCategorias.Rows[index].FindControl("lblmsg") as Label;
            }
            else
            {
                msg = grdCategorias.FooterRow.FindControl("lblmsg2") as Label;
            }
            if (name == "")
            {
                msg.Text = "Ingrese un nombre";
                return false;
            }
            try
            {
                if (OthersServices.CmpID(name).Rows.Count == 1)
                {
                    msg.Text = "El registro ya existe";
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

        protected void grdOrigen_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = -1;
            string idcorrelative = null;
            string name, abbrebiation;
            if (!string.IsNullOrEmpty(e.CommandArgument.ToString()))
            {
                index = Convert.ToInt32(e.CommandArgument);
                idcorrelative = grdOrigen.DataKeys[index].Value.ToString();
            }
            switch (e.CommandName.ToString())
            {//si no hay datos en el grid esta el add2
                case "add2":
                    name = ((TextBox)grdOrigen.Controls[0].Controls[0].FindControl("txtempty")).Text;
                    name.TrimEnd().TrimStart();
                    abbrebiation = ((TextBox)grdOrigen.Controls[0].Controls[0].FindControl("txtemptyAB")).Text;
                    OthersServices.InsertOrUpdateOrigin(null, name.ToUpper(), abbrebiation.ToUpper());
                    BindData();
                    break;
                // desde el footer
                case "add":
                    name = ((TextBox)grdOrigen.FooterRow.FindControl("txtfooter")).Text;
                    name.TrimEnd().TrimStart();
                    abbrebiation = ((TextBox)grdOrigen.FooterRow.FindControl("txtfooterAB")).Text;
                    if (check_fields3(name, index))
                    {
                        OthersServices.InsertOrUpdateOrigin(null, name.ToUpper(), abbrebiation.ToUpper());
                        BindData();
                    }
                    break;
                case "edit_nutrient":
                    grdOrigen.EditIndex = index;
                    BindData();
                    break;
                case "delete_nutrient":
                    string result = OthersServices.Delete_this("4", idcorrelative);
                    if (result != "success")
                    {
                        Label msg = grdOrigen.Rows[index].FindControl("lblmsg") as Label;
                        msg.Text = result;
                    }
                    else
                    {
                        BindData();
                    }
                    break;
                case "update_nutrient":
                    name = ((TextBox)grdOrigen.Rows[index].FindControl("txtname")).Text;
                    name.TrimEnd().TrimStart();
                    abbrebiation = ((TextBox)grdOrigen.Rows[index].FindControl("txtAB")).Text;;
                    
                        OthersServices.InsertOrUpdateOrigin(Convert.ToInt32(idcorrelative), name.ToUpper(), abbrebiation.ToUpper());
                        grdOrigen.EditIndex = -1;
                        BindData();
                    break;
                case "cancel_nutrient":
                    grdOrigen.EditIndex = -1;
                    BindData();
                    break;
                default:
                    break;
            }
        }

        private bool check_fields3(string name, int index)
        {
            Label msg;
            if (index != -1)
            {
                msg = grdOrigen.Rows[index].FindControl("lblmsg") as Label;
            }
            else
            {
                msg = grdOrigen.FooterRow.FindControl("lblmsg2") as Label;
            }
            if (name == "")
            {
                msg.Text = "Ingrese un nombre";
                return false;
            }
            try
            {
                if (OthersServices.CmpID(name).Rows.Count == 1)
                {
                    msg.Text = "El registro ya existe";
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

        protected void grdUnidad_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = -1;
            string idcorrelative = null;
            string name, abbrebiation;
            if (!string.IsNullOrEmpty(e.CommandArgument.ToString()))
            {
                index = Convert.ToInt32(e.CommandArgument);
                idcorrelative = grdUnidad.DataKeys[index].Value.ToString();
            }
            switch (e.CommandName.ToString())
            {//si no hay datos en el grid esta el add2
                case "add2":
                    name = ((TextBox)grdUnidad.Controls[0].Controls[0].FindControl("txtempty")).Text;
                    name.TrimEnd().TrimStart();
                    abbrebiation = ((TextBox)grdUnidad.Controls[0].Controls[0].FindControl("txtemptyAB")).Text;
                    OthersServices.InsertOrUpdateUnit(null, name.ToUpper(), abbrebiation.ToUpper());
                    BindData();
                    break;
                // desde el footer
                case "add":
                    name = ((TextBox)grdUnidad.FooterRow.FindControl("txtfooter")).Text;
                    name.TrimEnd().TrimStart();
                    abbrebiation = ((TextBox)grdUnidad.FooterRow.FindControl("txtfooterAB")).Text;
                    if (check_fields4(name, index))
                    {
                        OthersServices.InsertOrUpdateUnit(null, name.ToUpper(), abbrebiation.ToUpper());
                        BindData();
                    }
                    break;
                case "edit_nutrient":
                    grdUnidad.EditIndex = index;
                    BindData();
                    break;
                case "delete_nutrient":
                    string result = OthersServices.Delete_this("2", idcorrelative);
                    if (result != "success")
                    {
                        Label msg = grdUnidad.Rows[index].FindControl("lblmsg") as Label;
                        msg.Text = result;
                    }
                    else
                    {
                        BindData();
                    }
                    break;
                case "update_nutrient":
                    name = ((TextBox)grdUnidad.Rows[index].FindControl("txtname")).Text;
                    name.TrimEnd().TrimStart();
                    abbrebiation = ((TextBox)grdUnidad.Rows[index].FindControl("txtAB")).Text;;
                    
                        OthersServices.InsertOrUpdateUnit(Convert.ToInt32(idcorrelative), name.ToUpper(), abbrebiation.ToUpper());
                        grdUnidad.EditIndex = -1;
                        BindData();
                    break;
                case "cancel_nutrient":
                    grdUnidad.EditIndex = -1;
                    BindData();
                    break;
                default:
                    break;
            }
        }

        private bool check_fields4(string name, int index)
        {
            Label msg;
            if (index != -1)
            {
                msg = grdUnidad.Rows[index].FindControl("lblmsg") as Label;
            }
            else
            {
                msg = grdUnidad.FooterRow.FindControl("lblmsg2") as Label;
            }
            if (name == "")
            {
                msg.Text = "Ingrese un nombre";
                return false;
            }
            try
            {
                if (OthersServices.CmpID(name).Rows.Count == 1)
                {
                    msg.Text = "El registro ya existe";
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