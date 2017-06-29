using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using recipes.Services;

namespace recipes.Views
{
    public partial class RegisterIngredient : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            dlist_unit.DataSource = GeneralServices.Show_Data_table("concepts", "S1",2);
        }

        protected void btn_crear_Click(object sender, EventArgs e)
        {
            IngredientServices.InsertOrUpdate(null,tbox_code.Text,tbox_name.Text,12,float.Parse( tbox_price.Text),float.Parse( tbox_factor.Text),Int32.Parse(tbox_category.Text),Int32.Parse(tbox_origin.Text));
        }
    }
}