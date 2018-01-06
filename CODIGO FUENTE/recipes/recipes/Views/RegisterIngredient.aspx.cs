using recipes.Services;
using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace recipes.Views
{
    public partial class IngredientListView : System.Web.UI.Page
    {

        TextInfo ti = CultureInfo.CurrentCulture.TextInfo;
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
        protected void BindData()
        {
            grdIngredients.DataSource = GeneralServices.Show_Data_table("ingredient", "S3", null);
            grdIngredients.DataBind();
            DDL_unit.DataSource = ConceptServices.GetConcept(2);
            DDL_unit.DataBind();
            DDL_category.DataSource = ConceptServices.GetConcept(3);
            DDL_category.DataBind();
            DDL_origin.DataSource = ConceptServices.GetConcept(4);
            DDL_origin.DataBind();
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            string name = tbox_name.Text;
            name.TrimEnd().TrimStart();
            name = ti.ToTitleCase(name);
            if (string.IsNullOrEmpty(ingredientID.Text))
            {
                if (IngredientServices.CmpID(name).Rows.Count == 0)
                {
                    if (file_image.HasFile)
                    {
                        string strname = file_image.FileName.ToString();
                        strname = DateTime.Now.ToString("dd.MM.yyyy.hh.mm.ss.ffffff") + strname;
                        file_image.PostedFile.SaveAs(Server.MapPath("~/Images/IngredientPhotos/") + strname);
                        strname = "~/Images/IngredientPhotos/" + strname;
                        string result = IngredientServices.InsertOrUpdate(null,
                            tbox_code.Text, strname, name, Int32.Parse(DDL_unit.SelectedValue),
                            float.Parse(tbox_price.Text), float.Parse(tbox_qty.Text), Int32.Parse(DDL_category.SelectedValue),
                            Int32.Parse(DDL_origin.SelectedValue));
                    }
                    else
                    {
                        IngredientServices.InsertOrUpdate(null,
                            tbox_code.Text, null, name, Int32.Parse(DDL_unit.SelectedValue),
                            float.Parse(tbox_price.Text), float.Parse(tbox_qty.Text), Int32.Parse(DDL_category.SelectedValue),
                            Int32.Parse(DDL_origin.SelectedValue));
                    }
                    BindData();
                }
                else
                {
                    lbl_msg.InnerText = "El ingrediente ya existe";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
                }
            }
            else
            {
                if ((GeneralServices.Show_Data_table("ingredient", "S2", Convert.ToInt32(ingredientID.Text))).Rows[0]["in_name"].ToString() != name)
                {
                    if (IngredientServices.CmpID(name).Rows.Count == 0)
                    {
                        if (file_image.HasFile)
                        {
                            string strname = file_image.FileName.ToString();
                            strname = DateTime.Now.ToString("dd.MM.yyyy.hh.mm.ss.ffffff") + strname;
                            file_image.PostedFile.SaveAs(Server.MapPath("~/Images/IngredientPhotos/") + strname);
                            strname = "~/Images/IngredientPhotos/" + strname;
                            string old = (GeneralServices.Show_Data_table("ingredient", "S2", Convert.ToInt32(ingredientID.Text))).Rows[0]["in_image"].ToString();
                            string result = IngredientServices.InsertOrUpdate(Convert.ToInt32(ingredientID.Text),
                                tbox_code.Text, strname, name, Int32.Parse(DDL_unit.SelectedValue),
                                float.Parse(tbox_price.Text), float.Parse(tbox_qty.Text), Int32.Parse(DDL_category.SelectedValue),
                                Int32.Parse(DDL_origin.SelectedValue));
                            if (result == "success")
                            {
                                if (!string.IsNullOrEmpty(old))
                                {
                                    System.IO.File.Delete(Server.MapPath(old));
                                }
                            }
                            else
                            {
                                System.IO.File.Delete(Server.MapPath(strname));
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "AlertError();", true);
                            }
                        }
                        else
                        {
                            string old = (GeneralServices.Show_Data_table("ingredient", "S2", Convert.ToInt32(ingredientID.Text))).Rows[0]["in_image"].ToString();
                            IngredientServices.InsertOrUpdate(Convert.ToInt32(ingredientID.Text),
                                tbox_code.Text, old, name, Int32.Parse(DDL_unit.SelectedValue),
                                float.Parse(tbox_price.Text), float.Parse(tbox_qty.Text), Int32.Parse(DDL_category.SelectedValue),
                                Int32.Parse(DDL_origin.SelectedValue));
                        }
                        BindData();
                    }
                    else
                    {
                        lbl_msg.InnerText = "El ingrediente ya existe";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
                    }
                }
                else
                {
                    if (file_image.HasFile)
                    {
                        string strname = file_image.FileName.ToString();
                        strname = DateTime.Now.ToString("dd.MM.yyyy.hh.mm.ss.ffffff") + strname;
                        file_image.PostedFile.SaveAs(Server.MapPath("~/Images/IngredientPhotos/") + strname);
                        strname = "~/Images/IngredientPhotos/" + strname;
                        string old = (GeneralServices.Show_Data_table("ingredient", "S2", Convert.ToInt32(ingredientID.Text))).Rows[0]["in_image"].ToString();
                        string result = IngredientServices.InsertOrUpdate(Convert.ToInt32(ingredientID.Text),
                            tbox_code.Text, strname, name, Int32.Parse(DDL_unit.SelectedValue),
                            float.Parse(tbox_price.Text), float.Parse(tbox_qty.Text), Int32.Parse(DDL_category.SelectedValue),
                            Int32.Parse(DDL_origin.SelectedValue));
                        if (result == "success")
                        {
                            if (!string.IsNullOrEmpty(old))
                            {
                                System.IO.File.Delete(Server.MapPath(old));
                            }
                        }
                        else
                        {
                            System.IO.File.Delete(Server.MapPath(strname));
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "AlertError();", true);
                        }
                    }
                    else
                    {
                        string old = (GeneralServices.Show_Data_table("ingredient", "S2", Convert.ToInt32(ingredientID.Text))).Rows[0]["in_image"].ToString();
                        IngredientServices.InsertOrUpdate(Convert.ToInt32(ingredientID.Text),
                            tbox_code.Text, old, name, Int32.Parse(DDL_unit.SelectedValue),
                            float.Parse(tbox_price.Text), float.Parse(tbox_qty.Text), Int32.Parse(DDL_category.SelectedValue),
                            Int32.Parse(DDL_origin.SelectedValue));
                    }
                    BindData();
                }

            }
        }
        protected void grdIngredients_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = -1;
            string idingredient = null;
            if ((!string.IsNullOrEmpty(e.CommandArgument.ToString())) && e.CommandName == "edit_ingredient")
            {
                index = Convert.ToInt32(e.CommandArgument);
                idingredient = grdIngredients.DataKeys[index].Value.ToString();
                DataTable dt = GeneralServices.Show_Data_table("ingredient", "S2", Convert.ToInt32(idingredient));
                ingredientID.Text = idingredient;
                tbox_code.Text = dt.Rows[0]["in_ingredient_id"].ToString();
                tbox_name.Text = dt.Rows[0]["in_name"].ToString();
                tbox_price.Text = dt.Rows[0]["in_cost"].ToString();
                tbox_qty.Text = dt.Rows[0]["in_quantity"].ToString();
                DDL_unit.SelectedValue = dt.Rows[0]["in_unit"].ToString();
                DDL_origin.SelectedValue = dt.Rows[0]["in_origin"].ToString();
                DDL_category.SelectedValue = dt.Rows[0]["in_category"].ToString();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
            }
            if ((!string.IsNullOrEmpty(e.CommandArgument.ToString())) && e.CommandName == "delete_ingredient")
            {
                index = Convert.ToInt32(e.CommandArgument);
                idingredient = grdIngredients.DataKeys[index].Value.ToString();
                string old = (GeneralServices.Show_Data_table("ingredient", "S2", Convert.ToInt32(idingredient))).Rows[0]["in_image"].ToString();
                string result = GeneralServices.Delete_this("ingredient", "recipes2..sp_ingredient", idingredient);
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