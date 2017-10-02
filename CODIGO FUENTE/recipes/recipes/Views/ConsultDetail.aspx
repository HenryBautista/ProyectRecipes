<%@ Page Title="" Language="C#" MasterPageFile="~/Views/recipesHTT.Master" AutoEventWireup="true" CodeBehind="ConsultDetail.aspx.cs" Inherits="recipes.Views.ConsultDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" style="width: 80%; margin-left: auto; margin-right: auto;margin-top:70px;">
        <h2>Detalle de consultas</h2>
        <br />
        <asp:GridView runat="server" ID="grdConsultas" Width="100%" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" DataKeyNames="co_consult" AllowPaging="True">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:TemplateField HeaderText="Nº" ItemStyle-Width="20px">
                    <ItemTemplate>
                        <asp:Label Text='<%#Bind("co_consult") %>' ID="lblNumero" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Fecha">
                    <ItemTemplate>
                        <asp:Label Text='<%#Bind("co_date") %>' ID="lblfecha" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Nombre">
                    <ItemTemplate>
                        <asp:Label Text='<%#Bind("co_name") %>' ID="lblNombre" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Email">
                    <ItemTemplate>
                        <asp:HyperLink NavigateUrl='<%# Bind("co_email", "mailto:{0}") %>' runat="server" Text='<%#Bind("co_email") %>' ID="lblEmail"></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Consulta" ItemStyle-Width="250px">
                    <ItemTemplate>
                        <asp:Label Text='<%#Bind("co_text") %>' id="lblConsulta" runat="server"/>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Atendido">
                    <ItemTemplate>
                        <asp:CheckBox id="chkAtendido" Checked='<%#Eval("co_is") %>' runat="server" />
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
</asp:Content>
