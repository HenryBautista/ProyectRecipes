<%@ Page Title="" Language="C#" MasterPageFile="~/Views/recipesHTT.Master" AutoEventWireup="true" CodeBehind="RecipePeopleView.aspx.cs" Inherits="recipes.Views.RecipePeopleView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="blog">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="block">
                        <h1 class="heading wow fadeInUp" data-wow-duration="400ms" data-wow-delay="500ms"><span>Recetas</span>de usuarios
                        <asp:GridView ID="grdPeople" runat="server">
                            <Columns>
                                <asp:ImageField HeaderText="Image" DataImageUrlField="re_image" ControlStyle-Width="80">
                                    <ControlStyle Width="80px"></ControlStyle>
                                </asp:ImageField>
                                <asp:BoundField HeaderText="Url video" DataField="re_url_video" />
                                <asp:BoundField HeaderText="Id" DataField="re_recipe_id" />
                                <asp:BoundField HeaderText="Nombre" DataField="re_name" />
                                <asp:BoundField HeaderText="Turno" DataField="TURNO" />
                                <asp:BoundField HeaderText="Observacion" DataField="re_observation" />
                                <asp:BoundField HeaderText="Coste Total" DataField="re_total_cost" />
                                <asp:HyperLinkField Text="Ver Receta" NavigateUrl='<%# Eval("re_recipe","~/Views/RecipeDetailView.aspx?RecID={0}")%>' />
                            </Columns>
                        </asp:GridView>
                            <%--                        <a class="btn btn-default btn-more-info wow bounceIn" data-wow-duration="500ms" data-wow-delay="1200ms" href="#" role="button">Ver mas >></a>--%>
                    </div>
                </div>
                <!-- .col-md-12 close -->
            </div>
            <!-- .row close -->
        </div>
        <!-- .containe close -->
    </section>
</asp:Content>
