<%@ Page Title="" Language="C#" MasterPageFile="~/Views/recipesHTT.Master" AutoEventWireup="true" CodeBehind="StartViewAdministrator.aspx.cs" Inherits="recipes.Views.StartViewAdministrator" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="about-us">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="block">
                        <%--<img class="wow fadeInUp" data-wow-duration="300ms" data-wow-delay="400ms" src="images/cooker-img.png" alt="cooker-img">--%>
                        <h1 class="heading wow fadeInUp" data-wow-duration="400ms" data-wow-delay="500ms">Nuestra<span>Historia </span>                            
                        </h1>
                        <div class="md-form">
                            <textarea type="text" id="Parrafo" runat="server" class="form-control" rows="4"></textarea>
                            <label for="form7">(parrafo inicio)</label>
                        </div>
                    </div>
                    <div class="block">
                        <h1 class="heading wow fadeInUp" data-wow-duration="400ms" data-wow-delay="500ms">Imagen<span>Inicio </span></h1>
                        <div>
                            <label for="ImageFile">Seleccionar Imagen</label>
                            <input type="file" id="ImageFile" name="ImageFiles" />
                        </div>
                        <div class="overlay hm-white-slight z-depth-1-half">
                            <asp:Image ID="imageCabecera" runat="server" />
                        </div>
                    </div>
                </div>
                <!-- .col-md-12 close -->
            </div>
            <!-- .row close -->
        </div>
        <!-- .containe close -->
    </section>
</asp:Content>
