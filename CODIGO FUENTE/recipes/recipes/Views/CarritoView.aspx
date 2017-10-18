<%@ Page Title="" Language="C#" MasterPageFile="~/Views/recipesHTT.Master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeBehind="CarritoView.aspx.cs" Inherits="recipes.Views.CarritoView" %>

<%@ OutputCache Location="None" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .button-cart:hover {
            cursor: pointer;
        }
    </style>
    <script>
        function confirmation() {
            return confirm("Esta seguro que desea realizar el pedido?");
        }
    </script>

    <link href="../Assets/datepicker/css/datepicker.css" rel="stylesheet" />
    <script src="../Assets/datepicker/js/bootstrap-datepicker.js"></script>
    <script>
        $(function () {
            $('.datepicker').datepicker({
                format: 'yyyy/mm/dd'});
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <section>
        <div class="container" style="margin: 10px; margin-top: 70px;">
        </div>
        <div class="container" style="margin-left:10%">
            <div style="float: left; width: 80%;" class="detail">
                <div class="contaier">
                    <div class='row'>
                        <div class="form-group col-md-4">
                            <asp:Label Text="Fecha" runat="server" />
                            <div class='input-group date' id='datetimepicker1'>
                                <asp:TextBox type='text' ID="txtFecha" runat="server" required="true" class="datepicker form-control" placeholder="Fecha" />
                                <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-calendar"></span>
                                </span>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            Cantidad
                        </div>
                        <div class="col-md-4">
                            <asp:Label ID="lblCantidad" runat="server" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            Precio total
                        </div>
                        <div class="col-md-4">
                            <asp:Label ID="lblTotal" runat="server" />
                        </div>
                    </div>
                    <hr />
                    <div class="row">
                        <asp:Button runat="server" Text="Comprar" ID="btn_cart" class="btn btn-primary" OnClick="btn_cart_Click" OnClientClick="return confirmation();" />
                        <asp:Button runat="server" Text="Reporte de compra" ID="reporte" class="btn btn-primary" OnClick="btnPrint_Click" />

                    </div>
                    <div class="row">
                        <label runat="server" id="lbl_msg" class="col-lg-2 label-danger control-label"></label>
                    </div>
                </div>
                <br />
                <asp:Label ID="user_id" Visible="false" runat="server"></asp:Label>
                <asp:Label ID="order_id" Visible="false" runat="server"></asp:Label>
            </div>
        </div>
        <div style="width: 80%; height: auto; margin-left: auto; margin-right: auto;">
            <h3>Lista de ordenes <span>Recetas</span></h3>
            <asp:GridView runat="server" ID="grdRecetas" DataKeyNames="ro_recipe_order"
                AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None"
                OnRowCommand="grdOrden_RowCommand" CssClass="table table-bordered bs-table">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:ImageField HeaderText="IMAGEN" DataImageUrlField="re_image" ControlStyle-Width="80">
                        <ControlStyle Width="80px"></ControlStyle>
                    </asp:ImageField>
                    <asp:TemplateField HeaderText="Receta">
                        <EditItemTemplate>
                            <asp:Label ID="lblRecipe" runat="server" Text='<%# Bind("RECIPE") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblRecipe" runat="server" Text='<%# Bind("RECIPE") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Turno">
                        <EditItemTemplate>
                            <asp:Label ID="lblTurno" runat="server" Text='<%# Bind("TURNO") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblTurno" runat="server" Text='<%# Bind("TURNO") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Cantidad">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtQty" runat="server" Text='<%# Bind("ro_quantity") %>' type="numeric" required="true"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblQty" runat="server" Text='<%# Bind("ro_quantity") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Precio Unidad">
                        <EditItemTemplate>
                            <asp:Label ID="lblunidad" runat="server" Text='<%# Bind("re_total_cost") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblPunidad" runat="server" Text='<%# Bind("re_total_cost") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Precio total">
                        <EditItemTemplate>
                            <asp:Label ID="lblprice" runat="server" Text='<%# Bind("ro_price") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblprice" runat="server" Text='<%# Bind("ro_price") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Persona">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DDLPerson" DataSource='<%# getPerson() %>' SelectedValue='<%# Bind("ro_person")%>' Enabled="True" DataValueField="pe_person" DataTextField="pe_name" runat="server">
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:DropDownList ID="DDLPer" DataSource='<%# getPerson() %>' SelectedValue='<%# Bind("ro_person")%>' Enabled="false" DataValueField="pe_person" DataTextField="pe_name" runat="server">
                            </asp:DropDownList>
                            <asp:Label ID="lblmsg" runat="server" CssClass="col-lg-2 label-danger control-label"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="btn_edit" CommandName="edit_recipe" CommandArgument='<%# Container.DataItemIndex %>' Text="Editar" runat="server" />
                            <asp:Button ID="btn_del" CommandName="delete_recipe" CommandArgument='<%# Container.DataItemIndex %>' Text="Eliminar" runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Label ID="lblmsg" runat="server" CssClass="col-lg-2 label-danger control-label"></asp:Label>
                            <asp:Button ID="btn_update" CommandName="update_recipe" CommandArgument='<%# Container.DataItemIndex %>' Text="Guardar" runat="server" />
                            <asp:Button ID="btn_cancel" CommandName="cancel_recipe" CommandArgument='<%# Container.DataItemIndex %>' Text="Cancelar" runat="server" />
                        </EditItemTemplate>
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
            <h3>Lista de ordenes
                <span>Ingredientes</span></h3>
            <asp:GridView ID="grdIngredients" runat="server" CssClass="table table-bordered bs-table"
                AutoGenerateColumns="False" EnablePersistedSelection="True" OnRowCommand="grdIngredients_RowCommand"
                DataKeyNames="ro_recipe_order" Style="width: 100%;" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:ImageField HeaderText="IMAGEN" DataImageUrlField="in_image" ControlStyle-Width="80">
                        <ControlStyle Width="80px"></ControlStyle>
                    </asp:ImageField>
                    <asp:TemplateField HeaderText="Ingrediente">
                        <EditItemTemplate>
                            <asp:Label ID="lblRecipe" runat="server" Text='<%# Bind("INGREDIENT") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblRecipe" runat="server" Text='<%# Bind("INGREDIENT") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Unidad">
                        <EditItemTemplate>
                            <asp:Label ID="lblTurno" runat="server" Text='<%# Bind("UNIT") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblTurno" runat="server" Text='<%# Bind("UNIT") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Cantidad">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtQty" runat="server" Text='<%# Bind("ro_quantity") %>' type="numeric" required="true"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblQty" runat="server" Text='<%# Bind("ro_quantity") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Precio Unidad">
                        <EditItemTemplate>
                            <asp:Label ID="lblunidad" runat="server" Text='<%# Bind("re_total_cost") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblPunidad" runat="server" Text='<%# Bind("re_total_cost") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Precio total">
                        <EditItemTemplate>
                            <asp:Label ID="lblprice" runat="server" Text='<%# Bind("ro_price") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblprice" runat="server" Text='<%# Bind("ro_price") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Persona">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DDLPerson" DataSource='<%# getPerson() %>' SelectedValue='<%# Bind("ro_person")%>' Enabled="True" DataValueField="pe_person" DataTextField="pe_name" runat="server">
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:DropDownList ID="DDLPer" DataSource='<%# getPerson() %>' SelectedValue='<%# Bind("ro_person")%>' Enabled="false" DataValueField="pe_person" DataTextField="pe_name" runat="server">
                            </asp:DropDownList>
                            <asp:Label ID="lblmsg" runat="server" CssClass="col-lg-2 label-danger control-label"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="btn_edit" CommandName="edit_ingredient" CommandArgument='<%# Container.DataItemIndex %>' Text="Editar" runat="server" />
                            <asp:Button ID="btn_del" CommandName="delete_ingredient" CommandArgument='<%# Container.DataItemIndex %>' Text="Eliminar" runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Label ID="lblmsg" runat="server" CssClass="col-lg-2 label-danger control-label"></asp:Label>
                            <asp:Button ID="btn_update" CommandName="update_ingredient" CommandArgument='<%# Container.DataItemIndex %>' Text="Guardar" runat="server" />
                            <asp:Button ID="btn_cancel" CommandName="cancel_ingredient" CommandArgument='<%# Container.DataItemIndex %>' Text="Cancelar" runat="server" />
                        </EditItemTemplate>
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

    </section>
    <div hidden="hidden">
        <h1>Parece que aun no has seleccionado productos </h1>
    </div>
</asp:Content>
