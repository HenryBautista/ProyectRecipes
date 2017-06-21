using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using recipes.Services;
using System.Data.SqlClient;
using System.Data;

namespace recipes.Views
{
    public partial class PrincipalView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            //ESTE BLOQUE DE CODIGO DEBERIAS UTILIZARLA EN LOS SERVICIOS DE LAS CLASES, Y NO AQUI ADEMAS DEBE ESTAR DENTRO DE UN TRY
            SqlCommand command = new SqlCommand();
            command.Parameters.AddWithValue("i_action","S1");
            DataTable tab = GeneralServices.ExecuteQuery(command, "recipes..sp_recipes");
        }
    }
}