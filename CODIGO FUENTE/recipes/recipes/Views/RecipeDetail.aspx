<%@ Page Title="" Language="C#" MasterPageFile="~/Views/recipesHTT.Master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeBehind="RecipeDetail.aspx.cs" Inherits="recipes.Views.RecipeDetail" %>
<%@ OutputCache Location="None" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="about-us">
        <div class="container">
            <div class="container" style="width: 80%; margin-top: 25px; border: 1px solid #e1e1e1;">
                <h2>Detalle de la receta</h2>
                <div class="form-group">
                    <div class="row">
                        <div class="col-md-6" style="background: #fff;">
                            <div>
                                <iframe runat="server" id="re_iframe" style="min-width: 100%; min-height: 350px" frameborder="0" allowfullscreen class="img-responsive"></iframe>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <asp:Label Text="Codigo" runat="server" CssClass="control-label"/>
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
                            <a href="#" class="btn btn-info btn-lg" id="btnCart" runat="server" onserverclick="btnCart_ServerClick">
                                <span class="glyphicon glyphicon-shopping-cart"></span>Comprar
                            </a>
                            <asp:Button Text="text" runat="server" />
                        </div>
                    </div>

                </div>
                <h2>Ingredientes</h2>
                <div class="form-group">
                    <asp:GridView runat="server" id="grdIngredients" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:TemplateField HeaderText="Imagen">
                                <ItemTemplate>
                                    <asp:Image ImageUrl='<%#Bind("in_image") %>' runat="server" ID="img" style="width:80px; height:80px;"/>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField HeaderText="Nº" DataField="in_ingredient" />
                            <asp:BoundField HeaderText="Nombre" DataField="in_name" />
                            <asp:BoundField HeaderText="Unidad" DataField="UNIT" />
                            <asp:BoundField HeaderText="Cantidad" DataField="ri_quantity" />
                            <asp:BoundField HeaderText="Costo" DataField="in_cost" />
                            <asp:BoundField HeaderText="Factor" DataField="in_factor" />
                            <asp:BoundField HeaderText="Categoria" DataField="CATEGORY" />
                            <asp:BoundField HeaderText="Origen" DataField="ORIGIN" />
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
        </div>
        <script type="text/javascript">
            function AlertError() {
                alert("Algo salio mal!");
            }; 
            function AlertExist() {
                alert("Ya se encuenta en la lista,puede modificar\n la cantidad al planificar el pedido  ");
            };
        </script>
    </section>
</asp:Content>
