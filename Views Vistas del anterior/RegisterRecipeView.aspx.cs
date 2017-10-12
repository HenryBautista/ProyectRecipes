using recipes.Services;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace recipes.Views
{
    public partial class RegisterRecipeView : System.Web.UI.Page
    {
        int usrid = 1;

        string selected_recipe = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                load_data();
            }
        }

        private void load_data()
        {
            load_recipes();
            DataTable turns = ConceptServices.GetConcept(1);
            ddl_turn.DataSource = turns;
            ddl_turn.DataBind();

        }

        private void load_recipes()
        {
            grid_recipes.DataSource = RecipeServices.GetAllRecipes().DefaultView;
            grid_recipes.DataBind();
        }

        protected DataTable getData(int type)
        {
            return GeneralServices.Show_Data_table("concept", "S1", type);
        }

        protected void btn_add_Click(object sender, EventArgs e)
        {
            if (check_fields() && check_image_file())
            {
                string strname = file_image.FileName.ToString();
                strname = DateTime.Now.ToString("dd.MM.yyyy.hh.mm.ss.ffffff") + strname;
                file_image.PostedFile.SaveAs(Server.MapPath("~/Images/RecipePhotos/") + strname);
                string image_path = "~/Images/RecipePhotos/" + strname;
                string result = RecipeServices.InsertOrUpdate(null, tbox_id.Text, tbox_name.Text, int.Parse(ddl_turn.SelectedValue), image_path,tbox_url.Text, float.Parse(tbox_total.Text), tbox_Observation.Text, 0);
                if (result == "success")
                {
                    load_recipes();
                }
                else
                {
                    lbl_message.InnerText = result;
                }


            }
        }

        private bool check_image_file()
        {
            string ext = Path.GetExtension(file_image.FileName);

            if (!file_image.HasFile)
            {
                lbl_message.InnerText = "Debe agregar una imagen";
                return false;
            }

            if (file_image.PostedFile.ContentLength > 5000000)
            {
                lbl_message.InnerText = "La imagen es muy grande, solo se permite 5 MB como maximo";
                return false;
            }

            if (ext.ToLower() != ".jpg" && ext.ToLower() != ".png")
            {
                lbl_message.InnerText = "Solo se permiten archivos de tipo JPG o PNG";
                return false;
            }
            lbl_message.InnerText = "";
            return true;
        }

        private bool check_fields()
        {
            if (tbox_id.Text == "")
            {
                lbl_message.InnerText = "Ingrese un ID";
                return false;
            }
            if (tbox_name.Text == "")
            {
                lbl_message.InnerText = "Ingrese un Nombre";
                return false;
            }
            if (tbox_Observation.Text == "")
            {
                lbl_message.InnerText = "Ingrese una observacion";
                return false;
            }

            lbl_message.InnerText = "";
            return true;
        }

        private bool check_fields(string cod, string name, int index)
        {
            Label msg = grid_recipes.Rows[index].FindControl("lblmsg") as Label;

            if (cod == "")
            {
                msg.Text = "Ingrese un Codigo";
                return false;
            }
            if (IngredientServices.CmpID(cod).Rows.Count > 1)
            {
                msg.Text = "El Codigo de receta ya existe";
                return false;
            }
            if (name == "")
            {
                msg.Text = "Ingrese un Nombre";
                return false;
            }
            msg.Text = "";
            return true;
        }

        protected void grd_Recipe_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);
            string com = e.CommandName.ToString();
            int id_ing = Convert.ToInt32(grid_recipes.DataKeys[index].Value);
            switch (com)
            {
                case "edit_recipe":
                    grid_recipes.EditIndex = index;
                    load_data();
                    break;
                case "update_recipe":
                    FileUpload img1 = ((FileUpload)grid_recipes.Rows[index].FindControl("img1"));
                    string cod = ((TextBox)grid_recipes.Rows[index].FindControl("txtCodigo")).Text;
                    string name = ((TextBox)grid_recipes.Rows[index].FindControl("txtNombre")).Text;
                    string turn = ((DropDownList)grid_recipes.Rows[index].FindControl("DDLTurn")).SelectedValue;
                    string urlvideo = ((TextBox)grid_recipes.Rows[index].FindControl("txturl")).Text;
                    string totalcost = ((Label)grid_recipes.Rows[index].FindControl("txtCosto")).Text;
                    string observation = ((TextBox)grid_recipes.Rows[index].FindControl("txtObs")).Text;
                    if (check_fields(cod, name, index) && img1.HasFile)
                    {
                        string strname = file_image.FileName.ToString();
                        strname = DateTime.Now.ToString("dd.MM.yyyy.hh.mm.ss.ffffff") + strname;
                        file_image.PostedFile.SaveAs(Server.MapPath("~/Images/RecipePhotos/") + strname);
                        strname = "~/Images/RecipePhotos/" + strname;
                        DataTable dt = GeneralServices.Show_Data_table("recipe", "S2", id_ing);
                        string ruta1 = dt.Rows[0]["in_image"].ToString();
                        System.IO.File.Delete(Server.MapPath(ruta1));
                        RecipeServices.InsertOrUpdate(id_ing,
                            cod, name, Convert.ToInt32(turn), strname,urlvideo,float.Parse(totalcost), observation, usrid);
                        grid_recipes.EditIndex = -1;
                        load_data();
                    }
                    else
                    {
                        if (check_fields(cod, name, index))
                        {
                            DataTable dt = GeneralServices.Show_Data_table("recipe", "S2", id_ing);
                            RecipeServices.InsertOrUpdate(id_ing,
                            cod, name, Convert.ToInt32(turn), dt.Rows[0]["re_image"].ToString(), urlvideo, float.Parse(totalcost), observation, usrid);
                            grid_recipes.EditIndex = -1;
                            load_data();
                        }
                    }
                    break;
                case "cancel_recipe":
                    grid_recipes.EditIndex = -1;
                    load_data();
                    break;
                case "delete_recipe":
                    string result = GeneralServices.Delete_this("recipe", "recipes2..sp_recipe", id_ing.ToString());
                    if (result == "success")
                    {
                        string ruta1 = ((Image)grid_recipes.Rows[index].FindControl("img1")).ImageUrl;
                        System.IO.File.Delete(Server.MapPath(ruta1));
                        load_data();
                    }
                    else
                    {
                        Label msg = grid_recipes.Rows[index].FindControl("lblmsg") as Label;
                        msg.Text = "No se Pudo Eliminar";
                    }
                    break; 
                default:
                    break;
            }
        }
        

        protected void grd_Recipe_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string ingredientId = grid_recipes.DataKeys[e.Row.RowIndex].Value.ToString();
                Button b1 = e.Row.FindControl("btn_edit") as Button;
                b1.CommandArgument = e.Row.RowIndex.ToString();
                b1 = e.Row.FindControl("BtnEdit") as Button;
                b1.CommandArgument = e.Row.RowIndex.ToString();
                b1 = e.Row.FindControl("btn_update") as Button;
                b1.CommandArgument = e.Row.RowIndex.ToString();
                b1 = e.Row.FindControl("btn_cancel") as Button;
                b1.CommandArgument = e.Row.RowIndex.ToString();
                b1 = e.Row.FindControl("btn_del") as Button;
                b1.CommandArgument = e.Row.RowIndex.ToString();
                if (grid_recipes.EditIndex != -1 && e.Row.RowIndex == grid_recipes.EditIndex)
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