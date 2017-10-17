using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using recipes.Services;

namespace recipes.Views
{
    public partial class AboutUsAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindData();
            }
        }

        private void BindData()
        {
            DataTable dt = PromotionServices.GetInicio();
            Parrafo.InnerText = dt.Rows[0]["pr_text"].ToString();
            imageIni.ImageUrl = dt.Rows[0]["pr_image"].ToString();
            inicio.InnerText = dt.Rows[0]["pr_promotion"].ToString();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (fileimage.HasFile)
            {
                string strname = fileimage.FileName.ToString();
                strname = DateTime.Now.ToString("dd.MM.yyyy.hh.mm.ss.ffffff") + strname;
                fileimage.PostedFile.SaveAs(Server.MapPath("~/Images/PromotionPhotos/") + strname);
                strname = "~/Images/RecipePhotos/" + strname;
                string r = PromotionServices.InsertOrUpdate(Convert.ToInt32(inicio.InnerText),"inicio","Recetas Bolivia",Parrafo.InnerText,strname);
                if (r == "success")
                {
                    System.IO.File.Delete(Server.MapPath(imageIni.ImageUrl));
                }
            }
        }
    }
}