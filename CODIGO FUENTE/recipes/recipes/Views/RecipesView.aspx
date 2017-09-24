<%@ Page Title="" Language="C#" MasterPageFile="~/Views/recipesHTT.Master" AutoEventWireup="true" CodeBehind="RecipesView.aspx.cs" Inherits="recipes.Views.RecipesView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--recetas cuerpo ============================= -->
    <section id="blog">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="block">
                        <h1 class="heading">Ultimas <span>Recetas</span> para <span>Ver</span></h1>
                        <ul>
                            <asp:Repeater ID="repeater1" runat="server">
                                <ItemTemplate>

                                    <li class="wow fadeInLeft" data-wow-duration="300ms" data-wow-delay="300ms">
                                        <asp:HyperLink class="absoluto enlace" runat="server" CommandArgument='<%# Eval("re_recipe") %>'
                                            NavigateUrl='<%#"~/Views/RecipeDetailView.aspx?RecID=" + DataBinder.Eval(Container.DataItem, "re_recipe").ToString()%>'
                                            Style="text-decoration: none; color: black;">
                                            <div class="blog-img">
                                                <asp:Image ImageUrl='<%#Bind("re_image") %>' runat="server" ID="re_image" alt="blog-img" Style="height: 280px" />
                                                <%--<img src='<%#Bind("re_image") %>' alt="blog-img" />--%>
                                            </div>
                                            <div class="content-right">
                                                <h3>
                                                    <asp:Label Text='<%#Bind("re_name") %>' runat="server" ID="lblRecipeName" class="name"></asp:Label></h3>
                                                <p>
                                                    <asp:Label Text='<%#Bind("re_observation") %>' runat="server" ID="lblObservacion" class="recipe-obs" />
                                                </p>
                                                <br />
                                                <div style="background-color: red; width: 60%">
                                                    <p style="color: white">
                                                        <asp:Label Text='<%#Bind("re_total_cost") %>' runat="server" ID="lbl_total_cost" ForeColor="White" Font-Size="18" />
                                                        Bs.
                                                    </p>
                                                </div>


                                            </div>
                                        </asp:HyperLink></li>
                                </ItemTemplate>
                            </asp:Repeater>

                        </ul>
                        <a class="btn btn-default btn-more-info wow bounceIn" data-wow-duration="500ms" data-wow-delay="1200ms" href="#" role="button">Ver mas >></a>
                    </div>
                </div>
                <!-- .col-md-12 close -->
            </div>
            <!-- .row close -->
        </div>
        <!-- .containe close -->
    </section>
</asp:Content>
