using recetas.Services;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace recetas.Views
{
    public partial class UsuarioRegistro : System.Web.UI.Page
    {
        SqlConnection conexion = new SqlConnection(GeneralServices.cadena);

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            SqlCommand comando = new SqlCommand();
            comando.Connection = conexion;
            conexion.Open();
            comando.CommandType = System.Data.CommandType.StoredProcedure;
            comando.CommandText = "recipes2..sp_user";
            comando.Parameters.AddWithValue("@i_action","I1");
            comando.Parameters.AddWithValue("@i_name",txtNombre.Text);
            comando.Parameters.AddWithValue("@i_last_name",txtPaterno.Text);
            comando.Parameters.AddWithValue("@i_mother_last_name",txtMaterno.Text);
            comando.Parameters.AddWithValue("@i_mail",txtEmail.Text);
            comando.Parameters.AddWithValue("@i_phone",txtTelefono.Text);
            comando.Parameters.AddWithValue("@i_address", txtDireccion.Text);
            comando.Parameters.AddWithValue("@i_password",txtPass.Text);
            comando.ExecuteNonQuery();
            conexion.Close();

            Response.Redirect("~/Views/Login.aspx");
        }        
    }
}