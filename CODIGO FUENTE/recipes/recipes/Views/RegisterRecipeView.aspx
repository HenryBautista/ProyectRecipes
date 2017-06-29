<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterRecipeView.aspx.cs" Inherits="recipes.Views.RegisterRecipeView" MasterPageFile="~/Views/recipes.Master"%>


<asp:Content ID="head" ContentPlaceHolderID="head" runat="server">
    <link href="../Content/bootstrap.min.css" rel="stylesheet"  type="text/css"/>
    <script src="../Scripts/jquery-1.9.1.min.js"></script>
    <script src="../Scripts/bootstrap.min.js" type="text/javascript"></script>

</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="SM" runat="server">

    </asp:ScriptManager>
    <div id="div_register" class="container-fluid" runat="server">
        <div class="row"> 
            <div class="col-sm-12 col-md-6" style="background-color:whitesmoke"> 
                <div>
                   <div class="form-group">
                       <label>ID:</label>
                       <asp:TextBox CssClass="form-control" ID="tbox_id" runat="server" ></asp:TextBox>
                   </div>
                <div class="form-group">
                    <label>NOMBRE:</label>
                    <asp:TextBox  CssClass="form-control" ID="tbox_name" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>TURNO:</label>
                    <asp:DropDownList ID="ddl_turn" CssClass="form-control" runat="server" DataValueField="co_correlative" DataTextField="co_name"></asp:DropDownList>
                </div>
                <div class="form-group">
                    <label>Imagen:</label>
                    <asp:FileUpload id="file_image" runat="server"/>
                </div>
                    <label runat="server" id="lbl_message" class="alert-danger"></label>
                    <asp:Button id="btn_crear" runat="server" CssClass="btn btn-success" Text="CREAR" />
                </div>  
            </div>
        </div>
    </div>

</asp:Content>
