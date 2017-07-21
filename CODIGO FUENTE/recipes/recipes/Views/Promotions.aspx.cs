using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using recipes.Services;

namespace recipes.Views
{
    public partial class Promotions : System.Web.UI.Page
    {
        string cadena = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindData();
            }   
        }

        private void BindData()
        {
            repeaterItem.DataSource = GeneralServices.Show_Data_table("promotion","S1",null);
            repeaterItem.DataBind();
        }        
    }
}