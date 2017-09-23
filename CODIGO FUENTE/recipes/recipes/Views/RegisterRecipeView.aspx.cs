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

        protected void btn_add_Click(object sender, EventArgs e)
        {
            if (check_fields() && check_image_file())
            {
                string strname = file_image.FileName.ToString();
                strname = DateTime.Now.ToString("dd.MM.yyyy.hh.mm.ss.ffffff") + strname;
                file_image.PostedFile.SaveAs(Server.MapPath("~/Images/RecipePhotos/") + strname);
                string image_path = "~/Images/RecipePhotos/" + strname;
                string result = RecipeServices.InsertOrUpdate(null, tbox_id.Text, tbox_name.Text, int.Parse(ddl_turn.SelectedValue), image_path, float.Parse(tbox_total.Text), tbox_Observation.Text, 0);
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
            if (tbox_total.Text == "")
            {
                lbl_message.InnerText = "Ingrese un Costo";
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

        protected void grid_recipes_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string command = e.CommandName;
            //int rowIndex = Convert.ToInt32(grid_recipes.SelectedRow);
            //string id = grid_recipes.DataKeys[rowIndex].Value.ToString();\
            string id = e.CommandArgument.ToString();
            switch (command)
            {
                case "delete_recipe":
                    string result = GeneralServices.Delete_this("recipe","recipes..sp_recipe",id);
                    if (result == "success")
                        lbl_message.InnerText = "Eliminado con Exito!";
                    else
                        lbl_message.InnerText = result;
                    
                    break;
                case "edit_recipe":
                    selected_recipe = id;
                    DataTable table = GeneralServices.Show_Data_table("recipe","S2",int.Parse(id));
                    fill_fields(table);
                    break;
            }
        }

        private void fill_fields(DataTable table)
        {
            tbox_id.Text = table.Rows[0]["re_recipe_id"].ToString();
            tbox_name.Text = table.Rows[0]["re_name"].ToString();
            ddl_turn.SelectedValue=table.Rows[0]["re_turn"].ToString();
            tbox_total.Text=table.Rows[0]["re_total_cost"].ToString();
            tbox_Observation.Text = table.Rows[0]["re_observation"].ToString();
        }

        private void delete_recipe(string p)
        {
            
        }

        protected void grid_recipes_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            load_recipes();
        }

        protected void grid_recipes_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                string id = e.ToString();
            }
            catch (Exception)
            {
            }
        }

        
    }
    
}