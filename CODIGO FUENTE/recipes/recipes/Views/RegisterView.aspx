<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterView.aspx.cs" Inherits="recipes.Views.RegisterView" MasterPageFile="~/Views/recipesHTT.Master"%>
<asp:Content ID="head" ContentPlaceHolderID="head" runat="server">
    <link href="../Content/bootstrap.min.css" rel="stylesheet"  type="text/css"/>
    <script src="../Scripts/jquery-1.9.1.min.js"></script>
    <script src="../Scripts/bootstrap.min.js" type="text/javascript"></script>

</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="SM" runat="server">

    </asp:ScriptManager>
    <section>
    <div class="container-fluid">
        <div class="form"> 
            <div class="col-sm-6 center-block" style="background-color:whitesmoke; margin-left:auto; margin-right:auto"> 
                <div>
                   <div class="form-group">
                       <label>Nombre:</label>
                       <asp:TextBox CssClass="form-control" ID="tbox_name" runat="server" ></asp:TextBox>
                   </div>
                    <div class="form-group">
                       <label>Paterno:</label>
                       <asp:TextBox CssClass="form-control" ID="tbox_paterno" runat="server" ></asp:TextBox>
                   </div>
                    <div class="form-group">
                       <label>Materno:</label>
                       <asp:TextBox CssClass="form-control" ID="tbox_materno" runat="server" ></asp:TextBox>
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
    </section>
</asp:Content>