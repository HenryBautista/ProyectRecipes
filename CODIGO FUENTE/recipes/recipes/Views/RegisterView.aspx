<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterView.aspx.cs" Inherits="recipes.Views.RegisterView" MasterPageFile="~/Views/recipes.Master"%>
<asp:Content ID="head" ContentPlaceHolderID="head" runat="server">
    <link href="../Content/bootstrap.min.css" rel="stylesheet"  type="text/css"/>
    <script src="../Scripts/jquery-1.9.1.min.js"></script>
    <script src="../Scripts/bootstrap.min.js" type="text/javascript"></script>

</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
                       <label>Usuario:</label>
                       <asp:TextBox CssClass="form-control" ID="tbox_name" runat="server" ></asp:TextBox>
                   </div>
                <div class="form-group">
                    <label>Email:</label>
                    <asp:TextBox  CssClass="form-control" ID="tbox_email" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Contraseña:</label>
                    <asp:TextBox TextMode="Password" CssClass="form-control" id="tbox_password" placeholder="contraseña" runat="server"/>
                </div>
                <div class="form-group">
                    <label>Repetir contraseña:</label>
                    <asp:TextBox  TextMode="Password" class="form-control" id="tbox_password_repeat" placeholder="Repetir contraseña" runat="server"/>
                </div>
                    <label runat="server" id="lbl_message" class="alert-danger">dasdsad</label>
                    <asp:Button id="btn_crear" runat="server" CssClass="btn btn-success" Text="CREAR" OnClick="btn_crear_Click"/>
                </div>  
            </div>
        </div>
    </div>
</asp:Content>