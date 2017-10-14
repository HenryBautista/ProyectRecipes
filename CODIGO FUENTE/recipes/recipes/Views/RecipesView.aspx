<%@ Page Title="" Language="C#" MasterPageFile="~/Views/recipesHTT.Master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeBehind="RecipesView.aspx.cs" Inherits="recipes.Views.RecipesView" %>
<%@ OutputCache Location="None" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="blog">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="block">
                        <h1 class="heading">Ultimas <span>Recetas</span> para <span>Ver</span></h1>
                        <ul>
                            <asp:Repeater ID="repeaterRecipes" runat="server">
                                <ItemTemplate>
                                    <li class="wow fadeInLeft" data-wow-duration="300ms" data-wow-delay="300ms">
                                        <asp:HyperLink class="absoluto enlace" runat="server" CommandArgument='<%# Eval("re_recipe") %>'
                                            NavigateUrl='<%#"~/Views/RecipeDetail.aspx?valor=" + DataBinder.Eval(Container.DataItem, "re_recipe").ToString()%>'
                                            Style="text-decoration: none; color: black;">
                                            <div class="blog-img">
                                            <asp:Image ImageUrl='<%#Bind("re_image") %>' runat="server" ID="re_image" alt="blog-img" Style="height: 280px" />
                                            <%--<img src='<%#Bind("re_image") %>' alt="blog-img" />--%>
                                        </div>
                                        <div class="content-right">
                                            <div style="height:150px">                                                
                                            <h3><asp:Label Text='<%#Bind("re_name") %>' runat="server" ID="lblRecipeName" class="name"></asp:Label></h3>
                                            <h4>Turno: <asp:Label Text='<%#Bind("TURNO") %>' runat="server" ID="Label3" class="recipe-obs" /></h4> 
                                            <h4>Observacion: <asp:Label Text='<%#Bind("re_observation") %>' runat="server" ID="Label2" class="recipe-obs" /> unidades</h4>                                                                                         
                                            <br />
                                            </div>
                                            <div style="background-color: white; width: 60%; margin-left: auto; margin-right: auto;">
                                                <p style="color: black">
                                                    <asp:Label Text='<%#Bind("re_total_cost") %>' Style="color: black; font-size: 30px; font-weight: bolder;" runat="server" ID="lbl_total_cost" ForeColor="White" Font-Size="18" />
                                                    Bs.
                                                </p>
                                            </div>
                                            <div style="background-color: white; width: 100%; margin-bottom:5px">
                                                <asp:Button Text="Comprar" ID="btnComprar" CssClass="btn btn-danger" CommandArgument='<%#Bind("re_recipe") %>' OnClick="btnComprar_Click" runat="server" Style="width: 100%;" />
                                            </div>
                                        </div>
                                        </asp:HyperLink></li>
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
                alert("Ya se encuenta en la lista,puede modificar\n la cantidad al planificar el pedido  ");
            };
        </script>
    </section>
</asp:Content>
