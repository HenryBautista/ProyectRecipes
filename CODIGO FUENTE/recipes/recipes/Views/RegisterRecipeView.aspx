<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterRecipeView.aspx.cs" Inherits="recipes.Views.RegisterRecipeView" MasterPageFile="~/Views/recipesHTT.Master" %>


<asp:Content ID="head" ContentPlaceHolderID="head" runat="server">
    <%--<link href="../Content/bootstrap.min.css" rel="stylesheet"  type="text/css"/>--%>
<%--    <script src="../Scripts/jquery-1.9.1.min.js"></script>
    <script src="../Scripts/bootstrap.min.js" type="text/javascript"></script>--%>

</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="SM" runat="server">
    </asp:ScriptManager>

    <div class="container" style="padding-top:100px">
        <div class="div-formulario">
            <asp:Label Text="ID" runat="server" />
            <asp:TextBox ID="tbox_id" class="form-control" placeholder="Introducir ID" runat="server"></asp:TextBox>

            <asp:Label Text="Nombre" runat="server" />
            <asp:TextBox ID="tbox_name" runat="server" class="form-control" placeholder="Introducir el nombre de la receta"></asp:TextBox>

            <asp:Label Text="TURNO" runat="server" />
            <asp:DropDownList ID="ddl_turn" CssClass="form-control" runat="server" DataValueField="co_correlative" DataTextField="co_name"></asp:DropDownList>

            <asp:Label Text="Costo Total" runat="server" />
            <asp:TextBox ID="tbox_total" runat="server" TextMode="Number" step="0.01" min="0" class="form-control" placeholder="introducir el costo total"></asp:TextBox>

            <asp:Label Text="Imagen" runat="server" />
            <asp:FileUpload ID="file_image" runat="server" class="form-control" />

            <asp:Label Text="URL Video" runat="server" />
            <asp:TextBox ID="tbox_url" runat="server" class="form-control" Style="width: 100%; height: 60px;"></asp:TextBox>

            <asp:Label Text="Observacion" runat="server" />
            <asp:TextBox ID="tbox_Observation" runat="server" TextMode="MultiLine" class="form-control" Style="width: 100%; height: 60px;"></asp:TextBox>
                       
            <asp:Label Text="" ID="lblError" runat="server" class="error" />
            <label runat="server" id="lbl_message" class="error"></label>
            <br />
            <asp:Button ID="btn_add" runat="server" class="btn-form" Text="CREAR" OnClick="btn_add_Click" />
        </div>

        <div class="div-gridrecipes">
            <asp:GridView ID="grid_recipes" runat="server" CssClass="table table-bordered bs-table" AutoGenerateColumns="False" EnablePersistedSelection="True"
                DataKeyNames="re_recipe" OnRowDataBound="grd_Recipe_RowDataBound" OnRowCommand="grid_recipes_RowCommand" Style="width: 100%;" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField HeaderText="Imagen">
                        <EditItemTemplate>
                            <asp:FileUpload runat="server" ID="img1" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Image ID="img1" ImageUrl='<%# Bind("re_image") %>' runat="server" Width="80" Height="80"></asp:Image>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="URL">
                        <EditItemTemplate>
                            <asp:TextBox ID="txturl" runat="server" Text='<%# Bind("re_url_video") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblurl" runat="server" Text='<%# Bind("re_url_video") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Codigo">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtCodigo" runat="server" Text='<%# Bind("re_recipe_id") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblCodigo" runat="server" Text='<%# Bind("re_recipe_id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Nombre">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtNombre" runat="server" Text='<%# Bind("re_name") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("re_name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Turno">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DDLTurn" DataSource='<%# getData(2) %>' Enabled="True" DataValueField="co_correlative" DataTextField="co_name" runat="server"></asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:DropDownList ID="DDLTurn" DataSource='<%# getData(2) %>' SelectedValue='<%# Bind("re_turn")%>' Enabled="false" DataValueField="co_correlative" DataTextField="co_name" runat="server">
                            </asp:DropDownList>
                        </ItemTemplate>
                    </asp:TemplateField>                    
                    <asp:TemplateField HeaderText="Observacion">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtObs" runat="server" Text='<%# Bind("re_observation") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblObs" runat="server" Text='<%# Bind("re_observation") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Costo Total">
                        <EditItemTemplate>
                            <asp:Label ID="txtCosto" runat="server" Text='<%# Bind("re_total_cost") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblCosto" runat="server" Text='<%# Bind("re_total_cost") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Label ID="lblmsg" runat="server" CssClass="col-lg-2 label-danger control-label"></asp:Label>
                            <asp:Button ID="btn_edit" CommandName="edit_ingredient" Text="Editar" runat="server" />
                            <asp:Button ID="btn_update" CommandName="update_ingredient" Text="Guardar" runat="server" Visible="true" />
                            <asp:Button ID="btn_cancel" CommandName="cancel_ingredient" Text="Cancelar" runat="server" Visible="true" />
                            <asp:Button ID="btn_del" CommandName="delete_ingredient" Text="Eliminar" runat="server" OnClientClick=" return confirm('¿Está seguro que desea eliminar la receta?');" />
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

    <script>
    </script>
</asp:Content>

