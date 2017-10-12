<%@ Page Title="" Language="C#" MasterPageFile="~/Views/recipesHTT.Master" AutoEventWireup="true" CodeBehind="RegisterPromotion.aspx.cs" Inherits="recipes.Views.RegisterPromotion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" style="padding-top: 100px">
        <div class="div-title">
            <asp:Label Text="Registro de promociones" Style="font-size: 30px; font-weight: bold;" runat="server" />
        </div>

        <%-- --------------------- --%>
        <div class="div-formulario">
            <div class="form-group">
                <asp:Label Text="Nombre" runat="server" />
                <asp:TextBox runat="server" ID="txtName" placeholder="Nombre de la promoción" class="form-control" />
            </div>
            <div class="form-group">
                <asp:Label Text="Titulo" runat="server" />
                <asp:TextBox runat="server" ID="txtTitle" placeholder="Titulo de la promocion" class="form-control" />
            </div>

            <div class="form-group">
                <asp:Label Text="Detalles" runat="server" />
                <asp:TextBox class="form-control" ID="txtDetalles" TextMode="MultiLine" runat="server" style="height:50px;"></asp:TextBox>
            </div>
            <asp:Label Text="Imagen 1" runat="server" />
            <br />
            <asp:FileUpload runat="server" ID="flpImage1" />
            <br />
            <%--<asp:Label Text="Imagen 2" runat="server" />
            <br />
            <asp:FileUpload runat="server" ID="flpImage2" />
            <br />--%>
            <asp:Label Text="" ID="lblError" runat="server" class="error" />
            <br />
            <asp:Button CssClass="btn-form" runat="server" OnClick="btn_createPromotion_Click" Text="Crear Promoción" />
            <%--<button class="btn-form" runat="server" Onclick="btn_createPromotion_Click">
                    <span>Crear promoción</span>
                </button>--%>
        </div>
        <%-- ---------------- --%>


        <br />
        <div id="divPromotion">
            <asp:GridView ID="grdPromotion" runat="server" CssClass="table table-bordered bs-table" AutoGenerateColumns="False" EnablePersistedSelection="True"
                DataKeyNames="pr_promotion" OnRowDataBound="grdPromotion_RowDataBound" OnRowCommand="grdPromotion_RowCommand" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField HeaderText="Nombre">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtname" Text='<%# Bind("pr_name") %>' runat="server"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblname" Text='<%# Bind("pr_name") %>' runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Titulo">
                        <EditItemTemplate>
                            <asp:TextBox ID="txttitle" Text='<%# Bind("pr_title") %>' runat="server"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lbltitle" Text='<%# Bind("pr_title") %>' runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Detalles">
                        <EditItemTemplate>
                            <asp:TextBox ID="txt1" Text='<%# Bind("pr_text1") %>' runat="server"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lbl1" Text='<%# Bind("pr_text1") %>' runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Imagen 1">
                        <EditItemTemplate>
                            <asp:FileUpload runat="server" ID="img1" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Image ID="img1" ImageUrl='<%# Bind("pr_image1") %>' runat="server" Width="80" Height="80"></asp:Image>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <%--<asp:TemplateField HeaderText="Imagen 2">
                        <EditItemTemplate>
                            <asp:FileUpload runat="server" ID="img2" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Image ID="img2" ImageUrl='<%# Bind("pr_image2") %>' runat="server" Width="80" Height="80"></asp:Image>
                        </ItemTemplate>
                    </asp:TemplateField>--%>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Label ID="lblmsg" runat="server" CssClass="col-lg-2 label-danger control-label"></asp:Label>
                            <asp:Button ID="btn_edit" CommandName="edit_promotion" Text="Editar" runat="server" />
                            <asp:Button ID="btn_update" CommandName="update_promotion" Text="Guardar" runat="server" Visible="true" />
                            <asp:Button ID="btn_cancel" CommandName="cancel_promotion" Text="Cancelar" runat="server" Visible="true" />
                            <asp:Button ID="btn_del" CommandName="delete_promotion" Text="Eliminar" runat="server" />
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
</asp:Content>
