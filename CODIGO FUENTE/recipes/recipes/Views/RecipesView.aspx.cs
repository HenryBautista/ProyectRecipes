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
    public partial class RecipesView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                BindData();
            } 
        }

        private void BindData()
        {
            repeaterRecipes.DataSource = GeneralServices.Show_Data_table("recipe", "S3", null);
            repeaterRecipes.DataBind();
        }
        protected void btnComprar_Click(object sender, EventArgs e)
        {
            string r = "";
            int idrecipe = Convert.ToInt32(((Button)sender).CommandArgument);
            DataTable dt = OrderServices.GetOrdertoUser(Convert.ToInt32(Session["us_id"]));
            DataTable per = PersonServices.getMyPeople(Convert.ToInt32(Session["us_id"]));
            DataTable rec = GeneralServices.Show_Data_table("recipe", "S2", idrecipe);
            if (dt.Rows.Count == 0)
            {
                OrderServices.InsertOrUpdate(null, DateTime.Now, Convert.ToInt32(Session["us_id"]), 0, 0);
                dt = OrderServices.GetOrdertoUser(Convert.ToInt32(Session["us_id"]));
                r = Recipe_orderServices.InsertOrUpdate(null, Convert.ToInt32(dt.Rows[0]["or_order"]), idrecipe, 1, float.Parse(rec.Rows[0]["re_total_cost"].ToString()), Convert.ToInt32(per.Rows[0]["pe_person"]), 1);
            }
            else
            {
                if (Recipe_orderServices.CmpIngredientExist(Convert.ToInt32(dt.Rows[0]["or_order"]), idrecipe).Rows.Count > 0)
                {

                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "AlertExist();", true);
                }
                else
                {
                    r = Recipe_orderServices.InsertOrUpdate(null, Convert.ToInt32(dt.Rows[0]["or_order"]), idrecipe, 1, float.Parse(rec.Rows[0]["re_total_cost"].ToString()), Convert.ToInt32(per.Rows[0]["pe_person"]), 1);
                }
            }
            if (r != "success")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "AlertError();", true);
            }
        } 
    }
}