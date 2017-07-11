﻿using System;
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
            grdIngredientes.DataSource = GeneralServices.Show_Data_table("ingredient", "S1", null);
            grdIngredientes.DataBind();
        }
        protected void btn_crear_Click(object sender, EventArgs e)
        {
            if (check_fields())
            {
                string result = IngredientServices.InsertOrUpdate(null, tbox_code.Text, tbox_name.Text, Int32.Parse(DDL_unit.SelectedValue), float.Parse(tbox_price.Text), float.Parse(tbox_factor.Text), Int32.Parse(DDL_category.SelectedValue), Int32.Parse(DDL_origin.SelectedValue));
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
            if (tbox_factor.Text == "")
            {
                lbl_msg.InnerText = "Ingrese un Factor";
                return false;
            }
            try
            {
                float n = float.Parse(tbox_price.Text);
                n = float.Parse(tbox_factor.Text);
            }
            catch (Exception e)
            {
                lbl_msg.InnerText = "Un dato numerico no es correcto";
                return false;
            }

            lbl_msg.InnerText = "";
            return true;
        }
        private bool check_fields(string cod,string name,string price,string factor, int index)
        {
            Label msg = grdIngredientes.Rows[index].FindControl("lblmsg") as Label;

            if (cod == "")
            {
                msg.Text = "Ingrese un Codigo";
                return false;
            }
            if (IngredientServices.CmpID(cod).Rows.Count > 1)
            {
                msg.Text = "El Codigo de ingrediente ya existe";
                return false;
            }
            if (name == "")
            {
                msg.Text = "Ingrese un Nombre";
                return false;
            }
            if (price == "")
            {
                msg.Text = "Ingrese un Costo";
                return false;
            }
            if (factor == "")
            {
                msg.Text = "Ingrese un Factor";
                return false;
            }
            try
            {
                float n = float.Parse(price);
                n = float.Parse(factor);
            }
            catch (Exception e)
            {
                msg.Text = "Un dato numerico no es correcto";
                return false;
            }

            msg.Text = "";
            return true;
        }
        protected DataTable getData(int type)
        {
            return GeneralServices.Show_Data_table("concept", "S1", type);
        }
        protected DataTable getNutrients()
        {
            return GeneralServices.Show_Data_table("nutrient", "S1", null);
        }
        //--------------------------------------------------------METODOS DEL SUBGRID---------------------------------------------------------
        
        //protected void grd_RowEditing(object sender, GridViewEditEventArgs e)
        //{
        //    //cast grid view           
        //    GridView g = (GridView)sender;
        //    //obtengo el index del grid grande que guarde en el subgrid
        //    int nro = Convert.ToInt32(((Label)g.Rows[0].FindControl("lblNro")).Text);
        //    //saco el subgrid view 
        //    GridView grdNutrientes = grdIngredientes.Rows[nro].FindControl("grdNutrientes") as GridView;
        //    grdNutrientes.EditIndex = e.NewEditIndex;
        //    BindData();
        //}
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            //    string nombreProducto = ((TextBox)grd.FooterRow.FindControl("txtNombre")).Text;

            //    SqlConnection conexion = new SqlConnection(cadena);
            //    SqlCommand comando = new SqlCommand();
            //    conexion.Open();

            //    comando.CommandType = CommandType.StoredProcedure;
            //    comando.CommandText = "ListaDeproductos..sp_addPruduct";  //////////////insert into producto(nombre) values (@i_nombre)
            //    comando.Parameters.AddWithValue("@i_nombre", nombreProducto);

            //    comando.Connection = conexion;
            //    comando.ExecuteNonQuery();
            //    fillList();
        }

        protected void deleteProduct_Click(object sender, EventArgs e)
        {
            //    LinkButton lnkRemove = (LinkButton)sender;

            //    SqlConnection conexion = new SqlConnection(cadena);
            //    SqlCommand comando = new SqlCommand();
            //    conexion.Open();

            //    comando.CommandType = CommandType.StoredProcedure;
            //    comando.CommandText = "ListaDeproductos..sp_deleteProduct"; ////////// delete producto where id_producto=@id_producto
            //    comando.Parameters.Add("@id_producto", SqlDbType.VarChar).Value = lnkRemove.CommandArgument;

            //    comando.Connection = conexion;
            //    comando.ExecuteNonQuery();
            //    fillList();
        }
        protected void OnPaging(object sender, GridViewPageEventArgs e)
        {
            //    fillList();
            //    grd.PageIndex = e.NewPageIndex;
            //    grd.DataBind();
        }

        //--------------METODO QUE PERTENECE AL GRID PRINCIPAL, QUE DESPLIEGA EL SUBGRID
        protected void grdIngredientes_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string ingredientId = grdIngredientes.DataKeys[e.Row.RowIndex].Value.ToString();
                Button b1= e.Row.FindControl("btn_edit") as Button;
                b1.CommandArgument = e.Row.RowIndex.ToString();
                b1 = e.Row.FindControl("BtnEdit") as Button;
                b1.CommandArgument = e.Row.RowIndex.ToString();
                b1 = e.Row.FindControl("btn_update") as Button;
                b1.CommandArgument = e.Row.RowIndex.ToString();
                b1 = e.Row.FindControl("btn_cancel") as Button;
                b1.CommandArgument = e.Row.RowIndex.ToString();
                b1 = e.Row.FindControl("btn_del") as Button;
                b1.CommandArgument = e.Row.RowIndex.ToString();
                GridView grdNutrientes = e.Row.FindControl("grdNutrientes") as GridView;
                grdNutrientes.DataSource = IngredientServices.getIngrdientNutrientGrd( int.Parse( ingredientId),e.Row.RowIndex);
                grdNutrientes.DataBind();

            }
        }        
        protected void grdIngredientes_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grdIngredientes.EditIndex = -1;
            BindData();
        }

        protected void grdIngredientes_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);
            string com = e.CommandName.ToString();
            int id_ing = Convert.ToInt32(grdIngredientes.DataKeys[index].Value);
            switch (com)
            {
                case "edit_ingredient":
                    Button b1 = grdIngredientes.Rows[index].FindControl("btn_edit") as Button;
                    b1.Visible = false;
                    b1 = grdIngredientes.Rows[index].FindControl("btn_update") as Button;
                    b1.Visible = true;
                    b1 = grdIngredientes.Rows[index].FindControl("btn_cancel") as Button;
                    b1.Visible = true;
                    grdIngredientes.EditIndex = index;
                    BindData();
                    break;
                case "update_ingredient":
                    string cod = ((TextBox)grdIngredientes.Rows[index].FindControl("txtCodigo")).Text;
                    string name = ((TextBox)grdIngredientes.Rows[index].FindControl("txtNombre")).Text;
                    string price = ((TextBox)grdIngredientes.Rows[index].FindControl("txtCosto")).Text;
                    string factor = ((TextBox)grdIngredientes.Rows[index].FindControl("txtFactor")).Text;
                    string unit = ((DropDownList)grdIngredientes.Rows[index].FindControl("DDLUnidadMedida")).SelectedValue;
                    string cat = ((DropDownList)grdIngredientes.Rows[index].FindControl("DDLCategory")).SelectedValue;
                    string org = ((DropDownList)grdIngredientes.Rows[index].FindControl("DDLOrigin")).SelectedValue;
                    if (check_fields(cod,name,price,factor,index))
                    {
                        IngredientServices.InsertOrUpdate(id_ing,
                            cod,name,Convert.ToInt32(unit),float.Parse( price), float.Parse(factor), Convert.ToInt32(cat), Convert.ToInt32(org));
                        grdIngredientes.EditIndex = -1;
                        BindData();
                    }
                    break;
                case "cancel_ingredient":
                    Button b2 = grdIngredientes.Rows[index].FindControl("btn_edit") as Button;
                    b2.Visible = true;
                    b2 = grdIngredientes.Rows[index].FindControl("btn_update") as Button;
                    b2.Visible = false;
                    b2 = grdIngredientes.Rows[index].FindControl("btn_cancel") as Button;
                    b2.Visible = false;
                    grdIngredientes.EditIndex = -1;
                    BindData();
                    break;
                case "delete_ingredient":
                    string result = "ok";// GeneralServices.Delete_this("recipe", "recipes..sp_recipe", id_ing);
                    if (result == "success")
                        BindData();
                    else
                    {

                        Label msg = grdIngredientes.Rows[index].FindControl("lblmsg") as Label;
                        msg.Text = "No se Pudo Eliminar";
                    }
                    break;
                case "edit_nutrient":
                    Response.Redirect("EditIN.aspx?valor="+id_ing);
                    break;
                default:
                    break;
            }
        }

        protected void grdIngredientes_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grdIngredientes.EditIndex = e.NewEditIndex;
            BindData();
        }
        //-----------------------------------------------------------------------------------------------------------------------------------
    }
}