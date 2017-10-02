<%@ Page Title="" Language="C#" MasterPageFile="~/Views/recipesHTT.Master" AutoEventWireup="true" CodeBehind="ContactUsView.aspx.cs" Inherits="recipes.Views.ContactUsView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin: 10px; margin-top:70px;">
        <div class="row">
            <div class="form-group col-sm-6">
                <label for="name" class="h4">Name</label>
                <input type="text" runat="server" class="form-control" id="txt_name" placeholder="Introduce Nombre" required="required" />
            </div>
            <div class="form-group col-sm-6">
                <label for="email" class="h4">Email</label>
                <input type="" runat="server" class="form-control" id="txt_email" placeholder="Introduce Email" required="required" />
            </div>
        </div>
        <div class="form-group">
            <label for="message" class="h4 ">Message</label>
            <textarea id="txt_message" runat="server" class="form-control" rows="5" placeholder="Escriba su mensaje" required="required"></textarea>
        </div>
        <button type="submit" id="form_submit" runat="server" class="btn btn-success btn-lg pull-right " onclick="btn_SaveConsult">Enviar</button>
    </div>
</asp:Content>
