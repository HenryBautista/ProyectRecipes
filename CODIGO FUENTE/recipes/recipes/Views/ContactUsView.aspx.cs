using recipes.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace recipes.Views
{
    public partial class ContactUsView1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btn_SaveConsult(object sender, EventArgs e)
        {
            ConsultServices.InsertOrUpdate(null, txt_name.Value, txt_email.Value, txt_message.Value);
        }
    }
}