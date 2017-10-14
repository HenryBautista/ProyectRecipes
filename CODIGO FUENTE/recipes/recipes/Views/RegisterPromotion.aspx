<%@ Page Title="" Language="C#" MasterPageFile="~/Views/recipesHTT.Master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeBehind="RegisterPromotion.aspx.cs" Inherits="recipes.Views.RegisterPromotion" %>
<%@ OutputCache Location="None" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="about-us">
        <div class="container">
            
        <div style="width: 90%; height: auto; margin-left: auto; margin-right: auto;">
            <h3>Lista de<span> Promociones</span></h3>
            <hr />
            <div>
                <button type="button" class="btn btn-success btn-lg" onclick="vaciar()" data-toggle="modal" data-target="#myModal2">
                    Promocion
                </button>
                <!-- Modal -->
                <div class="modal fade bottom" id="myModal2" tabindex="-1"  role="dialog" aria-labelledby="myModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <asp:TextBox ID="promotionID" runat="server" BorderStyle="None" ForeColor="White" />
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" runat="server" id="myModalLabel">Nuevo ingrediente</h4>
                            </div>
                            <div class="modal-body">
                                <asp:Label Text="Nombre" runat="server" />
                                <asp:TextBox ID="tbox_name" placeholder="Introducir nombre" runat="server" required="true" class="form-control"></asp:TextBox>

                                <asp:Label Text="Titulo" runat="server" />
                                <asp:TextBox ID="tbox_tittle" required="true" placeholder="Titulo de promocion" runat="server" class="form-control" />

                                <asp:Label Text="Detalles" runat="server" />
                                <asp:TextBox ID="tbox_detail" placeholder="Detalles de promocion" TextMode="MultiLine" runat="server" required="true" class="form-control" />
                                
                                <asp:Label Text="Imagen" runat="server" />
                                <asp:FileUpload ID="file_image" runat="server" class="txt-form" />
                                <br />
                                <label runat="server" id="lbl_msg" class="col-lg-2 label-danger control-label"></label>
                                <br />
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                                <asp:Button type="button" ID="btnSave" runat="server" class="btn btn-success" OnClick="btn_createPromotion_Click" data-toggle="modal" data-target="#myModal2" Text="Guardar"/>                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <asp:GridView runat="server" ID="grdPromotion" DataKeyNames="pr_promotion" Width="100%"
                AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333"
                GridLines="None" ShowFooter="False" OnRowCommand="grdPromotion_RowCommand">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField HeaderText="Imagen">
                        <ItemTemplate>
                            <asp:Image ID="img1" ImageUrl='<%# Bind("pr_image") %>' runat="server" Width="80" Height="80"></asp:Image>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="Nombre " DataField="pr_name" />
                    <asp:BoundField HeaderText="Titulo" DataField="pr_title" />
                    <asp:BoundField HeaderText="Detalles" DataField="pr_text" />
                    <asp:TemplateField>
                        <ItemTemplate>                            
                            <asp:Button ID="btn_edit" CommandName="edit_promotion" CommandArgument='<%# Container.DataItemIndex %>' Text="Editar" runat="server" OnClientClick="llenar()" />
                            <asp:Button ID="btn_del" CommandName="delete_promotion" CommandArgument='<%# Container.DataItemIndex %>' Text="Eliminar" runat="server" OnClientClick="llenar(); return confirm('¿Está seguro que desea eliminar el ingrediente ?');" />
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
         <script type="text/javascript">
             function openModal() {
                 $('#myModal2').modal('show');
             };
             function AlertError() {
                 alert("Algo salio mal!");
             };
             function llenar() {
                 $('#<%=tbox_name.ClientID%>').val('p');
                 $('#<%=tbox_tittle.ClientID%>').val('1');
                 $('#<%=tbox_detail.ClientID%>').val('1');
             };
             function vaciar() {
                 $('#<%=promotionID.ClientID%>').val('');
                 $('#<%=tbox_name.ClientID%>').val('');
                 $('#<%=tbox_tittle.ClientID%>').val('');
                 $('#<%=tbox_detail.ClientID%>').val(''); 
             };
        </script>
    </section>
</asp:Content>
