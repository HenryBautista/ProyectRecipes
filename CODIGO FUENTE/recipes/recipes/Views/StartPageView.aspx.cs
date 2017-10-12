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
            if (!this.IsPostBack)
            {
                BindData();
            }            
        }

        private void BindData()
        {   
            SqlCommand command = new SqlCommand();
            command.Parameters.AddWithValue("@i_action", "S1");
            DataTable tab = GeneralServices.ExecuteQuery(command, "recipes2..sp_ingredient");
            repeateringredients.DataSource = tab.DefaultView;
            repeateringredients.DataBind();
            repeaterItem.DataSource = GeneralServices.Show_Data_table("promotion", "S1", null);
            repeaterItem.DataBind();
        } 
        
    }
}