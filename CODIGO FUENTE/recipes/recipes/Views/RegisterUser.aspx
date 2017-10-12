<%@ Page Title="" Language="C#" MasterPageFile="~/Views/recipesHTT.Master" AutoEventWireup="true" CodeBehind="RegisterUser.aspx.cs" Inherits="recipes.Views.RegisterUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" style="width: 80%; margin-top:70px; border: 1px solid #e1e1e1;">
        <div class="row">
            <div class="col-lg-6" style="background: #fff;">
                <h3>Bienvenido a</h3>
                <h1>Recetas <span style="font-weight: bold; color: #de5224">Bolivia</span></h1>
                <br />
                <br />
                <h3 style="font-weight: bold;">Beneficios de unirse a nuestro sitio</h3>
                <p style="font-weight: bold; margin-left: 20px;">- Los mejores productos</p>
                <p style="font-weight: bold; margin-left: 20px;">- Calidad en servicio</p>
                <p style="font-weight: bold; margin-left: 20px;">- Excelentes precios</p>
            </div>
            <div class="col-lg-6">
                <h2 style="padding: 0px; margin: 0px;">Crear una cuenta</h2>
                <br />
                <div class="form-group">
                    <asp:TextBox runat="server" ID="txtNombre" class="form-control" required="true" placeholder="Nombre" />
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <asp:TextBox runat="server" ID="txtPaterno" CssClass="form-control" required="true" placeholder="Apellido paterno" />
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <asp:TextBox runat="server" ID="txtMaterno" CssClass="form-control" required="true" placeholder="Apellido materno" />
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <asp:TextBox runat="server" ID="txtEmail" TextMode="Email" required="true" CssClass="form-control" placeholder="Email" />
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <asp:TextBox runat="server" ID="txtPass" TextMode="Password" required="true" CssClass="form-control" placeholder="Contraseña" />
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <asp:TextBox runat="server" ID="txtDireccion" CssClass="form-control" required="true" placeholder="Dirección" />
                </div>
                <div class="form-group">
                    <asp:TextBox runat="server" ID="txtTelefono" CssClass="form-control" required="true" placeholder="Numero de teléfono" />
                </div>
                <asp:Button Text="Registrarse" ID="btnRegistrar" OnClick="btnRegistrar_Click" CssClass="btn btn-primary" runat="server" />
                <a href="../Views/StartPage.aspx" class="btn btn-danger">Cancelar</a>
                <asp:Label Text="text" ID="lblUser" runat="server" />
            </div>
        </div>
    </div>
</asp:Content>
