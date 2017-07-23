<%@ Page Title="" Language="C#" MasterPageFile="~/Views/recipes.Master" AutoEventWireup="true" CodeBehind="RegisterNutrient.aspx.cs" Inherits="recipes.Views.RegisterNutrient" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width: 80%; height: auto; margin-left: auto; margin-right: auto;">
        <h3>Lista de Nutrientes</h3>
        <asp:GridView runat="server" ID="grdNutrients" DataKeyNames="nu_nutrient" 
            AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" 
            OnRowCommand="grdNutrients_RowCommand" OnRowDataBound="grdNutrients_RowDataBound"
            ShowFooter="true">
            <AlternatingRowStyle BackColor="White" />
            <Columns>                
                <asp:TemplateField HeaderText="Cantidad">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtQty" runat="server" Text='<%# Bind("nu_name") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblQty" runat="server" Text='<%# Bind("nu_name") %>'></asp:Label>
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