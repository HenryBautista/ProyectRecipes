using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using recipes.Services;

namespace recipes.Views
{
    public partial class RegisterView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                
            }
        }

        protected void btn_crear_Click(object sender, EventArgs e) 
        {
            
            if (check_fields_register() && check_password_match() && !check_email())
            {
                UserServices.InsertOrUpdate(null,tbox_name.Text,"","",tbox_email.Text,"",0);
                lbl_message.InnerText = "Usuario registrado!";
                Response.Redirect("StartPageView.aspx");
            }

        }

        private bool check_email()
        {
            if (UserServices.ThisEmailExits(tbox_email.Text.ToLower()))
            {
                lbl_message.InnerText = "El Email ya fue registrado, ingrese otro";
                return true;
            }
            else
                return false;
        }

        private bool check_password_match()
        {
            if (tbox_password.Text==tbox_password_repeat.Text)
            {
                lbl_message.InnerText = "Las contraseñas ingresadas no coinciden";
                return true;
            }

            return false;
        }

        private bool check_fields_register()
        {
            if (tbox_name.Text == "")
            {
                lbl_message.InnerText = "Ingrese un nombre de usuario";
                return false;
            }
            if (tbox_email.Text == "")
            {
                lbl_message.InnerText = "Ingrese un email";
                return false;
            }
            if (tbox_password.Text=="")
            {
                lbl_message.InnerText = "Ingrese una  contraseña";
                return false;
            }

            if (tbox_password_repeat.Text=="")
            {
                lbl_message.InnerText = "Repita su contraseña";
                return false;
            }

            return true;

        }
    }
}