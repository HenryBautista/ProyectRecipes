<%@ Page Title="" Language="C#" MasterPageFile="~/Views/recipesHTT.Master" AutoEventWireup="true" CodeBehind="OrderList.aspx.cs" Inherits="recipes.Views.OrderList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="about-us">
        <div style="width: 90%; height: auto; margin-left: auto; margin-right: auto;">            
            <h3 class="heading">Lista de<span> Ordenes</span></h3>
            <hr />            
                <asp:Button type="button" ID="all" runat="server" class="btn btn-info btn-lg" Text="Ver Todos" OnClick="Unnamed_Click" />
                <asp:Button type="button" ID="Button1" runat="server" class="btn btn-info btn-lg" Text="Sin enviar" OnClick="Button1_Click" />
            <hr />
            <asp:GridView runat="server" ID="grdOrdenes" DataKeyNames="or_order" Width="100%"
                AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" CssClass="table table-bordered bs-table"
                GridLines="None" ShowFooter="False">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField HeaderText="Fecha" DataField="or_order_date" />
                    <asp:BoundField HeaderText="Nombre" DataField="us_name" />                    
                    <asp:BoundField HeaderText="Cantidad" DataField="or_total_price" />
                    <asp:TemplateField>
                        <ItemTemplate>                            
                            <asp:HyperLink runat="server" NavigateUrl='<%# Bind("or_order", "~/Views/ReportView.aspx?valor={0}") %>'
                              Text="Ver pedido"
                              ID="hlpedido"></asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Atendido">
                        <ItemTemplate>
                            <asp:CheckBox runat="server" ID="check" Checked='<%# Eval("or_ok") %>' AutoPostBack="true" OnCheckedChanged="check_CheckedChanged" />
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
    </section>
</asp:Content>
