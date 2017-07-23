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
    public partial class UserView : System.Web.UI.Page
    {
        private static int person_selected;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                load_data();
            }
        }

        private void load_data()
        {
            load_user_data();
        }

        private void load_user_data()
        {
            try
            {
                DataTable result = UserServices.GetThisUser(Session["US_USER"].ToString());
                if (result.Rows.Count > 0)
                {
                    tbox_name.Text = result.Rows[0]["us_name"].ToString();
                    tbox_father.Text = result.Rows[0]["us_last_name"].ToString();
                    tbox_mother.Text = result.Rows[0]["us_mother_last_name"].ToString();
                    tbox_email.Text = result.Rows[0]["us_mail"].ToString();
                    tbox_phone.Text = result.Rows[0]["us_phone"].ToString();
                    load_persons();
                }
            }
            catch (Exception)
            {
                Response.Redirect("StartPageView.aspx");
            }

        }

        private void load_persons()
        {
            int user = int.Parse(Session["US_USER"].ToString());
            grid_person.DataSource = PersonServices.getMyPerson(user);
            grid_person.DataBind();
        }

        protected void btn_person_save_Click(object sender, EventArgs e)
        {
            int user = int.Parse(Session["US_USER"].ToString());
            if (tbox_person_name.Text == "")
            {
                lbl_person_error.InnerText = "Ingrese un nombre";
            }
            else
            {
                string result;
                if (person_selected>0)
                {
                    result = PersonServices.InsertOrUpdate(person_selected, tbox_person_name.Text, user);
                }
                else
                {
                    result = PersonServices.InsertOrUpdate(null, tbox_person_name.Text, user);
                }
                load_persons();
                if (result == "success")
                    lbl_person_error.InnerText = "La persona ah sido insertada exitosamente";
                else
                    lbl_person_error.InnerText = "Ha ocurrido un error " + result;
            }

        }

        protected void grid_person_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string command = e.CommandName;
            string id = e.CommandArgument.ToString();
            switch (command)
            {
                case "view_person":
                    DataTable result = PersonServices.GetThisPerson(id);
                    tbox_person_name.Text = result.Rows[0]["pe_name"].ToString();
                    person_selected = int.Parse(id);
                    break;

            }
        }

        protected void btn_update_Click(object sender, EventArgs e)
        {
            if (check_fields())
            {
                int user = int.Parse(Session["US_USER"].ToString());
                string result = UserServices.InsertOrUpdateData(user, tbox_name.Text, tbox_father.Text, tbox_mother.Text, tbox_phone.Text);


                if (result == "success")
                {
                    lbl_message.InnerText = "Actualizado exitosamente";
                }
                else
                {
                    lbl_message.InnerText = "No se ha podido Actulizar " + result;
                }
            }
        }

        private bool check_fields()
        {
            if (tbox_name.Text == "")
            {
                lbl_message.InnerText = "Ingrese un nombre de usuario";
                return false;
            }
            if (tbox_father.Text == "")
            {
                lbl_message.InnerText = "Ingrese su apellido paterno";
                return false;
            }
            if (tbox_mother.Text == "")
            {
                lbl_message.InnerText = "Ingrese un apellido materno";
                return false;
            }
            return true;
        }
    }
}