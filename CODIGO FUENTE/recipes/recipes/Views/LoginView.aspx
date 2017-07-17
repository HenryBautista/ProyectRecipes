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
                <form runat="server">
                    <div class="form-group">
                    <label>Email:</label>
                    <asp:TextBox type="email" runat="server" class="form-control" id="tbox_email" placeholder="Ingrese su Email"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Contraseña:</label>
                    <asp:TextBox runat="server"  type="password" class="form-control" id="tbox_password" placeholder="contraseña"/>
                </div>
                    <p class="alert-warning"><label id="lbl_error" runat="server" style="color:red"></label></p>
                    <asp:Button id="btn_access" class="btn btn-success" runat="server" style="width:100%" Text="Aceeder" OnClick="btn_access_Click"> </asp:Button>
                    <p class="alert-warning" style="padding:10px"><b> Registrate en nuestra Web</b></p>
                    <asp:Button id="btn_register" runat="server" class="btn btn-primary" style="width:100%" Text="Registrarse" OnClick="btn_register_Click"></asp:Button>
                </form>
                
            </div>
        </div>
        </div>
</body>
</html>

        
