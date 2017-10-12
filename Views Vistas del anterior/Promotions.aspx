<%@ Page Title="" Language="C#" MasterPageFile="~/Views/recipes.Master" AutoEventWireup="true" CodeBehind="Promotions.aspx.cs" Inherits="recipes.Views.Promotions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
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
                            <asp:Image ImageUrl="~/Images/RecipePhotos/comida.jpg" runat="server" ID="prImage1" Style="width: 100%; max-height: 300px;" />
                            <asp:Image ImageUrl="~/Images/RecipePhotos/macdonalds-japones-1.jpg" runat="server" ID="prImage2" Style="width: 100%; max-height: 300px;" />
                        </div>
                        <div class="div-prDetalles" style="float: left; width: 50%;">
                            <div class="div-subprDetalles" style="margin: 20px; width: 100%;">
                                <h2 style="width: 80%; overflow-wrap: break-word; margin-left: auto; margin-right: auto; border-bottom: 1px solid #0a306c;">
                                    <asp:Label Text="Titulo" runat="server" />
                                </h2>
                                <div style="width: 80%; border-radius: 5px; background: rgba(160, 160, 160, 0.30); overflow-wrap: break-word; padding: 10px;">
                                    <asp:Label Text="texto 1" runat="server" ID="lblTexto1" />
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
                            <asp:Image ImageUrl='<%#Bind("pr_image1") %>' runat="server" ID="prImage1" Style="width: 100%; max-height: 300px;" />
                            <%--<asp:Image ImageUrl='<%#Bind("pr_image2") %>' runat="server" ID="prImage2" Style="width: 100%; max-height: 300px;" />--%>
                        </div>
                        <div class="div-prDetalles" style="float: left; width: 50%;">
                            <div class="div-subprDetalles" style="margin: 20px; width: 100%;">
                                <h2 style="width: 80%; overflow-wrap: break-word; margin-left: auto; margin-right: auto; border-bottom: 1px solid #0a306c;">
                                    <asp:Label Text='<%# Bind("pr_title") %>' ID="titulo" runat="server" />
                                </h2>
                                <div style="width: 80%; border-radius: 5px; background: rgba(160, 160, 160, 0.30); overflow-wrap: break-word; padding: 10px;">
                                    <asp:Label Text='<%#Bind("pr_text1") %>' runat="server" ID="lblTexto1" />
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
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
</asp:Content>
