<%@ Page Title="" Language="C#" MasterPageFile="~/Views/recipesHTT.Master" AutoEventWireup="true" CodeBehind="ReportView.aspx.cs" Inherits="recipes.Views.ReportView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function PrintPanel() {
            var panel = document.getElementById("<%=pnlContents.ClientID %>");
            var printWindow = window.open('', '', 'height=1000,width=800');
            printWindow.document.write('<html><head><title>DIV Contents</title>');
            printWindow.document.write('</head><body >');
            printWindow.document.write(panel.innerHTML);
            printWindow.document.write('</body></html>');
            printWindow.document.close();
            setTimeout(function () {
                printWindow.print();
            }, 500);
            return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" style="margin-top:70px; width:70%;">
        <asp:Panel ID="pnlContents" runat="server" >
            <h3>Recetas Bolivia</h3>
            <hr style="border-top: dotted 2px;" />
            <p style="font-weight: bold;">Detalle de compra</p>
            <div class="row">
                <div class="col-md-6">
                    Fecha
                </div>
                <div class="col-md-6">
                    <asp:Label ID="lblFecha" runat="server" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    Usuario
                </div>
                <div class="col-md-6">
                    <asp:Label ID="lblusuario" runat="server" />
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
            <p style="font-weight: bold;">Lista de productos</p>
            <h3>Lista de ordenes <span>Recetas</span></h3>
            <asp:GridView runat="server" ID="grdRecetas" DataKeyNames="ro_recipe_order"
                 CssClass="table table-bordered bs-table" AutoGenerateColumns="false" Width="100%">
                <Columns>
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
                </Columns>
            </asp:GridView>
            <h3>Lista de ordenes
                <span>Ingredientes</span></h3>
                <asp:GridView ID="grdIngredients" runat="server" CssClass="table table-bordered bs-table"
                    AutoGenerateColumns="False" EnablePersistedSelection="True" 
                    DataKeyNames="ro_recipe_order" Style="width: 100%;">
                    <Columns>
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
                    </Columns>
                </asp:GridView>
        </asp:Panel>
        <br />
        <asp:Button ID="btnPrint" runat="server" Text="Imprimir" CssClass="btn btn-primary" OnClientClick="return PrintPanel();" />
        <asp:Label ID="user_id" Visible="false" runat="server"></asp:Label>
        <asp:Label ID="order_id" Visible="false" runat="server"></asp:Label>
    </div>
</asp:Content>
