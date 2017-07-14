<%@ Page Title="" Language="C#" MasterPageFile="~/Views/recipes.Master" AutoEventWireup="true" CodeBehind="RecipeDetailView.aspx.cs" Inherits="recipes.Views.RecipeDetailView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="detail-recImage">
            <img src="../Images/RecipePhotos/macdonalds-japones-1.jpg" alt="Alternate Text" class="recImage" />
        </div>
        <div class="detail-recipe">
            <div class="lblRecipeName-detail">
                <asp:Label Text="text" runat="server" ID="lblRecipeName" />
            </div>
            <div class="div-turno">
                <asp:Label Text="Turno" runat="server" />
                <br />
                <asp:Label Text="text" runat="server" ID="lblTurno" />
                <br />
                <asp:Label Text="Costo total" runat="server" />
                <br />
                <asp:Label Text="text" runat="server" ID="lblTotalCost" />
            </div>
            <div class="div-recipe">
                <asp:Label Text="text" runat="server" ID="lblRecipe" />
            </div>
            <div class="div-ingredients">
                <asp:Label Text="Ingredientes" runat="server" style="font-size:20px; margin:20px;"/>
                <br />
                    <asp:GridView runat="server" ID="grdingredients" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" style="margin-top:10px;">
                        <AlternatingRowStyle BackColor="White" />
                        <EditRowStyle BackColor="#7C6F57" />
                        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#E3EAEB" />
                        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F8FAFA" />
                        <SortedAscendingHeaderStyle BackColor="#246B61" />
                        <SortedDescendingCellStyle BackColor="#D4DFE1" />
                        <SortedDescendingHeaderStyle BackColor="#15524A" />

                    </asp:GridView>
                </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
</asp:Content>
