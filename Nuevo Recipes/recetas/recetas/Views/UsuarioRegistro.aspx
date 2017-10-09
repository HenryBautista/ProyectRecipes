<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UsuarioRegistro.aspx.cs" Inherits="recetas.Views.UsuarioRegistro" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Registro de usuario</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <style>
        body {
            font-family: Calibri;
        }
        /* Style all font awesome icons */
        .fa {
            padding: 20px;
            font-size: 30px;
            width: 50px;
            height: 50px;
            text-align: center;
            text-decoration: none;
        }

            /* Add a hover effect if you want */
            .fa:hover {
                opacity: 0.7;
                text-decoration: none;
            }

        /* Set a specific color for each brand */

        /* Facebook */
        .fa-facebook {
            background: #3B5998;
            color: white;
        }

        .fa-youtube {
            background: #bb0000;
            color: white;
        }

        /* Twitter */
        .fa-twitter {
            background: #55ACEE;
            color: white;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container" style="width: 80%; margin-top: 25px; border: 1px solid #e1e1e1;">
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
                </div>
            </div>
        </div>
    </form>


    <section id="footer" class="panel-footer" style="margin-top: 5px;">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <div class="block wow fadeInLeft" data-wow-delay="200ms">
                        <h3>INFORMACION <span style="color: #ff6a00">CONTACTO</span></h3>
                        <div class="info">
                            <div class="row">
                                <div class="col-md-5">
                                    <h4><i class="fa fa-phone"></i>Telefono</h4>
                                    <p>+591 76506914</p>
                                </div>
                                <div class="col-md-5">
                                    <h4><i class="fa fa-map-marker"></i>Direccion</h4>
                                    <p>la direccino va aqui </p>
                                </div>
                            </div>
                            <div class="form-group">
                                <h4><i class="fa fa-envelope"></i>E mail</h4>
                            <p><a href="ContactUsView.aspx">rest@gmail.com - rest@mail.ru</a></p>
                            </div>
                            
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="block wow fadeInLeft" data-wow-delay="1100ms">
                        <h3>Síguenos en</h3>
                        <div class="row">
                            <div class="col-md-2">
                                <a href="#" class="fa fa-facebook"></a>
                            </div>
                            <div class="col-md-2">
                                <a href="#" class="fa fa-twitter"></a>
                            </div>
                            <div class="col-md-2">
                                <a href="#" class="fa fa-youtube"></a>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- .col-md-4 close -->
            </div>
            <!-- .row close -->
        </div>
        <!-- .containe close -->
    </section>
    <!-- #footer close -->
    <!--
    footer-bottom  start
    ============================= -->
    <footer id="footer-bottom">
        <div class="container">
            <div class="row">
                <div class="col-md-12 col-sm-12">
                    <div class="block">
                        <p>Copyright &copy; 2017 - All Rights Reserved.Design and Developed By <a href="http://www.codessbolivia.com">CODESS</a></p>
                    </div>
                </div>
            </div>
        </div>
    </footer>
</body>
</html>
