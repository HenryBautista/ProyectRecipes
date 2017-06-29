<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginView.aspx.cs" Inherits="recipes.Views.LoginView" %>
<!DOCTYPE html>
<html>
<head>
    <title>Logeo</title>
    <link href="../Content/bootstrap.min.css" rel="stylesheet"  type="text/css"/>
    <script src="../Scripts/jquery-1.9.1.min.js"></script>
    <script src="../Scripts/bootstrap.min.js" type="text/javascript"></script>

</head>
<body>
    <div class="container">
        <div class="row text-center" style="padding-top:50px">
            <div class="col-md-4">
                <h3>Acceder a recetas Bolivia</h3>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4" >
                <form>
                    <div class="form-group">
                    <label>Email:</label>
                    <input type="email" class="form-control" id="lbl_email" placeholder="Ingrese su Email"/>
                </div>
                <div class="form-group">
                    <label>Contraseña:</label>
                    <input type="password" class="form-control" id="tbox_password" placeholder="contraseña"/>
                </div>
                    <button class="btn btn-success" runat="server" style="width:100%">Acceder</button>
                    <p class="alert-warning" style="padding:10px"><b> Registrate en nuestra Web</b></p>
                    <a class="btn btn-primary" href="RegisterView.aspx" style="width:100%">Registrarse</a>
                </form>
                
            </div>
        </div>
        </div>
</body>
</html>

        
