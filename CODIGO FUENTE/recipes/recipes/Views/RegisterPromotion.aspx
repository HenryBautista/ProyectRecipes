<%@ Page Title="" Language="C#" MasterPageFile="~/Views/recipes.Master" AutoEventWireup="true" CodeBehind="RegisterPromotion.aspx.cs" Inherits="recipes.Views.RegisterPromotion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="contenido">
        <div class="div-title">
            <h2>Registro de promociones</h2>
        </div>
        <div class="div-registro">
             <table>
                <tr>
                    <td class="label">Nombre</td>
                    <td class="text">
                        <asp:TextBox class="detalle" ID="txtName" runat="server" placeholder="Nombre de la promoción"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="label">Titulo</td>
                    <td class="text">
                        <asp:TextBox CssClass="detalle" ID="txtTitle" placeholder="Titulo de la promoción" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="label">Detalles</td>
                    <td class="text">
                        <asp:TextBox CssClass="detalle multitext" ID="txtDetalles" TextMode="MultiLine" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="label">Imagen 1</td>
                    <td class="text">
                        <asp:FileUpload runat="server" ID="flpImage1" />
                    </td>
                </tr>
                <tr>
                    <td class="label">Imagen 2</td>
                    <td class="text">
                        <asp:FileUpload runat="server" ID="flpImage2" />
                    </td>
                </tr>
            </table>
            <div class="btn">
                <button class="button" runat="server"  onclick="btn_createPromotion_Click">
                    <span>Crear promoción</span>
                </button>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
</asp:Content>
