<%@ Page Title="" Language="C#" MasterPageFile="~/Views/recipesHTT.Master" AutoEventWireup="true" CodeBehind="UserRecipes.aspx.cs" Inherits="recipes.Views.UserRecipes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="about-us">
        <div class="container">            
            <div style="width: 90%; height: auto; margin-left: auto; margin-right: auto;">                
            <h3 class="heading"> Recetas de los <span>Usuarios</span></h3>
                <hr />                
            <asp:GridView runat="server" ID="grdUserRecipes" DataKeyNames="re_recipe" Width="100%"
                AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333"
                GridLines="None" ShowFooter="False">
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
                    <asp:BoundField HeaderText="Usuario" DataField="us_name" />
                    <asp:BoundField HeaderText="Codigo" DataField="re_recipe_id" />
                    <asp:BoundField HeaderText="Nombre" DataField="re_name" />
                    <asp:BoundField HeaderText="Turno" DataField="TURNO" />
                    <asp:BoundField HeaderText="Observacion" DataField="re_observation" ItemStyle-Wrap="true" />
                    <asp:BoundField HeaderText="Costo" DataField="re_total_cost" />
                    <asp:BoundField HeaderText="URL video" DataField="re_url_video" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:HyperLink ID="hplSeleccioar1" CssClass="btn btn-link" runat="server" NavigateUrl='<%#"~/Views/RecipeDetail.aspx?valor=" + DataBinder.Eval(Container.DataItem, "re_recipe")%>'>Ver Receta</asp:HyperLink>
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
    </section>
</asp:Content>
