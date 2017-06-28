<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SuggestedRecipesView.aspx.cs" Inherits="recipes.Views.SuggestedRecipesView" MasterPageFile="~/Views/recipes.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <style type="text/css">
    .photo {
        margin-bottom: 0px;
    }
</style>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Recetas Sugeridas</h2>
    <div class="content">
        <div class="recipe">
            <div class="photo">
                <asp:Image class="photo" runat="server" id="imgRecipe" ImageUrl="~/Images/RecipePhotos/macdonalds-japones-1.jpg"/>
            </div>
            <br />

            <div class="detail">
                <table>
                    <tr>
                        <td class="label">Codigo:</td>
                        <td class="text">
                            <!-- -->
                            <asp:TextBox runat="server" ID="txtCodigo" class="detalle lblCodigo" Text="3-E001-00001"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="label">Receta:</td>
                        <td class="text">
                            <asp:TextBox runat="server" ID="txtReceta" class="detalle txtReceta" text="Pollo al tocino"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="label">Cantidad:</td>
                        <td class="text">
                            <asp:TextBox runat="server" ID="txtCantidad" class="detalle txtCantidad" />
                        </td>
                    </tr>
                    <tr>
                        <td class="label">Unidad de medida:</td>
                        <td class="text">
                            <asp:DropDownList runat="server" ID="ddlUnidadMedida" class="detalle ddl ddlUnidadMedida">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="label">Turno:</td>
                        <td class="text">
                            <asp:DropDownList runat="server" ID="ddlTurno" class="detalle ddl ddlTurno">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="label">Observaciones:</td>
                        <td class="text">
                            <asp:TextBox runat="server" ID="txtObervaciones" class="detalle txtObervaciones" TextMode="MultiLine" />
                        </td>
                    </tr>
                </table>
                <table>
                    <tr>
                        <td class="button">
                            <asp:Button runat="server" ID="btnMenu" class="btn btnMenu" Text="Menu"/>
                        </td>
                        <td class="button">
                            <asp:Button runat="server" ID="btnIngredientes" class="btn btnIngredientes" Text="Menu Ingredientes"/>
                        </td>
                        <td class="button"></td>
                        <td class="button"></td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="ingredients">
            <asp:GridView runat="server" ID="grdIngredientes" class="grdIngredientes" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField HeaderText="Ingrediente">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Cantidad">
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Fact.">
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Total">
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
                        </ItemTemplate>
                        <ControlStyle BackColor="#CACDD0" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Observaciones">
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>
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
    </div>
</asp:Content>
