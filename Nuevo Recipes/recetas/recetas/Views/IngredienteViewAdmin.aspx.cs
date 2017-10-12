using recetas.Services;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace recetas.Views
{
    public partial class IngredienteViewAdmin : System.Web.UI.Page
    {
        SqlConnection conexion = new SqlConnection(GeneralServices.cadena);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindData();
            }
        }

        private void BindData()
        {
            grdRecetas.DataSource = GeneralServices.Show_Data_table("ingredient", "S1", null);
            grdRecetas.DataBind();
        }

        protected void lnkRemove_Click(object sender, EventArgs e)
        {

        }

        protected void btnNuevoIngrediente_Click(object sender, EventArgs e)
        {

        }
    }
}