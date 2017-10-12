<%@ Page Title="" Language="C#" MasterPageFile="~/Views/recipesHTT.Master" AutoEventWireup="true" CodeBehind="RecipeIngredientView.aspx.cs" Inherits="recipes.Views.RecipeIngredientView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="about-us">
        <div class="container">
            <div class="container" style="width: 80%; margin-top: 25px; border: 1px solid #e1e1e1;">
                <div class="row">
                    <div class="col-md-6" style="background: #fff;">
                        <div >
                            <iframe runat="server" id="re_iframe" style="min-width: 100%; min-height: 350px" frameborder="0" allowfullscreen class="img-responsive"></iframe>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <asp:Label Text="Codigo" runat="server" CssClass="control-label" />
                                    <asp:TextBox runat="server" ID="txt_code" CssClass="form-control" ReadOnly="true" />
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <asp:Label Text="Nombre" runat="server" />
                                    <asp:TextBox runat="server" ID="txt_nombre" CssClass="form-control" ReadOnly="true" />
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <asp:Label Text="Turno" runat="server" />
                                    <asp:TextBox runat="server" ID="txt_turno" CssClass="form-control" ReadOnly="true" />
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <asp:Label Text="Costo" runat="server" />
                                    <asp:TextBox runat="server" ID="txt_cost" CssClass="form-control" ReadOnly="true" />
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <asp:Label Text="Observacion" runat="server" />
                                    <asp:TextBox runat="server" ID="txt_obs" TextMode="MultiLine" CssClass="form-control" ReadOnly="true" />
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <asp:Label Text="URL video" runat="server" />
                                    <asp:TextBox runat="server" ID="txt_url" CssClass="form-control" ReadOnly="true" />
                                </div>
                            </div>
                        </div>
                        <asp:Label ID="recipe_id" Visible="false" runat="server"></asp:Label>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div style="width: 95%; height: auto; margin-left: auto; margin-right: auto;">
                        <h3>Lista de Ingredientes</h3>
                        <asp:GridView runat="server" ID="grdIngredients" DataKeyNames="ri_recipe_ingredient"
                            AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None"
                            OnRowCommand="grdIngredients_RowCommand" Width="100%"
                            ShowFooter="true">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:TemplateField HeaderText="Ingrediente" ItemStyle-Width="33%">
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="DDLingredient" DataSource='<%# getIngredient()%>' SelectedValue='<%# Bind("ri_ingredient") %>' Enabled="false" DataValueField="in_ingredient" DataTextField="in_name" runat="server" Width="80%"></asp:DropDownList>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:DropDownList ID="DDLing" DataSource='<%# getIngredient() %>' SelectedValue='<%# Bind("ri_ingredient")%>' Enabled="false" DataValueField="in_ingredient" DataTextField="in_name" runat="server" Width="80%">
                                        </asp:DropDownList>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:DropDownList ID="DDLfooter" DataSource='<%# getIngredient() %>' DataValueField="in_ingredient" DataTextField="in_name" runat="server" Width="80%">
                                        </asp:DropDownList>
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Cantidad">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtQty" runat="server" Text='<%# Bind("ri_quantity") %>' type="numeric" required="true"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblQty" runat="server" Text='<%# Bind("ri_quantity") %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="txtfooterqty" runat="server" type="numeric" Placeholder="Cantidad"></asp:TextBox>
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Observation">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtObs" runat="server" Text='<%# Bind("ri_observation") %>' TextMode="MultiLine"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblObs" runat="server" Text='<%# Bind("ri_observation") %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="txtfooterobs" runat="server" Placeholder="Observacion"></asp:TextBox>                                        
                                        <asp:Label ID="lblmsg" runat="server" CssClass="col-lg-2 label-danger control-label"></asp:Label>
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:Button ID="btn_edit" CommandName="edit_ingredient" CommandArgument='<%# Container.DataItemIndex %>' Text="Editar" runat="server" />
                                        <asp:Button ID="btn_del" CommandName="delete_ingredient" CommandArgument='<%# Container.DataItemIndex %>' Text="Eliminar" runat="server" OnClientClick=" return confirm('¿Está seguro que desea eliminar el nutriente ?');" />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:Label ID="lblmsg" runat="server" CssClass="col-lg-2 label-danger control-label"></asp:Label>
                                        <asp:Button ID="btn_update" CommandName="update_ingredient" CommandArgument='<%# Container.DataItemIndex %>' Text="Guardar" runat="server" Visible="true" />
                                        <asp:Button ID="btn_cancel" CommandName="cancel_ingredient" CommandArgument='<%# Container.DataItemIndex %>' Text="Cancelar" runat="server" Visible="true" />
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:Button ID="add" CommandName="add" Text="Agregar" runat="server" />
                                    </FooterTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <EmptyDataTemplate>
                                <div class="row">
                                    <div class="col-md-4">
                                        <asp:DropDownList ID="DDLempty" CssClass="form-control col-md-2" DataSource='<%# getIngredient() %>' DataValueField="in_ingredient" DataTextField="in_name" runat="server">
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:TextBox ID="txtemptyqty" CssClass="form-control" PlaceHolder="ingrese cantidad" required="true" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:TextBox ID="txtemptyobs" CssClass="form-control" PlaceHolder="ingrese observacion" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:Button ID="Button1" CommandName="add2" Text="Agregar" runat="server" />
                                    </div>
                                </div>
                            </EmptyDataTemplate>
                            <EditRowStyle BackColor="#7C6F57" />
                            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="Black" />
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
            </div>
        </div>
    </section>
</asp:Content>
