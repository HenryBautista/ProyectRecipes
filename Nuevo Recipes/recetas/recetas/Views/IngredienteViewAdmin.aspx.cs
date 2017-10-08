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
            SqlCommand comando = new SqlCommand();
            conexion.Open();
            comando.Connection = conexion;
            comando.CommandType = System.Data.CommandType.StoredProcedure;
            comando.CommandText = "recipes2..sp_ingredient";
            comando.Parameters.AddWithValue("@i_action", "S1");
            grdRecetas.DataSource = getdata(comando);
            grdRecetas.DataBind();
        }

        private DataTable getdata(SqlCommand comando)
        {
            DataTable dt = new DataTable();
            dt.Load(comando.ExecuteReader());
            conexion.Close();
            return dt;
        }

        protected void lnkRemove_Click(object sender, EventArgs e)
        {

        }

        protected void btnNuevoIngrediente_Click(object sender, EventArgs e)
        {

        }
    }
}