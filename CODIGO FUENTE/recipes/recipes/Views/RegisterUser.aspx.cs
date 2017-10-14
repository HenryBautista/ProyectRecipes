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
    public partial class RegisterUser : System.Web.UI.Page
    {
        private static string cadena = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection conexion = new SqlConnection(cadena);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["us_user"] != null)
            {
                Response.Redirect("~/Views/StartPageView.aspx");
            }
        }
        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            DataTable user = UserServices.GetThisUserByMail(txtEmail.Text.ToLower());
            if (user.Rows.Count > 0)
            {

                lblUser.Text = "El correo ya existe";
            }
            else
            {
                SqlCommand comando = new SqlCommand();
                comando.Connection = conexion;
                conexion.Open();
                comando.CommandType = System.Data.CommandType.StoredProcedure;
                comando.CommandText = "recipes2..sp_user";
                comando.Parameters.AddWithValue("@i_action", "I1");
                comando.Parameters.AddWithValue("@i_name", txtNombre.Text);
                comando.Parameters.AddWithValue("@i_last_name", txtPaterno.Text);
                comando.Parameters.AddWithValue("@i_mother_last_name", txtMaterno.Text);
                comando.Parameters.AddWithValue("@i_mail", txtEmail.Text.ToLower());
                comando.Parameters.AddWithValue("@i_phone", txtTelefono.Text);
                comando.Parameters.AddWithValue("@i_address", txtDireccion.Text);
                comando.Parameters.AddWithValue("@i_password", txtPass.Text);
                comando.Parameters.AddWithValue("@i_master", 0);
                comando.ExecuteNonQuery();
                conexion.Close();
                AddMeToPerson();
                Response.Redirect("~/Views/Login.aspx");
            }
        }

        private void AddMeToPerson()
        {
            DataTable usr = UserServices.GetThisUserByMail(txtEmail.Text.ToLower());
            PersonServices.InsertOrUpdate(null,txtNombre.Text, Convert.ToInt32(usr.Rows[0]["us_user"]));
        }
    }
}