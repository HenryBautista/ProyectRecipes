using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using recipes.Services;

namespace recipes.Views
{
    public partial class ContactUsView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btn_SaveConsult(object sender, EventArgs e)
        {
            ConsultServices.InsertOrUpdate(null,txt_name.Value,txt_email.Value,txt_message.Value);
            string v = txt_email.Value;
        }
    }
}