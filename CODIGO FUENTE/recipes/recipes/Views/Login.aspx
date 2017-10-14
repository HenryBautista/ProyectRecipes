<%@ Page Title="" Language="C#" MasterPageFile="~/Views/recipesHTT.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="recipes.Views.Login" %>
<%@ OutputCache Location="None" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" style="width: 80%; margin-top: 100px; border: 1px solid #e1e1e1;">
            <div class="row">
                <div class="col-lg-6" style="background: #fff;">
                    <h3>Bienvenido a</h3>
                    <h1>Recetas <span style="font-weight: bold; color: #de5224">Bolivia</span></h1>
                    <br />
                    <br />
                    <p style="font-weight: bold; margin-left: 20px;">- Promociones</p>
                    <p style="font-weight: bold; margin-left: 20px;">- Nuevos productos</p>
                    <p style="font-weight: bold; margin-left: 20px;">y mucho mas...</p>
                </div>
                <div class="col-lg-6">
                    <h2 style="padding: 0px; margin: 0px;">Iniciar sesión</h2>
                    <br />
                    <div class="form-group">
                        <asp:TextBox runat="server" ID="txtUser" class="form-control" required="true" placeholder="Email" />
                    </div>
                    
                    <div class="form-group">
                        <asp:TextBox runat="server" ID="txtPass" TextMode="Password" CssClass="form-control" required="true" placeholder="Contraseña" />
                    </div>
                    <asp:Button Text="Entrar" ID="btnIniciar" OnClick="btnIniciar_Click" CssClass="btn btn-primary" runat="server" />
                    <a href="../Views/StartPage.aspx" class="btn btn-danger">Cancelar</a>
                    <p>¿No estas registrado aún?   <a href="../Views/UsuarioRegistro.aspx">Registrate!</a></p>
                    <br />
                    <asp:Label Text="text" ID="lblEstado" runat="server" CssClass="label label-danger" style="font-size:15px;"/>
                </div>
                
            </div>
        </div>
    <script type="text/javascript">
        function noBack() {
            window.history.forward();
            setTimeout("noBack", 0);
            window.onload = function () { null };
        };
        window.onload = noBack();
    </script>
</asp:Content>
