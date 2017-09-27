<%@ Page Title="" Language="C#" MasterPageFile="~/Views/recipesHTT.Master" AutoEventWireup="true" CodeBehind="AboutAdmin.aspx.cs" Inherits="recipes.Views.AboutAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" style="padding-top: 100px">
        <div class="form-group">
            <asp:Label Text="Cargar foto" runat="server" />
            <asp:FileUpload runat="server" ID="file1" CssClass="form-control"/>
        </div>
        <div class="form-group">
            <asp:Label Text="Agregar texto" runat="server" />
            <asp:TextBox runat="server" TextMode="MultiLine" ID="lblDescripcion" CssClass="form-control"/>
        </div>
        <asp:Button Text="Guardar" CssClass="btn-default" runat="server" />
    </div>
</asp:Content>
