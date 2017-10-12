<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BuyListView.aspx.cs" Inherits="recipes.Views.BuyListView" MasterPageFile="~/Views/recipes.Master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="Chapter7.1" Namespace="Chapter7" TagPrefix="cc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <h2>Planificación del pedido</h2>
    <div class="content">
        <div class="fecha">
            <table>
            <tr>
                <td class="column">
                    <asp:Label runat="server" Text="Fecha"/>
                </td>
                <td class="column">
                    <asp:TextBox ID="txtFecha" runat="server" />
                                <cc1:CalendarExtender ID="txtFecha_CalendarExtender" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="txtFecha">
                                </cc1:CalendarExtender>
                                <cc2:FocusExtender ID="FocusExtender2" runat="server" DefaultCssClass="AptFocusDefault" OnFocusCssClass="AptOnFocus" TargetControlID="txtFecha" />
                </td>
            </tr>
        </table>
        </div>
        <div class="pedidos">
            <asp:GridView runat="server" ID="grdPedidos" class="grdPedidos" ShowFooter="true" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField HeaderText="Fecha">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtFechaEdit" runat="server"></asp:TextBox>
                            <cc1:CalendarExtender ID="txtFechaedit_CalendarExtender" runat="server" Enabled="True" Format="dd/MM/yyyy" TargetControlID="txtFechaEdit">
                                </cc1:CalendarExtender>
                                <cc2:FocusExtender ID="FocusExtender3" runat="server" DefaultCssClass="AptFocusDefault" OnFocusCssClass="AptOnFocus" TargetControlID="txtFechaEdit" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="txtFechagrid" runat="server" Text="Label"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Turno">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtTurnoEdit" runat="server"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="txtTurno" runat="server" Text="Label"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Receta">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtRecetaEdit" runat="server"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="txtReceta" runat="server" Text="Label"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Persona">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtPersonaEdit" runat="server"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="txtPersona" runat="server" Text="Label"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Unidad de medida">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtUM_edit" runat="server"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="txtUM" runat="server" Text="Label"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Cantidad">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtCantidadEdit" runat="server"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="txtCantidad" runat="server" Text="Label"></asp:Label>
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
    </div>
</asp:Content>
