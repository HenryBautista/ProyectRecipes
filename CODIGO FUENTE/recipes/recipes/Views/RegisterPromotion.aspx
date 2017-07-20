<%@ Page Title="" Language="C#" MasterPageFile="~/Views/recipes.Master" AutoEventWireup="true" CodeBehind="RegisterPromotion.aspx.cs" Inherits="recipes.Views.RegisterPromotion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="contenido">
        <div class="div-title">
            <asp:Label Text="Registro de promociones" style="font-size:30px; font-weight:bold;" runat="server" />
        </div>
        <div class="div-registro">
             <table>
                <tr>
                    <td class="label">Nombre</td>
                    <td class="text">
                        <asp:TextBox class="detalle" ID="txtName" runat="server" placeholder="Nombre de la promoción"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="label">Titulo</td>
                    <td class="text">
                        <asp:TextBox CssClass="detalle" ID="txtTitle" placeholder="Titulo de la promoción" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="label">Detalles</td>
                    <td class="text">
                        <asp:TextBox CssClass="detalle multitext" ID="txtDetalles" TextMode="MultiLine" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="label">Imagen 1</td>
                    <td class="text">
                        <asp:FileUpload runat="server" ID="flpImage1" />
                    </td>
                </tr>
                <tr>
                    <td class="label">Imagen 2</td>
                    <td class="text">
                        <asp:FileUpload runat="server" ID="flpImage2" />
                    </td>
                </tr>
                 <tr>
                     <td class="text">
                         <asp:label CssClass="col-lg-2 label-danger control-label" runat="server" ID="lblmsg"></asp:label>
                     </td>
                 </tr>
            </table>
            <div class="btn">
                <button class="button" runat="server"  onclick="btn_createPromotion_Click">
                    <span>Crear promoción</span>
                </button>
            </div>
        </div>
        <div id="divPromotion">
            <asp:GridView ID="grdPromotion" runat="server" CssClass="table table-bordered bs-table" AutoGenerateColumns="false" EnablePersistedSelection="true"
                   DataKeyNames="pr_promotion" OnRowDataBound="grdPromotion_RowDataBound" OnRowCommand="grdPromotion_RowCommand">
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
                                <asp:Label ID="lblname" Text='<%# Bind("pr_title") %>' runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Detalles">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtdetail" Text='<%# Bind("pr_text1") %>' runat="server"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lbldetalles" Text='<%# Bind("pr_text1") %>' runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Imagen 1">
                            <EditItemTemplate>
                                <asp:FileUpload runat="server" ID="img1"/>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Image ID="img1" ImageUrl='<%# Bind("pr_image1") %>' runat="server" Width="80" Height="80"></asp:Image>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Imagen 2">
                            <EditItemTemplate>
                                <asp:FileUpload runat="server" ID="img2" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Image ID="img2" ImageUrl='<%# Bind("pr_image2") %>' runat="server" Width="80" Height ="80"></asp:Image>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Label id="lblmsg" runat="server" CssClass="col-lg-2 label-danger control-label"></asp:Label>
                                <asp:Button id="btn_edit" CommandName="edit_promotion" Text="Editar" runat="server" />
                                <asp:Button id="btn_update" CommandName="update_promotion" Text="Guardar" runat="server" Visible="true" />
                                <asp:Button id="btn_cancel" CommandName="cancel_promotion" Text="Cancelar" runat="server" Visible="true" />
                                <asp:Button id="btn_del" CommandName="delete_promotion" Text="Eliminar" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
</asp:Content>
