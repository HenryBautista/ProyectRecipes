using recipes.Services;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace recipes.Views
{
    public partial class IngredientDetail : System.Web.UI.Page
    {
        string in_ingredientId;
        protected void Page_Load(object sender, EventArgs e)
        {
            in_ingredientId = Request.QueryString["valor"];
            if (!IsPostBack)
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
        }

        private void BindData()
        {
            ingredient_id.Text = in_ingredientId;
            grdNutrients.DataSource = GeneralServices.Show_Data_table("ingredient", "F2", Convert.ToInt32(in_ingredientId));
            grdNutrients.DataBind();
            DataTable dts = GeneralServices.Show_Data_table("ingredient", "S4", Convert.ToInt32(ingredient_id.Text));
            lbl_code.Text = dts.Rows[0]["in_ingredient_id"].ToString();
            lbl_nombre.Text = dts.Rows[0]["in_name"].ToString();
            lbl_unidad.Text = dts.Rows[0]["UNIT"].ToString();
            lbl_cost.Text = dts.Rows[0]["in_cost"].ToString();
            lbl_factor.Text = dts.Rows[0]["in_factor"].ToString();
            lbl_cat.Text = dts.Rows[0]["CATEGORY"].ToString();
            lbl_origin.Text = dts.Rows[0]["ORIGIN"].ToString();
            lbl_qty.Text = dts.Rows[0]["in_quantity"].ToString();
            imageIngredient.ImageUrl = dts.Rows[0]["in_image"].ToString();
        }
        protected void btnComprar_Click(object sender, EventArgs e)
        {
            string r = "";
            int idingredient = Convert.ToInt32(ingredient_id.Text);
            DataTable dt = OrderServices.GetOrdertoUser(Convert.ToInt32(Session["us_id"]));
            DataTable per = PersonServices.getMyPeople(Convert.ToInt32(Session["us_id"]));
            DataTable ing = GeneralServices.Show_Data_table("ingredient", "S2", idingredient);
            if (dt.Rows.Count == 0)
            {
                OrderServices.InsertOrUpdate(null, DateTime.Now, Convert.ToInt32(Session["us_id"]), 0, 0);
                dt = OrderServices.GetOrdertoUser(Convert.ToInt32(Session["us_id"]));
                r = Recipe_orderServices.InsertOrUpdate(null, Convert.ToInt32(dt.Rows[0]["or_order"]), idingredient, 1, float.Parse(ing.Rows[0]["in_factor"].ToString()), Convert.ToInt32(per.Rows[0]["pe_person"]), 0);
            }
            else
            {
                if (Recipe_orderServices.CmpIngredientExist(Convert.ToInt32(dt.Rows[0]["or_order"]), idingredient).Rows.Count > 0)
                {

                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "AlertExist();", true);
                }
                else
                {
                    r = Recipe_orderServices.InsertOrUpdate(null, Convert.ToInt32(dt.Rows[0]["or_order"]), idingredient, 1, float.Parse(ing.Rows[0]["in_factor"].ToString()), Convert.ToInt32(per.Rows[0]["pe_person"]), 0);
                }
            }
            if (r != "success")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "AlertError();", true);
            }
        }
    }
}