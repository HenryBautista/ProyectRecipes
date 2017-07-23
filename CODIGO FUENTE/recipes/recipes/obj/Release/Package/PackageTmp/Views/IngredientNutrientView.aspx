<%@ Page Title="" Language="C#" MasterPageFile="~/Views/recipes.Master" AutoEventWireup="true" CodeBehind="IngredientNutrientView.aspx.cs" Inherits="recipes.Views.IngrdientNutrientView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <div class="div-locked" >
            <div class="div-formulario" style="width:80%;" >
                <asp:Label Text="Codigo" runat="server" />
                <asp:Label class="txt-form locked" ID="lbl_code" runat="server"></asp:Label>

                <asp:Label Text="Nombre" runat="server" />
                <asp:Label class="txt-form locked" ID="lbl_nombre" placeholder="Nombre ingrediente" runat="server"></asp:Label>

                <asp:Label Text="Unidad de medida" runat="server" />
                <asp:Label class="txt-form locked" ID="lbl_unidad" runat="server"></asp:Label>

                <asp:Label Text="Costo" runat="server" />
                <asp:Label class="txt-form locked" ID="lbl_cost" placeholder="Costo ingrediente" runat="server" />

                <asp:Label Text="Factor" runat="server" />
                <asp:Label class="txt-form locked" ID="lbl_factor" placeholder="Factor" runat="server" />

                <asp:Label Text="Categoria" runat="server" />
                <asp:Label class="txt-form locked" ID="lbl_cat" runat="server"></asp:Label>

                <asp:Label Text="Origen" runat="server" />
                <asp:Label class="txt-form locked" ID="lbl_origin" runat="server"></asp:Label>
                <br />
                <label runat="server" id="lbl_msg" class="col-lg-2 label-danger control-label"></label>
                <br />
                <asp:Label ID="ingredient_id" Visible="false" runat="server"></asp:Label>
            </div>
        </div>
        <div class="div-editLocked">
            <div style="width: 100%; height: auto; margin-left: auto; margin-right: auto;">
                <h3>Lista de nutrientes</h3>
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
                                <asp:Label ID="lblmsg" runat="server" CssClass="col-lg-2 label-danger control-label"></asp:Label>
                                <asp:Button ID="btn_edit" CommandName="edit_nutrient" Text="Editar" runat="server" />
                                <asp:Button ID="btn_update" CommandName="update_nutrient" Text="Guardar" runat="server" Visible="true" />
                                <asp:Button ID="btn_cancel" CommandName="cancel_nutrient" Text="Cancelar" runat="server" Visible="true" />
                                <asp:Button ID="btn_del" CommandName="delete_nutrient" Text="Eliminar" runat="server"  OnClientClick=" return confirm('¿Está seguro que desea eliminar el nutriente ?');"/>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:Button ID="add" CommandName="add" Text="Agregar" runat="server" />
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
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
</asp:Content>
