<%@ Page Title="" Language="C#" MasterPageFile="~/Views/recipes.Master" AutoEventWireup="true" CodeBehind="RegisterNutrient.aspx.cs" Inherits="recipes.Views.RegisterNutrient" %>
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
                       <label>Nombre:</label>
                       <asp:TextBox CssClass="form-control" ID="tbox_name" runat="server" ></asp:TextBox>
                   </div>
                    <asp:Button id="btn_crear" runat="server" CssClass="btn btn-success" Text="CREAR" OnClick="btn_crear_Click"/>
                </div>  
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
</asp:Content>