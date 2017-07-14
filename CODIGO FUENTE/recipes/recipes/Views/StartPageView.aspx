<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StartPageView.aspx.cs" Inherits="recipes.Views.StartPageView" MasterPageFile="~/Views/recipes.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="content" style="margin-left: auto; margin-right: auto;">
        <div class="search-box">
            <asp:TextBox runat="server"  class="search-text" ID="txtSearch" placeholder="Buscar recetas..."/>
            <asp:Label runat="server" id="lblReceta"/>
        </div>
        <asp:Repeater runat="server" ID="repeater1">
            <ItemTemplate>
                <div class="break-word">
                    <div class="divRepeater" id="divRepeater" style="width: 30%; float: left; margin: 10px;">
                        <div class="polaroid">
                            <div class="image-container">
                                <div class="lblRecipeName">
                                    <asp:Label Text='<%#Bind("re_name") %>' runat="server" ID="lblRecipeName"  />
                                </div>
                                <img class="recipe-image" src="../Images/RecipePhotos/macdonalds-japones-1.jpg" alt="Alternate Text" runat="server"/>
                            </div>
                            <div class="recipe-detail">
                                    <asp:Label Text='<%#Bind("re_observation") %>' runat="server" id="lblObservacion"/>
                                </div>
                            <div class="container">
                                <asp:HyperLink class="button" runat="server" CommandArgument='<%# Eval("re_recipe") %>'
                                    NavigateUrl='<%#"~/Views/RecipeDetailView.aspx?RecID=" + DataBinder.Eval(Container.DataItem, "re_recipe").ToString()%>'
                                    Style="text-decoration: none; color: black;"><span>Ver receta</span></asp:HyperLink>
                            </div>
                        </div>

                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <%--<asp:GridView ID="grid" runat="server">

       </asp:GridView>--%>
</asp:Content>
