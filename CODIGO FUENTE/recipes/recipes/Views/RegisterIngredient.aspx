<%@ Page Title="" Language="C#" MasterPageFile="~/Views/recipesHTT.Master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeBehind="RegisterIngredient.aspx.cs" Inherits="recipes.Views.IngredientListView" %>
<%@ OutputCache Location="None" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="SM" runat="server">
    </asp:ScriptManager>
    <section id="about-us">
        <div style="width: 90%; height: auto; margin-left: auto; margin-right: auto;">
            <h3 class="heading">Lista de<span> Ingredientes</span></h3>
            <hr />
            <div>
                <button type="button" class="btn btn-success btn-lg" onclick="vaciar()" data-toggle="modal" data-target="#myModal2">
                    Nuevo Ingrediente
                </button>

                <!-- Modal -->
                <div class="modal fade bottom" id="myModal2" tabindex="-1"  role="dialog" aria-labelledby="myModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <asp:TextBox ID="ingredientID" runat="server" BorderStyle="None" ForeColor="White" />
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" runat="server" id="myModalLabel">Nuevo ingrediente</h4>
                            </div>
                            <div class="modal-body">
                                <asp:Label Text="Codigo" runat="server" />
                                <asp:TextBox ID="tbox_code" runat="server" required="true" placeholder="Introducir codigo" class="form-control"></asp:TextBox>

                                <asp:Label Text="Nombre" runat="server" />
                                <asp:TextBox ID="tbox_name" placeholder="Introducir nombre" runat="server" required="true" class="form-control"></asp:TextBox>

                                <asp:Label Text="Costo" runat="server" />
                                <asp:TextBox ID="tbox_price" type="number" step="0.01" required="true" placeholder="Costo ingrediente" runat="server" class="form-control" />

                                <asp:Label Text="Cantidad" runat="server" />
                                <asp:TextBox ID="tbox_qty" type="number" placeholder="Cantidad de ingrediente" runat="server" required="true" class="form-control" />
                                
                                <asp:Label Text="Unidad de medida" runat="server" />
                                <asp:DropDownList ID="DDL_unit" CssClass="form-control" required="true" DataValueField="co_correlative" DataTextField="co_name" runat="server"></asp:DropDownList>

                                <asp:Label Text="Categoria" runat="server" />
                                <asp:DropDownList ID="DDL_category" CssClass="form-control" required="true" DataValueField="co_correlative" DataTextField="co_name" runat="server"></asp:DropDownList>

                                <asp:Label Text="Origen" runat="server" />
                                <asp:DropDownList ID="DDL_origin" CssClass="form-control" required="true" DataValueField="co_correlative" DataTextField="co_name" runat="server"></asp:DropDownList>
                                
                                <asp:Label Text="Imagen" runat="server" />
                                <asp:FileUpload ID="file_image" runat="server" class="txt-form" />
                                <br />
                                <label runat="server" id="lbl_msg" class="col-lg-2 label-danger control-label"></label>
                                <br />
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                                <asp:Button type="button" ID="btnSave" runat="server" class="btn btn-success" OnClick="Save_Click" data-toggle="modal" data-target="#myModal2" Text="Guardar"/>                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <asp:GridView runat="server" ID="grdIngredients" DataKeyNames="in_ingredient" Width="100%"
                AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333"
                GridLines="None" ShowFooter="False" OnRowCommand="grdIngredients_RowCommand">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField HeaderText="Imagen">
                        <EditItemTemplate>
                            <asp:FileUpload runat="server" ID="img1" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Image ID="img1" ImageUrl='<%# Bind("in_image") %>' runat="server" Width="80" Height="80"></asp:Image>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="Codigo" DataField="in_ingredient_id" />
                    <asp:BoundField HeaderText="Nombre" DataField="in_name" />
                    <asp:BoundField HeaderText="Unidad de medida" DataField="UNIT" />
                    <asp:BoundField HeaderText="Cantidad" DataField="in_quantity" />
                    <asp:BoundField HeaderText="Costo" DataField="in_cost" />
                    <asp:BoundField HeaderText="Factor" DataField="in_factor" />
                    <asp:BoundField HeaderText="Categoria" DataField="CATEGORY" />
                    <asp:BoundField HeaderText="Origen" DataField="ORIGIN" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:HyperLink ID="hplSeleccioar1" CssClass="btn btn-link" runat="server" NavigateUrl='<%#"~/Views/IngredientNutrientView.aspx?valor=" + DataBinder.Eval(Container.DataItem, "in_ingredient")%>'>Nutrientes</asp:HyperLink>
                            <asp:Button ID="btn_edit" CommandName="edit_ingredient" CommandArgument='<%# Container.DataItemIndex %>' Text="Editar" runat="server" OnClientClick="llenar()" />
                            <asp:Button ID="btn_del" CommandName="delete_ingredient" CommandArgument='<%# Container.DataItemIndex %>' Text="Eliminar" runat="server" OnClientClick="llenar(); return confirm('¿Está seguro que desea eliminar el ingrediente ?');" />
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
         <script type="text/javascript">
             function openModal() {
                 $('#myModal2').modal('show');
             };
             function AlertError() {
                 alert("Algo salio mal!");
             };
             function llenar() {
                 $('#<%=tbox_code.ClientID%>').val('p');
                 $('#<%=tbox_name.ClientID%>').val('p');
                 $('#<%=tbox_price.ClientID%>').val('1');
                 $('#<%=tbox_qty.ClientID%>').val('1');
             };
             function vaciar() {
                 $('#<%=ingredientID.ClientID%>').val('');
                 $('#<%=tbox_code.ClientID%>').val('');
                 $('#<%=tbox_name.ClientID%>').val('');
                 $('#<%=tbox_price.ClientID%>').val('');
                 $('#<%=tbox_qty.ClientID%>').val('');
             };
        </script>
    </section>
</asp:Content>
