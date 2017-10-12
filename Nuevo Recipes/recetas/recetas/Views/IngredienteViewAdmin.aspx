<%@ Page Title="" Language="C#" MasterPageFile="~/Views/recetas.Master" AutoEventWireup="true" CodeBehind="IngredienteViewAdmin.aspx.cs" Inherits="recetas.Views.IngredienteViewAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="form-group">
            <h2>Buscar ingrediente</h2>
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
            <h3>Lista de Ingredientes</h3>
            <asp:GridView runat="server" DataKeyNames="in_ingredient" ID="grdRecetas" AutoGenerateColumns="False" AllowPaging="True"
                Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField HeaderText="Nº">
                        <ItemTemplate>
                            <asp:Label Text='<%#Bind("in_ingredient") %>' runat="server" ID="lblNumero" />
                        </ItemTemplate>
                        <ItemStyle Width="20px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Imagen" ItemStyle-Width="40px" ItemStyle-Height="40px">
                        <ItemTemplate>
                            <asp:Image ImageUrl='<%#Bind("in_image") %>' runat="server" ID="imgIngrediente" />
                        </ItemTemplate>

                        <ItemStyle Height="40px" Width="40px"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Codigo">
                        <ItemTemplate>
                            <asp:Label Text='<%#Bind("in_ingredient_id") %>' runat="server" ID="lblCodigo" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Nombre">
                        <ItemTemplate>
                            <asp:Label Text='<%#Bind("in_name") %>' runat="server" ID="lblname" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Unidad de medida">
                        <ItemTemplate>
                            <asp:Label Text='<%#Bind("in_unit") %>' runat="server" ID="lblUnidad" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Cantidad">
                        <ItemTemplate>
                            <asp:Label Text='<%#Bind("in_quantity") %>' runat="server" ID="lblCantidad" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                    <asp:TemplateField HeaderText="Costo">
                        <ItemTemplate>
                            <asp:Label Text='<%#Bind("in_cost") %>' runat="server" ID="lblCosto" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Factor">
                        <ItemTemplate>
                            <asp:Label Text='<%#Bind("in_factor") %>' runat="server" ID="lblFactor" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Categoria">
                        <ItemTemplate>
                            <asp:Label Text='<%#Bind("in_category") %>' runat="server" ID="lblCategoria" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Origen">
                        <ItemTemplate>
                            <asp:Label Text='<%#Bind("in_origin") %>' runat="server" ID="lblOrigen" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:HyperLink ID="hplSeleccioar0" CssClass="btn btn-link" runat="server" NavigateUrl='<%#"~/Views/NutrienteViewAdmin.aspx?recipeID=" + DataBinder.Eval(Container.DataItem, "in_ingredient")%>'>Nutrientes</asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:HyperLink ID="hplSeleccioar1" CssClass="btn btn-link" runat="server" NavigateUrl='<%#"~/Views/IngredienteEditAdmin.aspx?recipeID=" + DataBinder.Eval(Container.DataItem, "in_ingredient")%>'>Editar</asp:HyperLink>
                        </ItemTemplate>
                        <ItemStyle Width="30px" />
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkRemove" runat="server" CssClass="btn btn-danger"
                                CommandArgument='<%#Eval("in_ingredient")%>'
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
            <asp:HyperLink NavigateUrl="~/Views/IngredienteEditAdmin.aspx" Text="Nuevo ingrediente" runat="server" CssClass="btn btn-success"  />
        </div>
    </div>
</asp:Content>