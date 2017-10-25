<%@ Page Title="" Language="C#" MasterPageFile="~/Views/recipesHTT.Master" AutoEventWireup="true" CodeBehind="ContactUsView.aspx.cs" Inherits="recipes.Views.ContactUsView1" %>

<%@ OutputCache Location="None" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="about-us">
        <div class="container" style="width:60%;">
            <div class="block">
                <h1 class="heading"><span>Contáctanos</span></h1>
                <div style="margin: 10px; margin-top: 70px;">
                    <div class="row">
                        <div class="form-group col-sm-6">
                            <label for="name" class="h4">Nombre</label>
                            <input type="text" runat="server" class="form-control" id="txt_name" placeholder="Introduce tu Nombre" required="required" />
                        </div>
                        <div class="form-group col-sm-6">
                            <label for="email" class="h4">Email</label>
                            <input runat="server" class="form-control" id="txt_email" placeholder=" Email" required="required" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="message" class="h4 ">Mensaje</label>
                        <textarea id="txt_message" runat="server" class="form-control" rows="5" placeholder="Escriba su mensaje" required="required"></textarea>
                    </div>
                    <asp:Button ID="form_submit" Text="Enviar" runat="server" CssClass="btn btn-success btn-lg pull-right " OnClick="btn_SaveConsult" />
                </div>
            </div>
            <!-- .row close -->
        </div>
        <!-- .containe close -->
    </section>
</asp:Content>
