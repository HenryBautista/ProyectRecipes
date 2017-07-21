﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/recipes.Master" AutoEventWireup="true" CodeBehind="CarritoView.aspx.cs" Inherits="recipes.Views.CarritoView" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="Chapter7.1" Namespace="Chapter7" TagPrefix="cc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .button-cart:hover{
            cursor:pointer;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="container">
            <div style="float: left; width: 30%; height: 30%;">
                <img src="../Images/RecipePhotos/comida.jpg" style="width: 100%; height: 100%;" />
            </div>
            <div style="float: left; width: 70%;" class="detail">
                <div class="div-formulario">
                    <asp:Label Text="Fecha" runat="server" />
                    <asp:TextBox ID="txtFecha" runat="server" class="txt-form" />
                    <cc1:CalendarExtender ID="txtFecha_CalendarExtender" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="txtFecha">
                    </cc1:CalendarExtender>
                    <cc2:FocusExtender ID="FocusExtender2" runat="server" DefaultCssClass="AptFocusDefault" OnFocusCssClass="AptOnFocus" TargetControlID="txtFecha" />

                    <asp:Label Text="Cantidad" runat="server" />
                    <asp:Label class="txt-form" ID="lbl_cantidad" placeholder="Cantidad" runat="server"></asp:Label>

                    <asp:Label Text="Precio total" runat="server" />
                    <asp:Label class="txt-form" ID="lbl_cost" runat="server"></asp:Label>
                    <br />
                    <label runat="server" id="lbl_msg" class="col-lg-2 label-danger control-label"></label>
                    <br />
                    <asp:Button runat="server" Text="Comprar" ID="btn_cart" class="btn-form" />
                    <asp:Label ID="user_id" Visible="false" runat="server"></asp:Label>
                </div>
            </div>
            <div style="width: 80%; height: auto; margin-left: auto; margin-right: auto;">
                <h3>Lista de ordenes</h3>
                <asp:GridView runat="server" ID="grdOrden" DataKeyNames="ro_recipe_order"
                    AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None"
                    OnRowCommand="grdOrden_RowCommand" OnRowDataBound="grdOrden_RowDataBound">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField HeaderText="Receta">
                            <EditItemTemplate>
                                <asp:Label ID="lblRecipe" runat="server" Text='<%# Bind("RECETA") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblRecipe" runat="server" Text='<%# Bind("RECETA") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Turno">
                            <EditItemTemplate>
                                <asp:Label ID="lblTurno" runat="server" Text='<%# Bind("TURNO") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblTurno" runat="server" Text='<%# Bind("TURNO") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Cantidad">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtQty" runat="server" Text='<%# Bind("ro_quantity") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblQty" runat="server" Text='<%# Bind("ro_quantity") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Precio Unidad">
                            <EditItemTemplate>
                                <asp:Label ID="lblunidad" runat="server" Text='<%# Bind("re_total_cost") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblPunidad" runat="server" Text='<%# Bind("re_total_cost") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Persona">
                            <EditItemTemplate>
                                <asp:DropDownList ID="DDLPerson" DataSource='<%# getPerson() %>' SelectedValue='<%# Bind("ro_person")%>' Enabled="True" DataValueField="pe_person" DataTextField="pe_name" runat="server">
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:DropDownList ID="DDLPer" DataSource='<%# getPerson() %>' SelectedValue='<%# Bind("ro_person")%>' Enabled="false" DataValueField="pe_person" DataTextField="pe_name" runat="server">
                                </asp:DropDownList>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Label ID="lblmsg" runat="server" CssClass="col-lg-2 label-danger control-label"></asp:Label>
                                <asp:Button ID="btn_edit" CommandName="edit_nutrient" Text="Editar" runat="server" />
                                <asp:Button ID="btn_update" CommandName="update_nutrient" Text="Guardar" runat="server" Visible="true" />
                                <asp:Button ID="btn_cancel" CommandName="cancel_nutrient" Text="Cancelar" runat="server" Visible="true" />
                                <asp:Button ID="btn_del" CommandName="delete_nutrient" Text="Eliminar" runat="server" />
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
        <div hidden="hidden">
            <h1>Parece que aun no has seleccionado productos </h1>
        </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
</asp:Content>
