<%@ Page Title="" Language="C#" MasterPageFile="~/Views/recipesHTT.Master" AutoEventWireup="true" CodeBehind="RegisterIngredientView.aspx.cs" Inherits="recipes.Views.RegisterIngredientView" %>

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
    <%-- --------------------------------------------------- --%>
    <div class="container" Style="margin-top:80px;">

        <div style="margin-left: auto; margin-right: auto; width: 70%;" class="detail">
        </div>
        <div class="div-formulario">
            <asp:Label Text="Codigo" runat="server" />
            <asp:TextBox ID="tbox_code" runat="server" required="required" placeholder="Introducir codigo" class="form-control"></asp:TextBox>

            <asp:Label Text="Nombre" runat="server" />
            <asp:TextBox ID="tbox_name" placeholder="Introducir nombre" runat="server" required="required" class="form-control"></asp:TextBox>

            <asp:Label Text="Unidad de medida" runat="server" />
            <asp:DropDownList ID="DDL_unit" CssClass="form-control" DataValueField="co_correlative" DataTextField="co_name" runat="server"></asp:DropDownList>

            <asp:Label Text="Costo" runat="server" />
            <asp:TextBox ID="tbox_price" type="numeric" required="required" placeholder="Costo ingrediente" runat="server" class="form-control" />
            
            <asp:Label Text="Cantidad" runat="server" />
            <asp:TextBox ID="tbox_qty" placeholder="Cantidad de ingrediente" runat="server" required="required" class="form-control" />

            <br />
            <asp:Label Text="Categoria" runat="server" />
            <asp:DropDownList ID="DDL_category" CssClass="form-control" DataValueField="co_correlative" DataTextField="co_name" runat="server"></asp:DropDownList>

            <asp:Label Text="Origen" runat="server" />
            <asp:DropDownList ID="DDL_origin" CssClass="form-control" DataValueField="co_correlative" DataTextField="co_name" runat="server"></asp:DropDownList>

            
            <asp:Label Text="Imagen" runat="server" />
            <asp:FileUpload ID="file_image" runat="server" class="txt-form" />
            <br />
            <label runat="server" id="lbl_msg" class="col-lg-2 label-danger control-label"></label>
            <br />
            <asp:Button ID="btn_crear" runat="server" Style="width: auto;" class="btn-form" Text="Crear ingrediente" OnClick="btn_crear_Click" />
        </div>
        <div style="width: 100%; height: auto; margin-left: auto; margin-right: auto;">
            <h3>Lista de ingredientes</h3>
            <asp:GridView runat="server" ID="grdIngredientes" DataKeyNames="in_ingredient" Width="100%"
                AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333"
                GridLines="None" ShowFooter="False"
                OnRowCommand="grdIngredientes_RowCommand"
                OnRowDataBound="grdIngredientes_RowDataBound">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <%--COMIENZO DEL SUBGRID DE NUTRIENTES----------------------------------%>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <img src="../Images/plus1600.png" style="width: 20px; height: 20px; cursor: pointer;" alt="Alternate Text" />
                            <asp:Panel runat="server" ID="pnlNutrientes" Style="display: none">
                                <asp:UpdatePanel runat="server" ID="updatePanel">
                                    <ContentTemplate>
                                        <asp:Button ID="BtnEdit" CommandName="edit_nutrient" Text="Editar Nutrientes" runat="server" />
                                        <asp:GridView ID="grdNutrientes" runat="server" Width="550px"
                                            AutoGenerateColumns="false" Font-Names="Arial"
                                            Font-Size="11pt" AlternatingRowStyle-BackColor="#C2D69B"
                                            HeaderStyle-BackColor="green" AllowPaging="true"
                                            ShowFooter="False" OnPageIndexChanging="OnPaging"
                                            PageSize="10">
                                            <Columns>
                                                <asp:TemplateField ItemStyle-Width="30px" HeaderText="Nutriente">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblNumero" runat="server" Text='<%# Eval("nu_name")%>'></asp:Label>
                                                        <%--Hebert sos groso--%>
                                                        <%--<asp:Label ID="lblNro" runat="server" Text='<%# Eval("nGrid") %>'></asp:Label>--%>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <asp:DropDownList ID="DDL_nutrient" CssClass="form-control" DataSource='<%#getNutrients() %>' DataValueField="nu_nutrient" DataTextField="nu_name" runat="server"></asp:DropDownList>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblNumero" runat="server" Text='<%# Eval("nu_name")%>'></asp:Label>
                                                        <%--<asp:Label ID="lblNro" runat="server" Text='<%# Eval("nGrid") %>' Visible="false"></asp:Label>--%>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:DropDownList ID="DDL_Nnutrient" CssClass="form-control" DataSource='<%#getNutrients() %>' DataValueField="nu_nutrient" DataTextField="nu_name" runat="server"></asp:DropDownList>
                                                    </FooterTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField ItemStyle-Width="30px" HeaderText="Cantidad">
                                                    <ItemTemplate>
                                                        <asp:Label Text='<%# Eval("in_quantity")%>' runat="server" />
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:TextBox ID="txtFqty" runat="server"></asp:TextBox>|
                                                    </FooterTemplate>
                                                </asp:TemplateField>
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
                    
                    
                    <asp:TemplateField HeaderText="Imagen">
                        <EditItemTemplate>
                            <asp:FileUpload runat="server" ID="img1" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Image ID="img1" ImageUrl='<%# Bind("in_image") %>' runat="server" Width="80" Height="80"></asp:Image>
                        </ItemTemplate>
                    </asp:TemplateField>
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
                            <asp:DropDownList ID="DDLUnidadMedida" DataSource='<%# getData(2) %>' Enabled="True" DataValueField="co_correlative" DataTextField="co_name" runat="server"></asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:DropDownList ID="DDLunidad" DataSource='<%# getData(2) %>' SelectedValue='<%# Bind("in_unit")%>' Enabled="false" DataValueField="co_correlative" DataTextField="co_name" runat="server">
                            </asp:DropDownList>
                        </ItemTemplate>
                    </asp:TemplateField>                    
                    <asp:TemplateField HeaderText="Cantidad">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtqty" runat="server" Text='<%# Bind("in_quantity") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblqty" runat="server" Text='<%# Bind("in_quantity") %>'></asp:Label>
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
                            <asp:label ID="txtFactor" runat="server" Text='<%# Bind("in_factor") %>'></asp:label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblFactor" runat="server" Text='<%# Bind("in_factor") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Categoria">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DDLCategory" DataSource='<%# getData(3) %>' SelectedValue='<%# Bind("in_category")%>' Enabled="True" DataValueField="co_correlative" DataTextField="co_name" runat="server"></asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:DropDownList ID="DDLCat" DataSource='<%# getData(3) %>' SelectedValue='<%# Bind("in_category")%>' Enabled="false" DataValueField="co_correlative" DataTextField="co_name" runat="server"></asp:DropDownList>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Origen">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DDLOrigin" DataSource='<%# getData(4) %>' SelectedValue='<%# Bind("in_origin")%>' Enabled="True" DataValueField="co_correlative" DataTextField="co_name" runat="server"></asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:DropDownList ID="DDLor" DataSource='<%# getData(4) %>' SelectedValue='<%# Bind("in_origin")%>' Enabled="false" DataValueField="co_correlative" DataTextField="co_name" runat="server"></asp:DropDownList>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Label ID="lblmsg" runat="server" CssClass="col-lg-2 label-danger control-label"></asp:Label>
                            <asp:Button ID="btn_edit" CommandName="edit_ingredient" Text="Editar" runat="server" />
                            <asp:Button ID="btn_update" CommandName="update_ingredient" Text="Guardar" runat="server" Visible="true" />
                            <asp:Button ID="btn_cancel" CommandName="cancel_ingredient" Text="Cancelar" runat="server" Visible="true" />
                            <asp:Button ID="btn_del" CommandName="delete_ingredient" Text="Eliminar" runat="server" OnClientClick=" return confirm('¿Está seguro que desea eliminar el ingrediente ?');" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <%--<asp:ButtonField ButtonType="Button" CommandName="Edit" Text="Editar"/>                
                <asp:ButtonField ButtonType="Button" CommandName="Update" Text="Guardar"/>
                <asp:ButtonField ButtonType="Button" CommandName="Cancel" Text="Calcelar"/>
                <asp:ButtonField ButtonType="Button" CommandName="Delete" Text="Borrar" />--%>
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
