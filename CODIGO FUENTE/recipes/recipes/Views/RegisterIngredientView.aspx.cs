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
    public partial class RegisterIngredientView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DDL_unit.DataSource = getData(2);
            DDL_unit.DataBind();
            DDL_category.DataSource = getData(3);
            DDL_category.DataBind();
            DDL_origin.DataSource = getData(4);
            DDL_origin.DataBind();
            grdIngredientes.DataSource = GeneralServices.Show_Data_table("ingredient","S1",null);
            grdIngredientes.DataBind();
        }

        protected void btn_crear_Click(object sender, EventArgs e)
        {
            IngredientServices.InsertOrUpdate(null,tbox_code.Text,tbox_name.Text,Int32.Parse(DDL_unit.SelectedValue),float.Parse( tbox_price.Text),float.Parse( tbox_factor.Text),Int32.Parse(DDL_category.SelectedValue),Int32.Parse(DDL_origin.SelectedValue));
        }

        protected DataTable getData(int type)
        {
           return GeneralServices.Show_Data_table("concept", "S1", type);
        }
    }
}