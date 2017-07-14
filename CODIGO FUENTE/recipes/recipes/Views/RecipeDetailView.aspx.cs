using recipes.Services;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace recipes.Views
{
    public partial class RecipeDetailView : System.Web.UI.Page
    {

        string strConnString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        string str;
        SqlCommand com;


        int recipe_index = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["RecID"] != "") //"RecID" se manda como parametro, desde la galeria de recetas
                {
                    recipe_index = Convert.ToInt32(Request.QueryString["RecID"]);
                    FillRecipe();
                    FillIngredients();
                }
            }
        }

        private void FillIngredients()
        {
            SqlConnection con = new SqlConnection(strConnString);
            con.Open();
            str = "select * from t_recipe where re_recipe=" + recipe_index;
            com = new SqlCommand(str, con);

            SqlConnection conexion = new SqlConnection(strConnString);
            SqlCommand comando= new SqlCommand();
            conexion.Open();
            comando.CommandText="select * from t_recipe where re_recipe= "+recipe_index; //deberia llenar el grid con la lista de ingredientes segun la receta
            comando.Connection=conexion;
            comando.ExecuteNonQuery();

            DataTable dt = new DataTable();
            dt.Load(comando.ExecuteReader());

            grdingredients.DataSource=dt;
            grdingredients.DataBind();


            conexion.Close();
        }

        private void FillRecipe()
        {
            SqlConnection con = new SqlConnection(strConnString);
            con.Open();
            str = "select * from t_recipe where re_recipe="+recipe_index;
            com = new SqlCommand(str, con);
            SqlDataReader reader = com.ExecuteReader();
            reader.Read();
            lblRecipeName.Text = reader["re_name"].ToString();
            lblTurno.Text = reader["re_turn"].ToString();
            lblRecipe.Text = reader["re_observation"].ToString();
            lblTotalCost.Text = reader["re_total_cost"].ToString();
            con.Close();
        }
        
    }
}