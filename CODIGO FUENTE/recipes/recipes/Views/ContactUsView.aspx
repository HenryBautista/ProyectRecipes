<%@ Page Title="" Language="C#" MasterPageFile="~/Views/recipesHTT.Master" AutoEventWireup="true" CodeBehind="ContactUsView.aspx.cs" Inherits="recipes.Views.ContactUsView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
            <div class="form-group col-sm-6">
                <label for="name" class="h4">Name</label>
                <input type="text" runat="server" class="form-control" id="name" placeholder="Introduce Nombre" required="required"/>
            </div>
            <div class="form-group col-sm-6">
                <label for="email" class="h4">Email</label>
                <input type="email" runat="server" class="form-control" id="email" placeholder="Introduce email" required="required"/>
            </div>
        </div>
        <div class="form-group">
            <label for="message" class="h4 ">Message</label>
            <textarea id="message" runat="server" class="form-control" rows="5" placeholder="Aqui el mensaje" required="required"></textarea>
        </div>
        <button type="submit" id="form-submit" class="btn btn-success btn-lg pull-right ">Submit</button>

</asp:Content>
