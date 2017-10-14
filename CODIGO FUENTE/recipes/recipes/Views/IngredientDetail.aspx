<%@ Page Title="" Language="C#" MasterPageFile="~/Views/recipesHTT.Master" AutoEventWireup="true" CodeBehind="IngredientDetail.aspx.cs" Inherits="recipes.Views.IngredientDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <section id="about-us">
        <div class="container">
            <div class="container" style="width: 80%; margin-top: 25px; border: 1px solid #e1e1e1;">
                <div class="row">
                    <div class="col-lg-6" style="background: #fff;">
                        <asp:Image runat="server" ID="imageIngredient" class="img-responsive" />
                    </div>
                    <div class="col-lg-6">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <asp:Label Text="Codigo" runat="server" CssClass="control-label" />
                                    <asp:TextBox runat="server" ID="lbl_code" CssClass="form-control" ReadOnly="true"/>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <asp:Label Text="Nombre" runat="server" />
                                    <asp:TextBox runat="server" ID="lbl_nombre" CssClass="form-control" ReadOnly="true" />
                                </div>
                            </div>
                        </div>                        
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <asp:Label Text="Unidad de medida" runat="server" />
                                    <asp:TextBox runat="server" ID="lbl_unidad" CssClass="form-control" ReadOnly="true"/>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <asp:Label Text="Costo" runat="server" />
                                    <asp:TextBox runat="server" ID="lbl_cost" CssClass="form-control" ReadOnly="true" />
                                </div>
                            </div>
                        </div>                        
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <asp:Label Text="Cantidad" runat="server" />
                                    <asp:TextBox runat="server" ID="lbl_qty" CssClass="form-control" ReadOnly="true"/>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <asp:Label Text="Factor" runat="server" />
                                    <asp:TextBox runat="server" ID="lbl_factor" CssClass="form-control" ReadOnly="true" />
                                </div>
                            </div>
                        </div>
                                                
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <asp:Label Text="Categoria" runat="server" />
                                    <asp:TextBox runat="server" ID="lbl_cat" CssClass="form-control" ReadOnly="true"/>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <asp:Label Text="Origen" runat="server" />
                                    <asp:TextBox runat="server" ID="lbl_origin" CssClass="form-control" ReadOnly="true" />
                                </div>
                            </div>
                        </div>                        
                    <asp:Label ID="ingredient_id" Visible="false" runat="server"></asp:Label>
                            <a href="#" class="btn btn-info btn-lg" id="btnCart" runat="server" onserverclick="btnComprar_Click">
                                <span class="glyphicon glyphicon-shopping-cart"></span>Comprar
                            </a>
                    </div>
                </div>
             <br />   
            <div class="row">
                <div style="width: 95%; height: auto; margin-left: auto; margin-right: auto;">
                    <h3>Lista de nutrientes</h3>
                     <asp:GridView runat="server" id="grdNutrients" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField HeaderText="Nutriente" DataField="nu_name" />
                            <asp:BoundField HeaderText="Cantidad" DataField="in_quantity" />
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
