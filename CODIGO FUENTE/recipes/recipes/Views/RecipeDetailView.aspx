<%@ Page Title="" Language="C#" MasterPageFile="~/Views/recipes.Master" AutoEventWireup="true" CodeBehind="RecipeDetailView.aspx.cs" Inherits="recipes.Views.RecipeDetailView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="detail-recImage">
            <asp:Image ID="ImagenRecipe" runat="server" ImageUrl="~/Images/RecipePhotos/comida.jpg" class="recImage" />
        </div>
        <div class="detail-recipe">
            <div class="lblRecipeName-detail">
                <asp:Label Text="text" runat="server" ID="lblRecipeName" />
                <asp:Label ID="lblid" runat="server" Visible="false" />
            </div>
            <div class="div-turno ">
                <br />
                <asp:Label Text="Turno" runat="server" class="lbl" Style="color: #ff0000;" />
                <br />
                <asp:Label Text="text" runat="server" ID="lblTurno" class="lbl" />
                <br />
                <br />
                <asp:Label Text="Costo total" runat="server" class="lbl" Style="color: #ff0000;" />
                <br />
                <asp:Label Text="text" runat="server" ID="lblTotalCost" class="lbl" />
                <br />
                <br />
            </div>
            <div class="div-recipeDetail">
                <asp:Label Text="text" runat="server" ID="lblRecipe" class="lbl" />
            </div>
            <br />
            <div class="div-ingredients">
                <asp:Label Text="INGREDIENTES" runat="server" Style="font-size: 20px; margin: 20px; font-weight:bold;"/>
                <br />
                <br />
                <asp:GridView runat="server" ID="grdIngredients" DataKeyNames="in_ingredient" Style="width: 100%;"
                    AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333"
                    GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField HeaderText="Nombre" DataField="in_name" Visible="false" />
                        <asp:BoundField HeaderText="Unidad" DataField="UNIT" />
                        <asp:BoundField HeaderText="Fator" DataField="in_factor" />
                        <asp:BoundField HeaderText="Categoria" DataField="re_turn" />
                        <asp:BoundField HeaderText="origen" DataField="ORIGIN" />
                        <asp:BoundField HeaderText="Cantidad" DataField="ri_quantity" />
                        <asp:BoundField HeaderText="Osbervacion" DataField="ri_observation" />
                    </Columns>
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
            <asp:Button runat="server" ID="Edit" Text="Editar receta" class="btnEdit" OnClick="Edit_Click" />
            
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
</asp:Content>
