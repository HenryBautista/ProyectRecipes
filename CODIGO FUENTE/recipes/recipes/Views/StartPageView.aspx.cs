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
    public partial class StartPageView : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {


            //ESTE BLOQUE DE CODIGO DEBERIAS UTILIZARLA EN LOS SERVICIOS DE LAS CLASES, Y NO AQUI ADEMAS DEBE ESTAR DENTRO DE UN TRY
            SqlCommand command = new SqlCommand();
            command.Parameters.AddWithValue("@i_action", "S1");
            //command.Parameters.AddWithValue("i_concept", 1);
            DataTable tab = GeneralServices.ExecuteQuery(command, "recipes..sp_recipe");
            repeater1.DataSource = tab.DefaultView;
            repeater1.DataBind();
        }
        
    }
}