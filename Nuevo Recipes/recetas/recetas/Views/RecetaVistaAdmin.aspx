<%@ Page Title="" Language="C#" MasterPageFile="~/Views/recetas.Master" AutoEventWireup="true" CodeBehind="RecetaVistaAdmin.aspx.cs" Inherits="recetas.Views.RecetaVistaAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="form-group">
            <h2>Buscar receta</h2>
            <div class="input-group">
                <asp:TextBox runat="server" ID="txtSearch" CssClass="form-control" placeholder="Buscar" />
                <div class="input-group-btn">
                    <button class="btn btn-default" type="submit">
                        <i class="glyphicon glyphicon-search"></i>
                    </button>
                </div>
            </div>
        </div>
        <div class="form-group">
            <h3>Lista de recetas</h3>
            <asp:GridView runat="server" DataKeyNames="re_recipe" ID="grdRecetas" AutoGenerateColumns="False" AllowPaging="True"
                Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField HeaderText="Nº">
                        <ItemTemplate>
                            <asp:Label Text='<%#Bind("re_recipe") %>' runat="server" ID="lblNumero" />
                        </ItemTemplate>
                        <ItemStyle Width="20px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Imagen" ItemStyle-Width="40px" ItemStyle-Height="40px">
                        <ItemTemplate>
                            <asp:Image ImageUrl='<%#Bind("re_image") %>' runat="server" ID="imgReceta" />
                        </ItemTemplate>

                        <ItemStyle Height="40px" Width="40px"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Codigo">
                        <ItemTemplate>
                            <asp:Label Text='<%#Bind("re_recipe_id") %>' runat="server" ID="lblCodigo" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Nombre">
                        <ItemTemplate>
                            <asp:Label Text='<%#Bind("re_name") %>' runat="server" ID="lblname" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Turno">
                        <ItemTemplate>
                            <asp:Label Text='<%#Bind("re_turn") %>' runat="server" ID="lblTurno" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Video" ItemStyle-Wrap="true">
                        <ItemTemplate>
                            <asp:HyperLink NavigateUrl='<%#Bind("re_url_video") %>' Text='<%#Bind("re_url_video") %>' style="text-decoration:underline;" runat="server" ID="lnkVideo" />
                        </ItemTemplate>
                        <ItemStyle Width="50px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Costo">
                        <ItemTemplate>
                            <asp:Label Text='<%#Bind("re_total_cost") %>' runat="server" ID="lblCosto" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Observación">
                        <ItemTemplate>
                            <asp:Label Text='<%#Bind("re_observation") %>' runat="server" ID="lblObs" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:HyperLink ID="hplSeleccioar0" CssClass="btn btn-link" runat="server" NavigateUrl='<%#"~/Views/IngredienteViewAdmin.aspx?recipeID=" + DataBinder.Eval(Container.DataItem, "re_recipe")%>'>Ingredientes</asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:HyperLink ID="hplSeleccioar0" CssClass="btn btn-link" runat="server" NavigateUrl='<%#"~/Views/RecetaEditAdmin.aspx?recipeID=" + DataBinder.Eval(Container.DataItem, "re_recipe")%>'>Editar</asp:HyperLink>
                        </ItemTemplate>
                        <ItemStyle Width="30px" />
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkRemove" runat="server" CssClass="btn btn-danger"
                                CommandArgument='<%# Eval("re_recipe")%>'
                                OnClientClick="return confirm('Esta seguro que desea eliminar?')"
                                Text="Eliminar" OnClick="lnkRemove_Click"></asp:LinkButton>
                        </ItemTemplate>
                        <ItemStyle Width="30px" />
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
        <div class="form-group">
            <asp:HyperLink NavigateUrl="~/Views/RecetaEditAdmin.aspx" Text="Nueva receta" runat="server" CssClass="btn btn-success" Style="width: 150px;" />
        </div>
    </div>
</asp:Content>
