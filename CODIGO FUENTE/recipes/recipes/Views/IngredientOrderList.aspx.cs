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
    public partial class IngredientOrderList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindData();
            }
        }
        protected void BindData()
        {
            DataTable dt1 = GeneralServices.Show_Data_table("order","S3",null);
            DataTable dt2 = GeneralServices.Show_Data_table("order", "S3", null);
            dt1.Merge(dt2);
            DataView dv = new DataView(dt1);
            dv.Sort = "us_name";
            Grd_ingredient.DataSource = dv;
            Grd_ingredient.DataBind();
        }
    }
}