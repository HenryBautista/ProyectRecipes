<%@ Page Language="C#" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeBehind="StartPageView.aspx.cs" Inherits="recipes.Views.StartPageView" MasterPageFile="~/Views/recipesHTT.Master" %>
<%@ OutputCache Location="None" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--
    Acerca de La Empresa start
    ============================== -->
    <section id="about-us">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="block">
                        <%--<img class="wow fadeInUp" data-wow-duration="300ms" data-wow-delay="400ms" src="images/cooker-img.png" alt="cooker-img">--%>
                        <h1 class="heading wow fadeInUp" data-wow-duration="400ms" data-wow-delay="500ms">Somos <span>Recetas Bolivia</span>
                            <%--<br />
                            Comer bien <span>y sentirse bien</span>--%>
                        </h1>
                        <p id="Parrafo" runat="server" class="wow fadeInUp" data-wow-duration="300ms" data-wow-delay="600ms">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim </br> ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in </br>voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat</p>
                    </div>
                </div>
                <!-- .col-md-12 close -->
            </div>
            <!-- .row close -->
        </div>
        <!-- .containe close -->
    </section>
    <!-- #call-to-action close -->
    <!--Section Slider Promociones -->
    <section id="slider">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="block wow fadeInUp" data-wow-duration="500ms" data-wow-delay="300ms">
                        <h1 class="heading wow fadeInUp" data-wow-duration="400ms" data-wow-delay="500ms">Nuestras <span>Promociones</span>
                        </h1>
                        <div id="myCarousel" class="carousel slide" data-ride="carousel">
                            <!-- Indicators -->
                            <%-- POR CADA PROMOCION QUE HAYA HAY QUE AUMENTAR EL NUNMERO DE "data-slide-to" ----------------------------------------------%>
                            <ol class="carousel-indicators">
                                <li data-target="#myCarousel" data-slide-to="1"></li>
                                <li data-target="#myCarousel" data-slide-to="2"></li>
                                <li data-target="#myCarousel" data-slide-to="3"></li>
                            </ol>
                            <!-- Wrapper for slides -->
                            <div class="carousel-inner" style="max-height:300px">
                                <div class="item active">
                                    <div style="width: 100%;">
                                        <div class="div-prImages" style="float: left; width: 50%;">
                                            <asp:Image ImageUrl="~/Images/RecipePhotos/comida.jpg" runat="server" ID="prImage1" CssClass="img-responsive" />
                                        </div>
                                        <div class="div-prDetalles" style="float: left; width: 50%;">
                                            <div class="div-subprDetalles" style="margin: 20px; width: 100%;">
                                                <h2 style="width: 80%; overflow-wrap: break-word; margin-left: auto; margin-right: auto; border-bottom: 1px solid #0a306c;">
                                                    <asp:Label Text="Titulo" runat="server" />
                                                </h2>
                                                <br />
                                                <div>
                                                    <p>
                                                        <asp:Label Text="texto 1" runat="server" ID="lblTexto1" />
                                                    </p>
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
                                                    <asp:Image ImageUrl='<%#Bind("pr_image") %>' runat="server" ID="prImage1" CssClass="img-responsive" />
                                                </div>
                                                <div class="div-prDetalles" style="float: left; width: 50%;">
                                                    <div class="div-subprDetalles" style="margin: 20px; width: 100%;">
                                                        <h2 style="width: 80%; overflow-wrap: break-word; margin-left: auto; margin-right: auto; border-bottom: 1px solid #0a306c;">
                                                            <asp:Label Text='<%# Bind("pr_title") %>' ID="titulo" runat="server" />
                                                        </h2>
                                                        <br />
                                                        <div>
                                                            <p>
                                                                <asp:Label Text='<%#Bind("pr_text") %>' runat="server" ID="lblTexto1" />
                                                            </p>
                                                        </div>
                                                        <br />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
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
                </div>
                <!-- .col-md-12 close -->
            </div>
            <!-- .row close -->
        </div>
    </section>

    <!--
    blog start
    ============================ -->
    <section id="blog">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="block">
                        <h1 class="heading">Nuestros <span>Productos</span> los mejores <span>Ingredientes</span></h1>
                        <div class="form-group">
                            <div class="form-group col-md-4">
                                <h3 style="color: white;">Origen</h3>
                                <asp:DropDownList runat="server" CssClass="form-control" ID="ddlOrigen" DataValueField="co_correlative" DataTextField="co_name">
                                </asp:DropDownList>
                            </div>
                            <div class="form-group col-md-4">
                                <h3 style="color: white;">Categoria</h3>
                                <asp:DropDownList runat="server" CssClass="form-control" ID="ddlCategoria" DataValueField="co_correlative" DataTextField="co_name">
                                </asp:DropDownList>
                            </div>
                            
                            <div class="form-group col-md-4">
                                <h3 style="color: white;">Filtros</h3>
                                <asp:Button Text="Buscar" ID="btnBuscar" CssClass="btn btn-default" OnClick="btnBuscar_Click1" runat="server" />
                            </div>
                            
                        </div>
                        <ul>
                            <asp:Repeater ID="repeateringredients" runat="server">
                                <ItemTemplate>
                                    <li class="wow fadeInLeft" data-wow-duration="300ms" data-wow-delay="300ms">
                                        <asp:HyperLink class="absoluto enlace" runat="server" CommandArgument='<%# Eval("in_ingredient") %>'
                                            NavigateUrl='<%#"~/Views/IngredientDetail.aspx?valor=" + DataBinder.Eval(Container.DataItem, "in_ingredient").ToString()%>'
                                            Style="text-decoration: none; color: black;">
                                        <div class="blog-img">
                                            <asp:Image ImageUrl='<%#Bind("in_image") %>' runat="server" ID="re_image" alt="blog-img" Style="height: 280px" />
                                            <%--<img src='<%#Bind("re_image") %>' alt="blog-img" />--%>
                                        </div>
                                        <div class="content-right">
                                            <div style="height:150px">                                                
                                            <h3><asp:Label Text='<%#Bind("in_name") %>' runat="server" ID="lblRecipeName" class="name"></asp:Label></h3>
                                            <h4>Costo: <asp:Label Text='<%#Bind("in_cost") %>' runat="server" ID="Label1" class="recipe-obs" /> Bs.</h4> 
                                            <h4>Unidades: <asp:Label Text='<%#Bind("UNITABB") %>' runat="server" ID="Label3" class="recipe-obs" /></h4> 
                                            <h4>Cantidad: <asp:Label Text='<%#Bind("in_quantity") %>' runat="server" ID="Label2" class="recipe-obs" /> unidades</h4>
                                            <h4>Origen: <asp:Label Text='<%#Bind("ORIGIN") %>' runat="server" ID="Label4" class="recipe-obs" /></h4>                                               
                                            <br />
                                            </div>
                                            <div style="background-color: white; width: 60%; margin-left: auto; margin-right: auto;">
                                                <p style="color: black">
                                                    <asp:Label Text='<%#Bind("in_factor") %>' Style="color: black; font-size: 30px; font-weight: bolder;" runat="server" ID="lbl_total_cost" ForeColor="White" Font-Size="18" />
                                                    Bs.
                                                </p>
                                            </div>
                                            <div style="background-color: white; width: 100%; margin-bottom:5px">
                                                <asp:Button Text="Comprar" ID="btnComprar" CssClass="btn btn-danger" CommandArgument='<%#Bind("in_ingredient") %>' OnClick="btnComprar_Click" runat="server" Style="width: 100%;" />
                                            </div>
                                        </div>
                                        </asp:HyperLink>
                                    </li>
                                </ItemTemplate>
                            </asp:Repeater>
                            
                        </ul>
                        <%--                        <a class="btn btn-default btn-more-info wow bounceIn" data-wow-duration="500ms" data-wow-delay="1200ms" href="#" role="button">Ver mas >></a>--%>
                    </div>
                </div>
                <!-- .col-md-12 close -->
            </div>
            <!-- .row close -->
        </div>
        <!-- .containe close -->
        
        <script type="text/javascript">
            function AlertError() {
                alert("Algo salio mal!");
            };
            function AlertExist() {
                alert("Ya se encuenta en la lista,puede modificar\n la cantidad al planificar el pedido ");
            };
        </script>
    </section>
    <!-- #blog close -->
</asp:Content>
