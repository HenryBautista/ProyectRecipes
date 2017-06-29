<%@ Page Title="" Language="C#" MasterPageFile="~/Views/recipes.Master" AutoEventWireup="true" CodeBehind="RegisterIngredient.aspx.cs" Inherits="recipes.Views.RegisterIngredient" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="SM" runat="server">

    </asp:ScriptManager>
    <div class="container-fluid">
        <div class="row"> 
            <div class="col-md-8 hidden-xs"  style="background-color:black">
                <img src="../Images/RecipePhotos/macdonalds-japones-1.jpg" style="height:100%;width:100%; opacity:0.5"/>
            </div>
            <div class="col-sm-12 col-md-3" style="background-color:whitesmoke"> 
                <div>
                   <div class="form-group">
                       <label>Codigo:</label>
                       <asp:TextBox CssClass="form-control" ID="tbox_code" runat="server" ></asp:TextBox>
                   </div>
                <div class="form-group">
                    <label>Nombre:</label>
                    <asp:TextBox  CssClass="form-control" ID="tbox_name" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Unidad:</label>
                    <asp:Datalist CssClass="form-control" id="dlist_unit" placeholder="Unidad medida" runat="server"/>
                </div>
                <div class="form-group">
                    <label>Costo:</label>
                    <asp:TextBox Cssclass="form-control" id="tbox_price" placeholder="Costo ingrediente" runat="server"/>
                </div>
                    
                <div class="form-group">
                    <label>Factor:</label>
                    <asp:TextBox  Cssclass="form-control" id="tbox_factor" placeholder="Factor" runat="server"/>
                </div>
                    
                <div class="form-group">
                    <label>Categoria:</label>
                    <asp:TextBox Cssclass="form-control" id="tbox_category" placeholder="Categoria del ingrediente" runat="server"/>
                </div>
                <div class="form-group">
                    <label>Origen:</label>
                    <asp:TextBox Cssclass="form-control" id="tbox_origin" placeholder="Irigen ingrediente " runat="server"/>
                </div>
                    <label runat="server" id="lbl_message" class="alert-danger"></label>
                    <asp:Button id="btn_crear" runat="server" CssClass="btn btn-success" Text="CREAR" OnClick="btn_crear_Click"/>
                </div>  
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
</asp:Content>
