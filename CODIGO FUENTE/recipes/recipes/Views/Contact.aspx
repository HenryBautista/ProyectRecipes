<%@ Page Title="" Language="C#" MasterPageFile="~/Views/recipes.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="recipes.Views.Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content">
        <div class="contactinfo">
            <h1>Contacta con nosotros</h1>
            <div style="padding: 15px; text-align: justify;">
                <address>
                    <h2>Correo electronico: unCorreo@hotmail.com
                    <br />
                        <br />
                        <br />
                        Llámanos al: 900 21  06 21</h2>
                    <p style="padding-left:200px;">
                        De lunes a viernes de 9:00 a 14:00
                        <br />
                        <br />
                        O sabados de 8:00 a 12:00
                    </p>
                </address>
            </div>
        </div>
        <div class="contactus">
            <h2 >Escríbenos</h2>
            <br />
            <asp:Label Text="Email" runat="server" />
            <br />
            <asp:TextBox runat="server" id="txtEmail" placeholder="Introducir email" style="height:25px;" class="contactus-info"/>
            <br />
            <asp:Label Text="Escriba su mensaje" runat="server" />
            <br />
            <asp:TextBox runat="server" id="txtMensaje" TextMode="MultiLine" style="height:150px;" class="contactus-info"/>
            <br />
            <asp:Button Text="Enviar Comentario" class="btnEnviar"  ID="btnEnviar" runat="server" />
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
</asp:Content>
