<%@ Page Title="" Language="C#" MasterPageFile="~/Views/recipesHTT.Master" AutoEventWireup="true" CodeBehind="ContactAdmin.aspx.cs" Inherits="recipes.Views.ContactAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="about-us">
        <div style="width: 90%; height: auto; margin-left: auto; margin-right: auto;">            
            <h3 class="heading">Lista de<span> Consultas</span></h3>
            <hr />            
                <asp:Button type="button" ID="all" runat="server" class="btn btn-info btn-lg" Text="Ver Todos" OnClick="Unnamed_Click" />
            <asp:Button type="button" ID="Button1" runat="server" class="btn btn-info btn-lg" Text="Sin Responder" OnClick="Button1_Click" />
            <hr />
            <asp:GridView runat="server" ID="grdConsultas" DataKeyNames="co_consult" Width="100%"
                AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" CssClass="table table-bordered bs-table"
                GridLines="None" ShowFooter="False" OnRowCommand="grdConsultas_RowCommand">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField HeaderText="Fecha" DataField="co_date" />
                    <asp:BoundField HeaderText="Nombre" DataField="co_name" />
                    <asp:TemplateField>
                        <ItemTemplate>                            
                            <asp:HyperLink runat="server" NavigateUrl='<%# Bind("co_email", "mailto:{0}") %>'
                              Text='<%# Bind("co_email") %>'
                              ID="hlEmail"></asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Consulta">
                        <ItemTemplate>
                            <asp:label ID="consulta" runat="server" Text='<%# Bind("co_text") %>'></asp:label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Atendido">
                        <ItemTemplate>
                            <asp:CheckBox runat="server" ID="check" Checked='<%# Eval("co_is") %>' AutoPostBack="true" OnCheckedChanged="check_CheckedChanged" />
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
