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
    public partial class RecetaEditAdmin : System.Web.UI.Page
    {
        SqlConnection conexion = new SqlConnection(GeneralServices.cadena);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GeneralServices servicio = new GeneralServices();
                servicio.FillDropwDownList(ddlTurno, 1, "S1");
                if (Request.QueryString["recipeID"] != null)
                {
                    title.InnerText = "Edicion de receta";
                    btnNuevaReceta.Text = "Editar receta";
                    RetrieveRecipe();
                }
                else
                {
                    title.InnerText = "Nueva receta";
                }
            }
        }

        private void RetrieveRecipe()
        {
            SqlCommand comando = new SqlCommand();
            comando.Connection = conexion;
            conexion.Open();
            comando.CommandType = System.Data.CommandType.StoredProcedure;
            comando.CommandText = "recipes2..sp_recipe";

            comando.Parameters.AddWithValue("@i_action", "S2");
            comando.Parameters.AddWithValue("@i_recipe", Request.QueryString["recipeID"]);
            comando.ExecuteNonQuery();
            SqlDataReader reader = comando.ExecuteReader();

            if (reader.Read())
            {
                txtCodigo.Text = reader[1].ToString();
                txtNombre.Text = reader[2].ToString();
                ddlTurno.SelectedValue = reader[3].ToString();
                //imgFile = reader[4].ToString();
                txtVideo.Text = reader[5].ToString();
                txtCosto.Text = reader[6].ToString();
                txtObs.Text = reader[7].ToString();
            }

            //DataTable dt = new DataTable();
            //dt.Load(comando.ExecuteReader());
            conexion.Close();
        }

        protected void btnNuevaReceta_Click(object sender, EventArgs e)
        {
            insertOrUpdate();
        }

        private void insertOrUpdate()
        {
            SqlCommand comando = new SqlCommand();
            comando.Connection = conexion;
            conexion.Open();
            comando.CommandType = System.Data.CommandType.StoredProcedure;
            comando.CommandText = "recipes2..sp_recipe";
            if (Request.QueryString["recipeID"] != null)
            {
                comando.Parameters.AddWithValue("@i_action", "U1");
                comando.Parameters.AddWithValue("@i_recipe", Request.QueryString["recipeID"]);
            }
            else
            {
                comando.Parameters.AddWithValue("@i_action", "I1");
            }
            comando.Parameters.AddWithValue("@i_recipe_id", txtCodigo.Text);
            comando.Parameters.AddWithValue("@i_name", txtNombre.Text);
            comando.Parameters.AddWithValue("@i_turn", ddlTurno.SelectedValue);
            //comando.Parameters.AddWithValue("@i_image",imgFile);
            comando.Parameters.AddWithValue("@i_total_cost", txtCosto.Text);
            comando.Parameters.AddWithValue("@i_observation", txtObs.Text);
            comando.Parameters.AddWithValue("@i_url_video", txtVideo.Text);

            comando.ExecuteNonQuery();
            conexion.Close();
            Response.Redirect("~/Views/RecetaVistaAdmin.aspx");
        }
    }
}