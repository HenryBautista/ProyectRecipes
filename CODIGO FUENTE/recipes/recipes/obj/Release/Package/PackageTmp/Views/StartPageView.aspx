﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StartPageView.aspx.cs" Inherits="recipes.Views.StartPageView" MasterPageFile="~/Views/recipesHTT.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        
    <!--Section Slider
       
        -->
       <section id="slider">
            <div class="container">
                <div class="row">
                <div class="col-md-12">
                    <div class="block wow fadeInUp" data-wow-duration="500ms" data-wow-delay="300ms">
                        <h1 class="heading wow fadeInUp" data-wow-duration="400ms" data-wow-delay="500ms" >Nuestras <span>Promociones</span>
                        </h1>
                        <div id="myCarousel" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            
            <%-- POR CADA PROMOCION QUE HAYA HAY QUE AUMENTAR EL NUNMERO DE "data-slide-to" ----------------------------------------------%>
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
            </ol>

            <!-- Wrapper for slides -->
            <div class="carousel-inner">
                <div class="item active">
                    <div style="width: 100%;">
                        <div class="div-prImages" style="float: left; width: 50%;">
                            <asp:Image ImageUrl="~/Images/RecipePhotos/comida.jpg" runat="server" ID="prImage1" CssClass="img-responsive" />
                    <%--        <asp:Image ImageUrl="~/Images/RecipePhotos/macdonalds-japones-1.jpg" runat="server" ID="prImage2" Style="width: 100%; max-height: 300px;" />
                       --%> </div>
                        <div class="div-prDetalles" style="float: left; width: 50%;">
                            <div class="div-subprDetalles" style="margin: 20px; width: 100%;">
                                <h2 style="width: 80%; overflow-wrap: break-word; margin-left: auto; margin-right: auto; border-bottom: 1px solid #0a306c;">
                                    <asp:Label Text="Titulo" runat="server" />
                                </h2>
                                <br />
                                <div>
                                    <p><asp:Label Text="texto 1" runat="server" ID="lblTexto1" /></p>
                                </div>
                                <br />
                            </div>
                        </div>
                    </div>
                </div>
                <%-- AQUI DEBERIAN ESTAR LAS DEMAS PROMOCIONES, LO DE ARRIBA ES EL QUE VA A ESTAR ACTIVO LA PRIMERA VEZ --%>
            <asp:Repeater runat="server" ID="repeaterItem">
            <ItemTemplate>
                <div class="item">
                    <div style="width: 100%;">
                        <div class="div-prImages" style="float: left; width: 50%;">
                            <asp:Image ImageUrl='<%#Bind("pr_image1") %>' runat="server" ID="prImage1" CssClass="img-responsive"/>
                      <%--      <asp:Image ImageUrl='<%#Bind("pr_image2") %>' runat="server" ID="prImage2" Style="width: 100%; max-height: 300px;" />
                        --%></div>
                        <div class="div-prDetalles" style="float: left; width: 50%;">
                            <div class="div-subprDetalles" style="margin: 20px; width: 100%;">
                                <h2 style="width: 80%; overflow-wrap: break-word; margin-left: auto; margin-right: auto; border-bottom: 1px solid #0a306c;">
                                    <asp:Label Text='<%# Bind("pr_title") %>' ID="titulo" runat="server" />
                                </h2>
                                <br />
                                <div>
                                   <p><asp:Label Text='<%#Bind("pr_text1") %>' runat="server" ID="lblTexto1" /></p>
                                </div>
                                <br />
                            </div>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
            </asp:Repeater>
                <%--<div class="item">
                    <img src="../Images/RecipePhotos/comida.jpg" alt="promocion 2" style="width: 100%;">
                </div>

                <div class="item">
                    <img src="../Images/RecipePhotos/comida.jpg" alt="promocion 3" style="width: 100%;">
                </div>--%>
            </div>

            <!-- Left and right controls -->
            <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#myCarousel" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
                    </div>
                </div><!-- .col-md-12 close -->
            </div><!-- .row close -->
        
            </div>
       </section>
     <!--
    about-us start
    ============================== -->
    <section id="about-us">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="block">
                        <%--<img class="wow fadeInUp" data-wow-duration="300ms" data-wow-delay="400ms" src="images/cooker-img.png" alt="cooker-img">--%>
                        <h1 class="heading wow fadeInUp" data-wow-duration="400ms" data-wow-delay="500ms" >Somos <span>Resetas Bolivia</span> <br /> Comer bien <span>y sentirse bien</span>
                        </h1>
                        <p class="wow fadeInUp" data-wow-duration="300ms" data-wow-delay="600ms">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim </br> ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in </br>voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat</p>
                    </div>
                </div><!-- .col-md-12 close -->
            </div><!-- .row close -->
        </div><!-- .containe close -->
    </section><!-- #call-to-action close -->
    <!--
    blog start
    ============================ -->
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
                                        <asp:Image ImageUrl='<%#Bind("re_image") %>' runat="server" ID="re_image" alt="blog-img"  style="height:280px"/>
                                    <%--<img src='<%#Bind("re_image") %>' alt="blog-img" />--%>
                                </div>
                                <div class="content-right">
                                    <h3><asp:Label Text='<%#Bind("re_name") %>' runat="server" ID="lblRecipeName" class="name"></asp:Label></h3>
                                    <p>
                                         <asp:Label Text='<%#Bind("re_observation") %>' runat="server" ID="lblObservacion" class="recipe-obs" />
                                    </p>
                                    <br />
                                    <div style="background-color:red; width:60%">
                                         <p style="color:white">
                                         <asp:Label Text='<%#Bind("re_total_cost") %>' runat="server" ID="lbl_total_cost"  ForeColor="White" Font-Size="18"/> Bs.
                                    </p>
                                    </div>
                                    

                                </div>
                                </asp:HyperLink></li></ItemTemplate></asp:Repeater>

                        </ul>
                        <a class="btn btn-default btn-more-info wow bounceIn" data-wow-duration="500ms" data-wow-delay="1200ms" href="#" role="button">Ver mas >></a> </div></div><!-- .col-md-12 close --></div><!-- .row close --></div><!-- .containe close --></section><!-- #blog close --></asp:Content>