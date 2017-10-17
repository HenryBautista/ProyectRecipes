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
    <script type="text/javascript">
        function PrintPanel() {
            var panel = document.getElementById("<%=pnlContents.ClientID %>");
            var printWindow = window.open('', '', 'height=800,width=400');
            printWindow.document.write('<html><head><title>Detalle de pedido</title>');
            printWindow.document.write('</head><body >');
            printWindow.document.write(panel.innerHTML);
            printWindow.document.write('</body></html>');
            printWindow.document.close();
            setTimeout(function () {
                printWindow.print();
            }, 500);
            return false;
        };
        //$(document).ready(function () {
        //    $('.datepicker').pickadate({
        //        selectMonths: true, // Creates a dropdown to control month
        //        selectYears: 15, // Creates a dropdown of 15 years to control year,
        //        today: 'Hoy',
        //        clear: 'Limpiar',
        //        close: 'aceptar',
        //        closeOnSelect: false // Close upon selecting a date,
        //    });
        //});
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <section>
        <div class="container" style="margin: 10px; margin-top: 70px;">
            <%--            <div style="float: left; width: 30%; height: 30%;">
                <img src="../Images/RecipePhotos/comida.jpg" style="width: 100%; height: 100%;" />--%>
        </div>
        <div class="container">
            <div style="float: left; width: 100%;" class="detail">
                <div class="row">
                    <asp:Label Text="Fecha" runat="server" />
                    <div class='col-sm-6'>
                        <div class="form-group">
                            <div class='input-group date' id='datetimepicker1'>
                                <asp:Textbox type='text' id="txtFecha" runat="server" class="datepicker" />
                                <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-calendar"></span>
                                </span>
                            </div>
                        </div>
                    </div>
                    <asp:Label Text="" ID="lblabel" runat="server" />
                    <asp:Label Text="Cantidad" runat="server" />
                    <asp:Label class="txt-form" ID="lbl_cantidad" placeholder="Cantidad" runat="server"></asp:Label>

                    <asp:Label Text="Precio total" runat="server" />
                    <asp:Label class="txt-form" ID="lbl_cost" runat="server"></asp:Label>
                    <br />
                    <label runat="server" id="lbl_msg" class="col-lg-2 label-danger control-label"></label>
                    <br />
                    <asp:Button runat="server" Text="Comprar" ID="btn_cart" class="btn btn-primary" OnClick="btn_cart_Click" OnClientClick="return confirmation();" />
                    <asp:Button Text="Imprimir" ID="btnPrint" CssClass="btn btn-success" runat="server" OnClientClick="return PrintPanel();"/>

                    <%-- Area de impresion de reporte --%>
                    <asp:Panel ID="pnlContents" runat="server" visible="false">
                        <h3>Recetas Bolivia</h3>
                        <hr style="border-top: dotted 2px;" />
                        <p style="font-weight:bold;">Detalle de compra</p>
                        <div class="row">
                            <div class="col-md-6">
                                Usuario
                            </div>
                            <div class="col-md-6">
                                <asp:Label ID="Label1" runat="server" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                Cantidad
                            </div>
                            <div class="col-md-6">
                                <asp:Label ID="lblCantidad" runat="server" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                Precio total
                            </div>
                            <div class="col-md-6">
                                <asp:Label ID="lblTotal" runat="server" />
                            </div>
                        </div>
                        <hr style="border-top: dotted 2px;" />
                        <p style="font-weight:bold;">Lista de productos</p>
                        <asp:Repeater runat="server" ID="rptLista">
                            <ItemTemplate>
                                <div class="row">
                                    <div class="col-md-6">
                                        <asp:Label Text='<%#Bind("in_name") %>' ID="lblNombre" runat="server" />
                                        <asp:Label Text="text" runat="server" />
                                    </div>
                                    <div class="col-md-6">
                                        <asp:Label Text='<%#Bind("in_cost") %>' ID="lblCosto" runat="server" />
                                        <asp:Label Text="text" runat="server" />
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </asp:Panel>

                    <%-- --------------------------- --%>

                    <asp:Label ID="user_id" Visible="false" runat="server"></asp:Label>
                </div>
            </div>
            <div style="width: 80%; height: auto; margin-left: auto; margin-right: auto;">
                <h3>Lista de ordenes <span>Recetas</span></h3>
                <asp:GridView runat="server" ID="grdRecetas" DataKeyNames="ro_recipe_order"
                    AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None"
                    OnRowCommand="grdOrden_RowCommand" CssClass="table table-bordered bs-table" >
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
