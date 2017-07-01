<<<<<<< HEAD:CODIGO FUENTE/recipes/recipes/Views/RegisterIngredient.aspx
﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/recipes.Master" AutoEventWireup="true" CodeBehind="RegisterIngredient.aspx.cs" Inherits="recipes.Views.RegisterIngredient" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="SM" runat="server">

    </asp:ScriptManager>
    <div class="content">
        <div style="float:left; width:30%; height:30%;" >
                <img src="../Images/RecipePhotos/macdonalds-japones-1.jpg" style="width:100%; height:100%;"/>
            </div>
        <div style="float:left; width:70%;" class="detail">
                <table>
                    <tr>
                        <td class="label">Codigo:</td>
                        <td class="text">
                            <!-- -->
                            <asp:TextBox class="detalle" ID="tbox_code" runat="server" ></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="label">Nombre:</td>
                        <td class="text">
                            <asp:TextBox  CssClass="detalle" ID="tbox_name" placeholder="Costo ingrediente" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="label">Unidad de medida:</td>
                        <td class="text">
                            <asp:Datalist CssClass="form-control" id="dlist_unit" placeholder="Unidad medida" runat="server"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="label">Costo:</td>
                        <td class="text">
                            <asp:TextBox Cssclass="detalle" id="tbox_price" placeholder="Costo ingrediente" runat="server"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="label">Factor:</td>
                        <td class="text">
                            <asp:TextBox  Cssclass="detalle" id="tbox_factor" placeholder="Factor" runat="server"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="label">Categoria:</td>
                        <td class="text">
                            <asp:TextBox Cssclass="detalle" id="tbox_category" placeholder="Categoria del ingrediente" runat="server"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="label">Origen:</td>
                        <td class="text">
                            <asp:TextBox Cssclass="detalle" id="tbox_origin" placeholder="Origen del ingrediente " runat="server"/>
                        </td>
                    </tr>
                </table>
                <table>
                    <tr>
                        <td class="button">
                            <asp:Button id="btn_crear" runat="server" CssClass="btn btn-success" Text="Crear ingrediente" OnClick="btn_crear_Click"/>
                        </td>
                        <td class="button">
                            
                        </td>
                        <td class="button"></td>
                        <td class="button"></td>
                    </tr>
                </table>
            </div>
    </div>
    <div style="width:80%; height:auto;margin-left:auto;margin-right:auto;">
        <h3>Lista de ingredientes</h3>
            <asp:GridView runat="server" ID="grdIngredientes" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField HeaderText="Codigo">
                        <ItemTemplate>
                            <asp:Label ID="lblCodigo" runat="server" Text="Label"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Nombre">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblNombre" runat="server" Text="Label"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Unidad de medida">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtUnidadMedida" runat="server"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblUnidadMedida" runat="server" Text="Label"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Costo">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtCosto" runat="server"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblCosto" runat="server" Text="Label"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Factor">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtFactor" runat="server"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblFactor" runat="server" Text="Label"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Categoria">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtCategoria" runat="server"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblCategoria" runat="server" Text="Label"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Origen">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtOrigen" runat="server"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblOrigen" runat="server" Text="Label"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:ButtonField ButtonType="Button" CommandName="Edit" Text="Editar" />
                    <asp:ButtonField ButtonType="Button" CommandName="Delete" Text="Borrar" />
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
=======
﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/recipes.Master" AutoEventWireup="true" CodeBehind="RegisterIngredientView.aspx.cs" Inherits="recipes.Views.RegisterIngredient" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="SM" runat="server">

    </asp:ScriptManager>
    <div class="content">
        <div style="float:left; width:30%; height:30%;" >
                <img src="../Images/RecipePhotos/macdonalds-japones-1.jpg" style="width:100%; height:100%;"/>
            </div>
            <div style="float:left; width:70%;" class="detail">
                <table>
                    <tr>
                        <td class="label">Codigo:</td>
                        <td class="text">
                            <asp:TextBox class="detalle" ID="tbox_code" runat="server" ></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="label">Nombre:</td>
                        <td class="text">
                            <asp:TextBox  CssClass="detalle" ID="tbox_name" placeholder="Nombre ingrediente" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="label">Unidad de medida:</td>
                        <td class="text">
                            <asp:DropDownList ID="DDL_unit" CssClass="form-control" DataValueField="co_correlative" DataTextField="co_name" runat="server"></asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="label">Costo:</td>
                        <td class="text">
                            <asp:TextBox Cssclass="detalle" id="tbox_price" placeholder="Costo ingrediente" runat="server"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="label">Factor:</td>
                        <td class="text">
                            <asp:TextBox  Cssclass="detalle" id="tbox_factor" placeholder="Factor" runat="server"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="label">Categoria:</td>
                        <td class="text">
                            <asp:DropDownList ID="DDL_category" CssClass="form-control" DataValueField="co_correlative" DataTextField="co_name" runat="server"></asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="label">Origen:</td>
                        <td class="text">
                            <asp:DropDownList ID="DDL_origin" CssClass="form-control" DataValueField="co_correlative" DataTextField="co_name" runat="server"></asp:DropDownList>
                        </td>
                    </tr>
                </table>
                <table>
                    <tr>
                        <td class="button">
                            <asp:Button id="btn_crear" runat="server" CssClass="btn btn-success" Text="Crear ingrediente" OnClick="btn_crear_Click"/>
                        </td>
                        <td class="button">
                            
                        </td>
                        <td class="button"></td>
                        <td class="button"></td>
                    </tr>
                </table>
            </div>
        
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
</asp:Content>
>>>>>>> 5394f80834781063521dc0376add5150b35b8c3d:CODIGO FUENTE/recipes/recipes/Views/RegisterIngredientView.aspx
