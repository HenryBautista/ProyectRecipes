<%@ Page Title="" Language="C#" MaintainScrollPositionOnPostback="true" MasterPageFile="~/Views/recipesHTT.Master" AutoEventWireup="true" CodeBehind="RegisterRecipe.aspx.cs" Inherits="recipes.Views.RegisterRecipe" %>
<%@ OutputCache Location="None" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <section id="about-us">
        <div style="width: 90%; height: auto; margin-left: auto; margin-right: auto;">
            <h3 class="heading">Lista de<span> Recetas</span></h3>
            <hr />
            <div>
                <button type="button" class="btn btn-success btn-lg" onclick="vaciar()" data-toggle="modal" data-target="#myModal2">
                    Nueva Receta
                </button>
                <!-- Modal -->
                <div class="modal fade bottom" id="myModal2" tabindex="-1"  role="dialog" aria-labelledby="myModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <asp:TextBox ID="RecipeID" runat="server" BorderStyle="None" ForeColor="White" />
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" runat="server" id="myModalLabel"> Receta</h4>
                            </div>
                            <div class="modal-body">
                                <asp:Label Text="Codigo" runat="server" />
                                <asp:TextBox ID="tbox_id" runat="server" required="true" placeholder="Introducir codigo" class="form-control"></asp:TextBox>

                                <asp:Label Text="Nombre" runat="server" />
                                <asp:TextBox ID="tbox_name" placeholder="Introducir nombre" runat="server" required="true" class="form-control"></asp:TextBox>

                                <asp:Label Text="URL video" runat="server" />
                                <asp:TextBox ID="tbox_url" required="true" placeholder="Url del video" runat="server" class="form-control" />
                                
                                <asp:Label Text="Observacion" runat="server" />
                                <asp:TextBox ID="tbox_Observation" runat="server" required="true" TextMode="MultiLine" class="form-control" Style="width: 100%; height: 60px;"></asp:TextBox>
             
                                <asp:Label Text="Turno" runat="server" />
                                <asp:DropDownList ID="DDL_unit" CssClass="form-control" required="true" DataValueField="co_correlative" DataTextField="co_name" runat="server"></asp:DropDownList>
                                                                
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
            <asp:GridView runat="server" ID="grdRecipes" DataKeyNames="re_recipe" Width="100%"
                AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333"
                GridLines="None" ShowFooter="False" OnRowCommand="grdIngredients_RowCommand">
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
                    <asp:BoundField HeaderText="Codigo" DataField="re_recipe_id" />
                    <asp:BoundField HeaderText="Nombre" DataField="re_name" />
                    <asp:BoundField HeaderText="Turno" DataField="TURNO" />
                    <asp:BoundField HeaderText="Observacion" DataField="re_observation" ItemStyle-Wrap="true" />
                    <asp:BoundField HeaderText="Costo" DataField="re_total_cost" />
                    <asp:BoundField HeaderText="URL video" DataField="re_url_video" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:HyperLink ID="hplSeleccioar1" CssClass="btn btn-link" runat="server" NavigateUrl='<%#"~/Views/RecipeIngredientView.aspx?valor=" + DataBinder.Eval(Container.DataItem, "re_recipe")%>'>Ingredientes</asp:HyperLink>
                            <asp:Button ID="btn_edit" CommandName="edit_recipe" CommandArgument='<%# Container.DataItemIndex %>' Text="Editar" runat="server" OnClientClick="llenar()" />
                            <asp:Button ID="btn_del" CommandName="delete_recipe" CommandArgument='<%# Container.DataItemIndex %>' Text="Eliminar" runat="server" OnClientClick="llenar(); return confirm('¿Está seguro que desea eliminar la receta ?');" />
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
                 $('#<%=tbox_id.ClientID%>').val('p');
                 $('#<%=tbox_name.ClientID%>').val('p');
                 $('#<%=tbox_url.ClientID%>').val('p');
                 $('#<%=tbox_Observation.ClientID%>').val('p');
             };
             function vaciar() {
                 $('#<%=RecipeID.ClientID%>').val('');
                 $('#<%=tbox_id.ClientID%>').val('');
                 $('#<%=tbox_name.ClientID%>').val('');
                 $('#<%=tbox_url.ClientID%>').val('');
                 $('#<%=tbox_Observation.ClientID%>').val('');
                 $('#<%=lbl_msg.ClientID%>').empty();
             };
        </script>
    </section>
</asp:Content>
