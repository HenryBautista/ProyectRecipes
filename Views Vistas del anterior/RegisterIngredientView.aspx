<%@ Page Title="" Language="C#" MasterPageFile="~/Views/recipesHTT.Master" AutoEventWireup="true" CodeBehind="RegisterIngredientView.aspx.cs" Inherits="recipes.Views.RegisterIngredientView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="container" Style="margin-top:80px;">

        <div style="margin-left: auto; margin-right: auto; width: 70%;" class="detail">
        </div>
        <div class="div-formulario">
            <asp:Label Text="Codigo" runat="server" />
            <asp:TextBox ID="tbox_code" runat="server" required="required" placeholder="Introducir codigo" class="form-control"></asp:TextBox>

            <asp:Label Text="Nombre" runat="server" />
            <asp:TextBox ID="tbox_name" placeholder="Introducir nombre" runat="server" required="required" class="form-control"></asp:TextBox>

            <asp:Label Text="Unidad de medida" runat="server" />
            <asp:DropDownList ID="DDL_unit" CssClass="form-control" DataValueField="co_correlative" DataTextField="co_name" runat="server"></asp:DropDownList>

            <asp:Label Text="Costo" runat="server" />
            <asp:TextBox ID="tbox_price" type="numeric" required="required" placeholder="Costo ingrediente" runat="server" class="form-control" />
            
            <asp:Label Text="Cantidad" runat="server" />
            <asp:TextBox ID="tbox_qty" placeholder="Cantidad de ingrediente" runat="server" required="required" class="form-control" />

            <br />
            <asp:Label Text="Categoria" runat="server" />
            <asp:DropDownList ID="DDL_category" CssClass="form-control" DataValueField="co_correlative" DataTextField="co_name" runat="server"></asp:DropDownList>

            <asp:Label Text="Origen" runat="server" />
            <asp:DropDownList ID="DDL_origin" CssClass="form-control" DataValueField="co_correlative" DataTextField="co_name" runat="server"></asp:DropDownList>

            
            <asp:Label Text="Imagen" runat="server" />
            <asp:FileUpload ID="file_image" runat="server" class="txt-form" />
            <br />
            <label runat="server" id="lbl_msg" class="col-lg-2 label-danger control-label"></label>
            <br />
            <asp:Button ID="btn_crear" runat="server" Style="width: auto;" class="btn-form" Text="Crear ingrediente" OnClick="btn_crear_Click" />
        </div>
    </div>
</asp:Content>
