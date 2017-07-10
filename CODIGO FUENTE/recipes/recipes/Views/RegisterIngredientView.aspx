<%@ Page Title="" Language="C#" MasterPageFile="~/Views/recipes.Master" AutoEventWireup="true" CodeBehind="RegisterIngredientView.aspx.cs" Inherits="recipes.Views.RegisterIngredientView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="SM" runat="server">
    </asp:ScriptManager>
    <%-- Script para desplegar el subgrid----------- --%>
    
    <script type="text/javascript">
        $("[src*=plus]").live("click", function () {
            $(this).closest("tr").after("<tr><td></td><td colspan = '999'>" + $(this).next().html() + "</td></tr>")
            $(this).attr("src", "../Images/minus1600.png");
        });
        $("[src*=minus]").live("click", function () {
            $(this).attr("src", "../Images/plus1600.png");
            $(this).closest("tr").next().remove();
        });
    </script>
    <div class="content">
        <div style="float: left; width: 30%; height: 30%;">
            <img src="../Images/RecipePhotos/macdonalds-japones-1.jpg" style="width: 100%; height: 100%;" />
        </div>
        <div style="float: left; width: 70%;" class="detail">
            <table>
                <tr>
                    <td class="label">Codigo:</td>
                    <td class="text">
                        <asp:TextBox class="detalle" ID="tbox_code" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="label">Nombre:</td>
                    <td class="text">
                        <asp:TextBox CssClass="detalle" ID="tbox_name" placeholder="Nombre ingrediente" runat="server"></asp:TextBox>
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
                        <asp:TextBox CssClass="detalle" ID="tbox_price" placeholder="Costo ingrediente" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="label">Factor:</td>
                    <td class="text">
                        <asp:TextBox CssClass="detalle" ID="tbox_factor" placeholder="Factor" runat="server" />
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

                <tr>
                    <td class="text">
                        <asp:Label CssClass="detalle" ID="Lblmsg" runat="server" />
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <td class="button">
                        <asp:Button ID="btn_crear" runat="server" CssClass="btn btn-success" Text="Crear ingrediente" OnClick="btn_crear_Click" />
                    </td>
                    <td class="button"></td>
                    <td class="button"></td>
                    <td class="button"></td>
                </tr>
            </table>
        </div>
    </div>
    <div>

        <asp:GridView ID="grdNutrientesopt" runat="server" Width="550px"
            AutoGenerateColumns="false" Font-Names="Arial"
            Font-Size="11pt" AlternatingRowStyle-BackColor="#C2D69B"
            HeaderStyle-BackColor="green" AllowPaging="true" ShowFooter="true"
            OnPageIndexChanging="OnPaging"
            PageSize="10" OnRowCancelingEdit="grd_RowCancelingEdit" OnRowEditing="grd_RowEditing" OnRowUpdating="grd_RowUpdating">
            <Columns>
                <asp:TemplateField ItemStyle-Width="30px" HeaderText="Numero">
                    <ItemTemplate>
                        <asp:Label ID="lblNumero" runat="server" Text='<%# Eval("nu_nutrient")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ItemStyle-Width="30px" HeaderText="nombre">
                    <ItemTemplate>
                        <asp:Label Text='<%# Eval("nu_name")%>' runat="server" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtNombreEdit" runat="server" Text='<%# Eval("nu_name")%>'></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="deleteProduct" runat="server"
                            CommandArgument='<%# Eval("nu_nutrient")%>'
                            OnClientClick="return confirm('Do you want to delete?')"
                            Text="Delete" OnClick="deleteProduct_Click"></asp:LinkButton>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Click" />
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowEditButton="True" />
            </Columns>
            <AlternatingRowStyle BackColor="#C2D69B" />
        </asp:GridView>
    </div>
    <div style="width: 80%; height: auto; margin-left: auto; margin-right: auto;">
        <h3>Lista de ingredientes</h3>
        <asp:GridView runat="server" ID="grdIngredientes" DataKeyNames="in_ingredient" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowDataBound="grdIngredientes_RowDataBound">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <%--COMIENZO DEL SUBGRID DE NUTRIENTES----------------------------------%>
                <asp:TemplateField>
                    <ItemTemplate>
                        <img src="../Images/plus1600.png" style="width: 20px; height: 20px; cursor: pointer;" alt="Alternate Text" />
                        <asp:Panel runat="server" ID="pnlNutrientes" Style="display: none">
                            <asp:UpdatePanel runat="server" ID="updatePanel">
                                <ContentTemplate>
                                    <asp:GridView ID="grdNutrientes" runat="server" Width="550px"
                                        AutoGenerateColumns="false" Font-Names="Arial"
                                        Font-Size="11pt" AlternatingRowStyle-BackColor="#C2D69B"
                                        HeaderStyle-BackColor="green" AllowPaging="true" ShowFooter="true"
                                        OnPageIndexChanging="OnPaging"
                                        PageSize="10" OnRowCancelingEdit="grd_RowCancelingEdit" OnRowEditing="grd_RowEditing" OnRowUpdating="grd_RowUpdating">
                                        <Columns>
                                            <asp:TemplateField ItemStyle-Width="30px" HeaderText="Numero">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblNumero" runat="server" Text='<%# Eval("nu_nutrient")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField ItemStyle-Width="30px" HeaderText="nombre">
                                                <ItemTemplate>
                                                    <asp:Label Text='<%# Eval("nu_name")%>' runat="server" />
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtNombreEdit" runat="server" Text='<%# Eval("nu_name")%>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <FooterTemplate>
                                                    <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="deleteProduct" runat="server"
                                                        CommandArgument='<%# Eval("nu_nutrient")%>'
                                                        OnClientClick="return confirm('Do you want to delete?')"
                                                        Text="Delete" OnClick="deleteProduct_Click"></asp:LinkButton>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Click" />
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                            <asp:CommandField ShowEditButton="True" />
                                        </Columns>
                                        <AlternatingRowStyle BackColor="#C2D69B" />
                                    </asp:GridView>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="grdNutrientes" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </asp:Panel>
                    </ItemTemplate>
                </asp:TemplateField>
                <%--FIN DEL SUBGRID DE INGREDIENTES-------------------------------------------------------------------------------------------%>
                <asp:TemplateField HeaderText="Codigo">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtCodigo" runat="server" Text='<%# Bind("in_ingredient_id") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblCodigo" runat="server" Text='<%# Bind("in_ingredient_id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Nombre">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtNombre" runat="server" Text='<%# Bind("in_name") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("in_name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Unidad de medida">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DDLUnidadMedida" DataSource='<%# getData(2) %>' SelectedValue='<%# Bind("in_unit")%>' Enabled="True" DataValueField="co_correlative" DataTextField="co_name" runat="server"></asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:DropDownList ID="DDLunidad" DataSource='<%# getData(2) %>' SelectedValue='<%# Bind("in_unit")%>' Enabled="false" DataValueField="co_correlative" DataTextField="co_name" runat="server">
                        </asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Costo">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtCosto" runat="server" Text='<%# Bind("in_cost") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblCosto" runat="server" Text='<%# Bind("in_cost") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Factor">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtFactor" runat="server" Text='<%# Bind("in_factor") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblFactor" runat="server" Text='<%# Bind("in_factor") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Categoria">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DDLCategory" DataSource='<%# getData(3) %>' SelectedValue='<%# Bind("in_unit")%>' Enabled="True" DataValueField="co_correlative" DataTextField="co_name" runat="server"></asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:DropDownList ID="DDLCat" DataSource='<%# getData(3) %>' SelectedValue='<%# Bind("in_unit")%>' Enabled="false" DataValueField="co_correlative" DataTextField="co_name" runat="server"></asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Origen">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DDLOrigin" DataSource='<%# getData(4) %>' SelectedValue='<%# Bind("in_unit")%>' Enabled="True" DataValueField="co_correlative" DataTextField="co_name" runat="server"></asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:DropDownList ID="DDLor" DataSource='<%# getData(4) %>' SelectedValue='<%# Bind("in_unit")%>' Enabled="false" DataValueField="co_correlative" DataTextField="co_name" runat="server"></asp:DropDownList>
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
