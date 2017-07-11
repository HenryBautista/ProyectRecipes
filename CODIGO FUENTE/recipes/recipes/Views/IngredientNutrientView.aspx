<%@ Page Title="" Language="C#" MasterPageFile="~/Views/recipes.Master" AutoEventWireup="true" CodeBehind="IngredientNutrientView.aspx.cs" Inherits="recipes.Views.IngrdientNutrientView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="content">
        <div style="float: left; width: 30%; height: 30%;">
            <img src="../Images/RecipePhotos/macdonalds-japones-1.jpg" style="width: 100%; height: 100%;" />
        </div>
        <div style="float: left; width: 70%;" class="detail">
            <table>
                <tr>
                    <td class="label">Codigo:</td>
                    <td class="text">
                        <asp:Label class="detalle" ID="lbl_code" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="label">Nombre:</td>
                    <td class="text">
                        <asp:Label CssClass="detalle" ID="lbl_nombre" placeholder="Nombre ingrediente" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="label">Unidad de medida:</td>
                    <td class="text">
                        <asp:Label class="detalle" ID="lbl_unidad" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="label">Costo:</td>
                    <td class="text">
                        <asp:Label CssClass="detalle" ID="lbl_cost" placeholder="Costo ingrediente" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="label">Factor:</td>
                    <td class="text">
                        <asp:Label CssClass="detalle" ID="lbl_factor" placeholder="Factor" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="label">Categoria:</td>
                    <td class="text">
                        <asp:Label class="detalle" ID="lbl_cat" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="label">Origen:</td>
                    <td class="text">
                        <asp:Label class="detalle" ID="lbl_origin" runat="server"></asp:Label>
                    </td>
                </tr>

                <tr>
                    <td class="text">                        
                        <label runat="server" id="lbl_msg" class="col-lg-2 label-danger control-label"></label>
                    </td>
                </tr>                
                <tr>                    
                    <td>
                        <asp:Label ID="ingredient_id" Visible="false" runat="server"></asp:Label>
                    </td>
                    <td class="button"></td>
                    <td class="button"></td>
                </tr>
            </table>
        </div>
    </div>
    <div style="width: 80%; height: auto; margin-left: auto; margin-right: auto;">
        <h3>Lista de ingredientes</h3>
        <asp:GridView runat="server" ID="grdNutrients" DataKeyNames="in_ingredient_nutrient" 
            AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" 
            OnRowCommand="grdNutrients_RowCommand" OnRowDataBound="grdNutrients_RowDataBound" 
            ShowFooter="true">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                
                <asp:TemplateField HeaderText="Nutriente">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DDLnutrient" DataSource='<%#getNutrient()%>' SelectedValue='<%# Bind("nu_nutrient") %>' Enabled="True" DataValueField="nu_nutrient" DataTextField="nu_name" runat="server"></asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:DropDownList ID="DDLnut" DataSource='<%# getNutrient() %>' SelectedValue='<%# Bind("nu_nutrient")%>' Enabled="false" DataValueField="nu_nutrient" DataTextField="nu_name" runat="server">
                        </asp:DropDownList>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:DropDownList ID="DDLfooter" DataSource='<%# getNutrient() %>' DataValueField="nu_nutrient" DataTextField="nu_name" runat="server">
                        </asp:DropDownList>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Cantidad">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtQty" runat="server" Text='<%# Bind("in_quantity") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblQty" runat="server" Text='<%# Bind("in_quantity") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtfooter" runat="server"></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Label id="lblmsg" runat="server" CssClass="col-lg-2 label-danger control-label"></asp:Label>
                        <asp:Button id="btn_edit" CommandName="edit_nutrient" Text="Editar" runat="server" />
                        <asp:Button id="btn_update" CommandName="update_nutrient" Text="Guardar" runat="server" Visible="true" />
                        <asp:Button id="btn_cancel" CommandName="cancel_nutrient" Text="Cancelar" runat="server" Visible="true" />
                        <asp:Button id="btn_del" CommandName="delete_nutrient" Text="Eliminar" runat="server" />
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:Button id="add" CommandName="add" Text="Agregar" runat="server" />
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
