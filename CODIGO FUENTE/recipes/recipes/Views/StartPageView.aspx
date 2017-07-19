<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StartPageView.aspx.cs" Inherits="recipes.Views.StartPageView" MasterPageFile="~/Views/recipes.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="content">
        <div class="search-box">
            <asp:TextBox runat="server" class="search-text" ID="txtSearch" placeholder="Buscar recetas..." />
            <asp:Label runat="server" ID="lblReceta" />
        </div>
        <asp:Repeater runat="server" ID="repeater1">
            <ItemTemplate>
                <div class="break-word">
                    <div class="div-recipe">
                        <%--<asp:Image ImageUrl="~/Images/RecipePhotos/comida.jpg" runat="server" class="recipe-image" />--%>
                        <asp:Image ImageUrl='<%#Bind("re_image") %>' runat="server" class="recipe-image" ID="re_image" />
                        <asp:HyperLink class="absoluto enlace" runat="server" CommandArgument='<%# Eval("re_recipe") %>'
                            NavigateUrl='<%#"~/Views/RecipeDetailView.aspx?RecID=" + DataBinder.Eval(Container.DataItem, "re_recipe").ToString()%>'
                            Style="text-decoration: none; color: black;">

                            <div class="texto absouluto">
                                <h2>
                                    <asp:Label Text='<%#Bind("re_name") %>' runat="server" ID="lblRecipeName" class="name" /></h2>
                                <p>
                                    <asp:Label Text='<%#Bind("re_observation") %>' runat="server" ID="lblObservacion" class="recipe-obs" /></p>
                            </div>
                        </asp:HyperLink></a></div></div></ItemTemplate></asp:Repeater></div></asp:Content>