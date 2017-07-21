<%@ Page Title="" Language="C#" MasterPageFile="~/Views/recipes.Master" AutoEventWireup="true" CodeBehind="EditRecipeView.aspx.cs" Inherits="recipes.Views.EditRecipeView" %>
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
            <asp:GridView runat="server" ID="grdIngredientes" DataKeyNames="ri_recipe_ingredient" 
            AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" 
            GridLines="None" ShowFooter="true" 
            OnRowCommand="grdIngredientes_RowCommand" OnRowDataBound="grdIngredientes_RowDataBound">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:TemplateField HeaderText="Nombre">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DDLingredient" DataSource='<%# getIng() %>' SelectedValue='<%# Bind("in_ingredient") %>' Enabled="False" DataValueField="in_ingredient" DataTextField="in_name" runat="server"></asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("in_name") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:DropDownList ID="DDLingredient" DataSource='<%# getIng() %>' Enabled="true" DataValueField="in_ingredient" DataTextField="in_name" runat="server"></asp:DropDownList>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField ItemStyle-Width="30px" HeaderText="Cantidad">
                    <ItemTemplate>
                        <asp:Label Text='<%# Eval("ri_quantity")%>' runat="server" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox Text='<%# Eval("ri_quantity")%>' ID="txtQty" runat="server" />
                    </EditItemTemplate>
                    <FooterTemplate>                        
                        <asp:TextBox ID="txtQty" runat="server" />
                    </FooterTemplate>
                </asp:TemplateField>                
                <asp:TemplateField HeaderText="Observacion">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtObs" runat="server" Text='<%# Bind("ri_observation") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblObs" runat="server" Text='<%# Bind("ri_observation") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtObs" runat="server" ></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Unidad de medida">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DDLUnidadMedida" DataSource='<%# getData(2) %>' SelectedValue='<%# Bind("in_unit")%>' Enabled="False" DataValueField="co_correlative" DataTextField="co_name" runat="server"></asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:DropDownList ID="DDLunidad" DataSource='<%# getData(2) %>' SelectedValue='<%# Bind("in_unit")%>' Enabled="false" DataValueField="co_correlative" DataTextField="co_name" runat="server">
                        </asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>
                <%--<asp:TemplateField HeaderText="Costo">
                    <EditItemTemplate>
                        <asp:label ID="txtCosto" runat="server" Text='<%# Bind("in_cost") %>'></asp:label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblCosto" runat="server" Text='<%# Bind("in_cost") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Factor">
                    <EditItemTemplate>
                        <asp:label ID="txtFactor" runat="server" Text='<%# Bind("in_factor") %>'></asp:label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblFactor" runat="server" Text='<%# Bind("in_factor") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Categoria">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DDLCategory" DataSource='<%# getData(3) %>' SelectedValue='<%# Bind("in_category")%>' Enabled="false" DataValueField="co_correlative" DataTextField="co_name" runat="server"></asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:DropDownList ID="DDLCat" DataSource='<%# getData(3) %>' SelectedValue='<%# Bind("in_category")%>' Enabled="false" DataValueField="co_correlative" DataTextField="co_name" runat="server"></asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>--%>
                <asp:TemplateField HeaderText="Origen">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DDLOrigin" DataSource='<%# getData(4) %>' SelectedValue='<%# Bind("in_origin")%>' Enabled="false" DataValueField="co_correlative" DataTextField="co_name" runat="server"></asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:DropDownList ID="DDLor" DataSource='<%# getData(4) %>' SelectedValue='<%# Bind("in_origin")%>' Enabled="false" DataValueField="co_correlative" DataTextField="co_name" runat="server"></asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Label id="lblmsg" runat="server" CssClass="col-lg-2 label-danger control-label"></asp:Label>
                        <asp:Button id="btn_edit" CommandName="edit_ingredient" Text="Editar" runat="server" />
                        <asp:Button id="btn_del" CommandName="delete_ingredient" Text="Eliminar" runat="server" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:Label id="lblmsg" runat="server" CssClass="col-lg-2 label-danger control-label"></asp:Label>
                        <asp:Button id="btn_update" CommandName="update_ingredient" Text="Guardar" runat="server" />
                        <asp:Button id="btn_cancel" CommandName="cancel_ingredient" Text="Cancelar" runat="server" />
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:Label id="lblmsg" runat="server" CssClass="col-lg-2 label-danger control-label"></asp:Label>                        
                        <asp:Button id="btn_add" CommandName="add_ingredient" Text="Agregar" runat="server" />
                    </FooterTemplate>
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
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
</asp:Content>
