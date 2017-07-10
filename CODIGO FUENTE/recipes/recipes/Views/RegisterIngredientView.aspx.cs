using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using recipes.Services;
using System.Data;

namespace recipes.Views
{
    public partial class RegisterIngredientView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                BindData();
        }
        protected void BindData()
        {
            DDL_unit.DataSource = getData(2);
            DDL_unit.DataBind();
            DDL_category.DataSource = getData(3);
            DDL_category.DataBind();
            DDL_origin.DataSource = getData(4);
            DDL_origin.DataBind();
            grdIngredientes.DataSource = GeneralServices.Show_Data_table("ingredient", "S1", null);
            grdIngredientes.DataBind();
            grdNutrientesopt.DataSource = getNutrients();
            grdNutrientesopt.DataBind();
        }
        protected void btn_crear_Click(object sender, EventArgs e)
        {
            IngredientServices.InsertOrUpdate(null,tbox_code.Text,tbox_name.Text,Int32.Parse(DDL_unit.SelectedValue),float.Parse( tbox_price.Text),float.Parse( tbox_factor.Text),Int32.Parse(DDL_category.SelectedValue),Int32.Parse(DDL_origin.SelectedValue));
        }

        protected DataTable getData(int type)
        {
           return GeneralServices.Show_Data_table("concept", "S1", type);
        }
        protected DataTable getNutrients()
        {
            return GeneralServices.Show_Data_table("nutrient", "S1", null);
        }
        //--------------------------------------------------------METODOS DEL SUBGRID---------------------------------------------------------


        //protected void Page_Load(object sender, EventArgs e)
        //{
        //    if (!IsPostBack)
        //    {
        //        fillList();
        //    }
        //}
        protected void fillList()
        {
        //    SqlConnection conexion = new SqlConnection(cadena);
        //    SqlCommand comando = new SqlCommand();
        //    conexion.Open();

        //    comando.CommandType = CommandType.StoredProcedure;
        //    comando.CommandText = "ListaDeproductos..ShowProducts"; //////////////select id_producto,nombre from producto

        //    comando.Connection = conexion;
        //    comando.ExecuteNonQuery();

        //    DataTable dt = new DataTable();
        //    dt.Load(comando.ExecuteReader());

        //    grd.DataSource = dt;
        //    grd.DataBind();
        }
        protected void grd_RowEditing(object sender, GridViewEditEventArgs e)
        {
        //    grd.EditIndex = e.NewEditIndex;
        //    fillList();
        }

        protected void grd_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
        //    string nombreProducto = ((TextBox)grd.Rows[e.RowIndex].FindControl("txtNombreEdit")).Text;
        //    string idProducto = ((Label)grd.Rows[e.RowIndex].FindControl("lblNumero")).Text;
        //    SqlConnection conexion = new SqlConnection(cadena);
        //    SqlCommand comando = new SqlCommand();
        //    conexion.Open();

        //    comando.CommandType = CommandType.StoredProcedure;
        //    comando.CommandText = "ListaDeproductos..sp_updateProduct"; //////////////////update producto set nombre=@nombre where id_producto=@id_producto
        //    comando.Parameters.AddWithValue("@id_producto", idProducto);  
        //    comando.Parameters.AddWithValue("@nombre", nombreProducto);
        //    comando.Connection = conexion;
        //    comando.ExecuteNonQuery();
        //    grd.EditIndex = -1;
        //    fillList();
        }

        protected void grd_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
        //    grd.EditIndex = -1;
        //    fillList();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
        //    string nombreProducto = ((TextBox)grd.FooterRow.FindControl("txtNombre")).Text;

        //    SqlConnection conexion = new SqlConnection(cadena);
        //    SqlCommand comando = new SqlCommand();
        //    conexion.Open();

        //    comando.CommandType = CommandType.StoredProcedure;
        //    comando.CommandText = "ListaDeproductos..sp_addPruduct";  //////////////insert into producto(nombre) values (@i_nombre)
        //    comando.Parameters.AddWithValue("@i_nombre", nombreProducto);

        //    comando.Connection = conexion;
        //    comando.ExecuteNonQuery();
        //    fillList();
        }

        protected void deleteProduct_Click(object sender, EventArgs e)
        {
        //    LinkButton lnkRemove = (LinkButton)sender;

        //    SqlConnection conexion = new SqlConnection(cadena);
        //    SqlCommand comando = new SqlCommand();
        //    conexion.Open();

        //    comando.CommandType = CommandType.StoredProcedure;
        //    comando.CommandText = "ListaDeproductos..sp_deleteProduct"; ////////// delete producto where id_producto=@id_producto
        //    comando.Parameters.Add("@id_producto", SqlDbType.VarChar).Value = lnkRemove.CommandArgument;

        //    comando.Connection = conexion;
        //    comando.ExecuteNonQuery();
        //    fillList();
        }
        protected void OnPaging(object sender, GridViewPageEventArgs e)
        {
        //    fillList();
        //    grd.PageIndex = e.NewPageIndex;
        //    grd.DataBind();
        }

        //--------------METODO QUE PERTENECE AL GRID PRINCIPAL, QUE DESPLIEGA EL SUBGRID
        protected void grdIngredientes_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string nutrientId = grdIngredientes.DataKeys[e.Row.RowIndex].Value.ToString();
                GridView grdNutrientes = e.Row.FindControl("grdNutrientes") as GridView;
                                
                grdNutrientes.DataSource = getNutrients();
                grdNutrientes.DataBind();
            }
        }
        //-----------------------------------------------------------------------------------------------------------------------------------
    }
}