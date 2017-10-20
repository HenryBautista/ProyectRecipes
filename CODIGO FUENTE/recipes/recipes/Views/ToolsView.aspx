<%@ Page Title="" Language="C#" MasterPageFile="~/Views/recipesHTT.Master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeBehind="ToolsView.aspx.cs" Inherits="recipes.Views.ToolsView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="about-us">
        <div style="width: 70%; height: auto; margin-left: auto; margin-right: auto;">
            <h3 class="heading">Lista de <span>Turnos</span></h3>
            <asp:GridView runat="server" ID="grdTurnos" DataKeyNames="co_correlative"
                AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" Width="100%"
                GridLines="None" ShowFooter="true" OnRowCommand="grdTurnos_RowCommand">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField HeaderText="Nombre">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtname" required="true" runat="server" Text='<%# Bind("co_name") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblname" runat="server" Text='<%# Bind("co_name") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtfooter" runat="server" CssClass="form-control"></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>
                    
                    <asp:TemplateField HeaderText="Abreviacion">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtAB" required="true" runat="server" Text='<%# Bind("co_abbreviation") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblAB" runat="server" Text='<%# Bind("co_abbreviation") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtfooterAB" runat="server" CssClass="form-control"></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="btn_edit" CommandName="edit_nutrient" CommandArgument='<%# Container.DataItemIndex %>' Text="Editar" runat="server" />
                            <asp:Button ID="btn_del" CommandName="delete_nutrient" CommandArgument='<%# Container.DataItemIndex %>' Text="Eliminar" runat="server" OnClientClick=" return confirm('¿Está seguro que desea eliminar el nutriente ?');" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Label ID="lblmsg" runat="server" CssClass="col-lg-2 label-danger control-label"></asp:Label>
                            <asp:Button ID="btn_update" CommandName="update_nutrient" CommandArgument='<%# Container.DataItemIndex %>' Text="Guardar" runat="server" />
                            <asp:Button ID="btn_cancel" CommandName="cancel_nutrient" CommandArgument='<%# Container.DataItemIndex %>' Text="Cancelar" runat="server" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:Label ID="lblmsg2" runat="server" CssClass="col-lg-2 label-danger control-label"></asp:Label>
                            <asp:Button ID="add" CommandName="add" Text="Agregar" runat="server" CssClass="btn-success" />
                        </FooterTemplate>
                    </asp:TemplateField>
                </Columns>
                <EmptyDataTemplate>
                    <asp:TextBox ID="txtempty" runat="server" required="true" CssClass="form-control"></asp:TextBox>
                    <asp:Button ID="btn_update" CommandName="add2" Text="Agregar" runat="server" />                    
                </EmptyDataTemplate>
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
        
        <div style="width: 70%; height: auto; margin-left: auto; margin-right: auto;">
            <h3 class="heading">Lista de <span>Categorias</span></h3>
            <asp:GridView runat="server" ID="grdCategorias" DataKeyNames="co_correlative"
                AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" Width="100%"
                GridLines="None" ShowFooter="true" OnRowCommand="grdCategorias_RowCommand">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField HeaderText="Nombre">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtname" required="true" runat="server" Text='<%# Bind("co_name") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblname" runat="server" Text='<%# Bind("co_name") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtfooter" runat="server" CssClass="form-control"></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>
                    
                    <asp:TemplateField HeaderText="Abreviacion">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtAB" required="true" runat="server" Text='<%# Bind("co_abbreviation") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblAB" runat="server" Text='<%# Bind("co_abbreviation") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtfooterAB" runat="server" CssClass="form-control"></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="btn_edit" CommandName="edit_nutrient" CommandArgument='<%# Container.DataItemIndex %>' Text="Editar" runat="server" />
                            <asp:Button ID="btn_del" CommandName="delete_nutrient" CommandArgument='<%# Container.DataItemIndex %>' Text="Eliminar" runat="server" OnClientClick=" return confirm('¿Está seguro que desea eliminar el nutriente ?');" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Label ID="lblmsg" runat="server" CssClass="col-lg-2 label-danger control-label"></asp:Label>
                            <asp:Button ID="btn_update" CommandName="update_nutrient" CommandArgument='<%# Container.DataItemIndex %>' Text="Guardar" runat="server" />
                            <asp:Button ID="btn_cancel" CommandName="cancel_nutrient" CommandArgument='<%# Container.DataItemIndex %>' Text="Cancelar" runat="server" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:Label ID="lblmsg2" runat="server" CssClass="col-lg-2 label-danger control-label"></asp:Label>
                            <asp:Button ID="add" CommandName="add" Text="Agregar" runat="server" CssClass="btn-success" />
                        </FooterTemplate>
                    </asp:TemplateField>
                </Columns>
                <EmptyDataTemplate>
                    <asp:TextBox ID="txtempty" runat="server" required="true" CssClass="form-control"></asp:TextBox>
                    <asp:Button ID="btn_update" CommandName="add2" Text="Agregar" runat="server" />                    
                </EmptyDataTemplate>
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
        
        <div style="width: 70%; height: auto; margin-left: auto; margin-right: auto;">
            <h3 class="heading">Lista de <span>Origen</span></h3>
            <asp:GridView runat="server" ID="grdOrigen" DataKeyNames="co_correlative"
                AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" Width="100%"
                GridLines="None" ShowFooter="true" OnRowCommand="grdOrigen_RowCommand">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField HeaderText="Nombre">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtname" required="true" runat="server" Text='<%# Bind("co_name") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblname" runat="server" Text='<%# Bind("co_name") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtfooter" runat="server" CssClass="form-control"></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>
                    
                    <asp:TemplateField HeaderText="Abreviacion">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtAB" required="true" runat="server" Text='<%# Bind("co_abbreviation") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblAB" runat="server" Text='<%# Bind("co_abbreviation") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtfooterAB" runat="server" CssClass="form-control"></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="btn_edit" CommandName="edit_nutrient" CommandArgument='<%# Container.DataItemIndex %>' Text="Editar" runat="server" />
                            <asp:Button ID="btn_del" CommandName="delete_nutrient" CommandArgument='<%# Container.DataItemIndex %>' Text="Eliminar" runat="server" OnClientClick=" return confirm('¿Está seguro que desea eliminar el nutriente ?');" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Label ID="lblmsg" runat="server" CssClass="col-lg-2 label-danger control-label"></asp:Label>
                            <asp:Button ID="btn_update" CommandName="update_nutrient" CommandArgument='<%# Container.DataItemIndex %>' Text="Guardar" runat="server" />
                            <asp:Button ID="btn_cancel" CommandName="cancel_nutrient" CommandArgument='<%# Container.DataItemIndex %>' Text="Cancelar" runat="server" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:Label ID="lblmsg2" runat="server" CssClass="col-lg-2 label-danger control-label"></asp:Label>
                            <asp:Button ID="add" CommandName="add" Text="Agregar" runat="server" CssClass="btn-success" />
                        </FooterTemplate>
                    </asp:TemplateField>
                </Columns>
                <EmptyDataTemplate>
                    <asp:TextBox ID="txtempty" runat="server" required="true" CssClass="form-control"></asp:TextBox>
                    <asp:Button ID="btn_update" CommandName="add2" Text="Agregar" runat="server" />                    
                </EmptyDataTemplate>
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
        
        <div style="width: 70%; height: auto; margin-left: auto; margin-right: auto;">
            <h3 class="heading">Lista de <span>Unidad</span></h3>
            <asp:GridView runat="server" ID="grdUnidad" DataKeyNames="co_correlative"
                AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" Width="100%"
                GridLines="None" ShowFooter="true" OnRowCommand="grdUnidad_RowCommand">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField HeaderText="Nombre">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtname" required="true" runat="server" Text='<%# Bind("co_name") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblname" runat="server" Text='<%# Bind("co_name") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtfooter" runat="server" CssClass="form-control"></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>
                    
                    <asp:TemplateField HeaderText="Abreviacion">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtAB" required="true" runat="server" Text='<%# Bind("co_abbreviation") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblAB" runat="server" Text='<%# Bind("co_abbreviation") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtfooterAB" runat="server" CssClass="form-control"></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="btn_edit" CommandName="edit_nutrient" CommandArgument='<%# Container.DataItemIndex %>' Text="Editar" runat="server" />
                            <asp:Button ID="btn_del" CommandName="delete_nutrient" CommandArgument='<%# Container.DataItemIndex %>' Text="Eliminar" runat="server" OnClientClick=" return confirm('¿Está seguro que desea eliminar el nutriente ?');" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Label ID="lblmsg" runat="server" CssClass="col-lg-2 label-danger control-label"></asp:Label>
                            <asp:Button ID="btn_update" CommandName="update_nutrient" CommandArgument='<%# Container.DataItemIndex %>' Text="Guardar" runat="server" />
                            <asp:Button ID="btn_cancel" CommandName="cancel_nutrient" CommandArgument='<%# Container.DataItemIndex %>' Text="Cancelar" runat="server" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:Label ID="lblmsg2" runat="server" CssClass="col-lg-2 label-danger control-label"></asp:Label>
                            <asp:Button ID="add" CommandName="add" Text="Agregar" runat="server" CssClass="btn-success" />
                        </FooterTemplate>
                    </asp:TemplateField>
                </Columns>
                <EmptyDataTemplate>
                    <asp:TextBox ID="txtempty" runat="server" required="true" CssClass="form-control"></asp:TextBox>
                    <asp:Button ID="btn_update" CommandName="add2" Text="Agregar" runat="server" />                    
                </EmptyDataTemplate>
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
        </section>
</asp:Content>
