<%@ Page Title="" Language="C#" MasterPageFile="~/Views/recipesHTT.Master" AutoEventWireup="true" CodeBehind="CustomRecipes.aspx.cs" Inherits="recipes.Views.CustomRecipes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width:80%; margin-left:auto;margin-right:auto;">
        <h2>Recetas personalizadas</h2>
        <asp:GridView runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" AllowPaging="True">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:TemplateField HeaderText="Fecha">
                <ItemTemplate>
                    <asp:Label ID="lblFecha" runat="server" Text='<%# Bind("") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Usuario">
                <ItemTemplate>
                    <asp:Label id="lblUsuario" runat="server" Text='<%# Bind("") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Receta">
                <ItemTemplate>
                    <asp:Label id="lblReceta" runat="server" Text='<%# Bind("") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Ingredientes">
                <ItemTemplate>
                    <asp:Label id="lblIngredientes" runat="server" Text='<%# Bind("") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Unidad de medida">
                <ItemTemplate>
                    <asp:Label id="lblUnidadMedida" runat="server" Text='<%# Bind("") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Cantidad">
                <ItemTemplate>
                    <asp:Label id="lblCantidad" runat="server"  Text='<%# Bind("") %>'/>
                </ItemTemplate>
            </asp:TemplateField>
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
</asp:Content>
