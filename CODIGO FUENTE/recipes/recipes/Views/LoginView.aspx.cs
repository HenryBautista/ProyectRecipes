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
    public partial class LoginView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_access_Click(object sender, EventArgs e)
        {
            if (check_fields())
            {
                check_user();
            }
        }

        private bool check_user()
        {
            DataTable user = UserServices.GetThisUserByMail(tbox_email.Text.ToLower());
            if (user.Rows.Count > 0)
            {
                string pass = user.Rows[0]["us_password"].ToString();
                if (pass == tbox_password.Text)
                {
                    //Iniciamos la sesion del usuario
                    string us_usuario = user.Rows[0]["us_user"].ToString();
                    Session["US_USER"] = us_usuario;
                    Session["US_MAIL"] = user.Rows[0]["us_mail"].ToString();
                    Session["US_NAME"] = user.Rows[0]["us_name"].ToString();
                    Response.Redirect("StartPageView.aspx");
                    return true;
                }
                else
                {
                    lbl_error.InnerText = "Contraseña incorrecta";
                    return false;
                }

            }
            else
            {
                lbl_error.InnerText = "No se encontro al usuario, verifique su direccion de correo";
                return false;
            }
        }

        private bool check_fields()
        {
            if (tbox_email.Text == "")
            {
                lbl_error.InnerText = "Debe ingresar un email";
                return false;
            }
            if (tbox_password.Text == "")
            {
                lbl_error.InnerText = "Debe ingresar una contraseña";
                return false;
            }
            lbl_error.InnerText = "";
            return true;
        }

        protected void btn_register_Click(object sender, EventArgs e)
        {
            Response.Redirect("RegisterView.aspx");
        }
    }
}