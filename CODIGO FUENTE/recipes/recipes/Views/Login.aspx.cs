using recipes.Services;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace recipes.Views
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnIniciar_Click(object sender, EventArgs e)
        {
            DataTable user = GetThisUserByMail(txtUser.Text.ToLower(),txtPass.Text);
            if (user.Rows.Count > 0)
            {
                Session["us_user"] = user.Rows[0]["us_name"].ToString();
                Session["us_master"] = user.Rows[0]["us_master"].ToString();
                Response.Redirect("~/Views/StartPageView.aspx");
            }
            else
            {
                lblEstado.Text = "Usuario no encontrado";
            }
        }
        public static DataTable GetThisUserByMail(string mail,string password)
        {
            try
            {
                SqlCommand command = new SqlCommand();
                command.Parameters.AddWithValue("i_action", "S4");
                command.Parameters.AddWithValue("i_mail", mail);
                command.Parameters.AddWithValue("i_password",password);
                return GeneralServices.ExecuteQuery(command, "recipes2..sp_user");
            }
            catch (Exception)
            {
                return new DataTable();
            }
        }
    }
}