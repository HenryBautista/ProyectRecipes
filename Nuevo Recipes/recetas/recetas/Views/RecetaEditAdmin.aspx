<%@ Page Title="" Language="C#" MasterPageFile="~/Views/recetas.Master" AutoEventWireup="true" CodeBehind="RecetaEditAdmin.aspx.cs" Inherits="recetas.Views.RecetaEditAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <h2 runat="server" id="title"></h2>
        <div class="form-group">
            <asp:Label Text="Codigo" runat="server" />
            <asp:TextBox runat="server" ID="txtCodigo" CssClass="form-control" placeholder="Codigo..." />
        </div>
        <div class="form-group">
            <asp:Label Text="Nombre" runat="server" />
            <asp:TextBox runat="server" ID="txtNombre" CssClass="form-control" placeholder="Nombre..." />
        </div>

        <div class="form-group">
            <asp:Label Text="Imagen" runat="server" />
            <asp:FileUpload runat="server" ID="imgFile" CssClass="form-control" />
        </div>
        <div class="row">
            <div class="col-md-6">
                <asp:Label Text="Costo" runat="server" />
                <asp:TextBox runat="server" ID="txtCosto"  CssClass="form-control" placeholder="Costo..." />
            </div>
            <div class="col-md-6">
                <asp:Label Text="Turno" runat="server" />
                <asp:DropDownList runat="server" ID="ddlTurno" CssClass="form-control">
                </asp:DropDownList>
            </div>
        </div>
        <div class="form-group">
            <asp:Label Text="Video" runat="server" />
            <asp:TextBox runat="server" id="txtVideo" CssClass="form-control" placeholder="Url de video..."/>
        </div>
        <div class="form-group">
            <asp:Label Text="Observación" runat="server" />
            <asp:TextBox runat="server" id="txtObs" class="form-control" TextMode="MultiLine" placeholder="Observación"/>
        </div>
        <asp:Button Text="Crear Receta" runat="server" id="btnNuevaReceta" CssClass="btn btn-success" OnClick="btnNuevaReceta_Click"/>
    </div>
</asp:Content>
