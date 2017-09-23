<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterRecipeView.aspx.cs" Inherits="recipes.Views.RegisterRecipeView" MasterPageFile="~/Views/recipesHTT.Master" %>


<asp:Content ID="head" ContentPlaceHolderID="head" runat="server">
    <%--<link href="../Content/bootstrap.min.css" rel="stylesheet"  type="text/css"/>--%>
<%--    <script src="../Scripts/jquery-1.9.1.min.js"></script>
    <script src="../Scripts/bootstrap.min.js" type="text/javascript"></script>--%>

</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="SM" runat="server">
    </asp:ScriptManager>

    <div class="container" style="padding-top:100px">
        <div class="div-formulario">
            <asp:Label Text="ID" runat="server" />
            <asp:TextBox ID="tbox_id" class="txt-form" placeholder="Introducir ID" runat="server"></asp:TextBox>

            <asp:Label Text="Nombre" runat="server" />
            <asp:TextBox ID="tbox_name" runat="server" class="txt-form" placeholder="Introducir el nombre de la receta"></asp:TextBox>

            <asp:Label Text="TURNO" runat="server" />
            <asp:DropDownList ID="ddl_turn" CssClass="form-control" runat="server" DataValueField="co_correlative" DataTextField="co_name"></asp:DropDownList>

            <asp:Label Text="Costo Total" runat="server" />
            <asp:TextBox ID="tbox_total" runat="server" TextMode="Number" step="0.01" min="0" class="txt-form" placeholder="introducir el costo total"></asp:TextBox>

            <asp:Label Text="Imagen" runat="server" />
            <asp:FileUpload ID="file_image" runat="server" class="txt-form" />

            <asp:Label Text="Observacion" runat="server" />
            <asp:TextBox ID="tbox_Observation" runat="server" TextMode="MultiLine" class="txt-form" Style="width: 100%; height: 60px;"></asp:TextBox>

            <asp:Label Text="" ID="lblError" runat="server" class="error" />
            <label runat="server" id="lbl_message" class="error"></label>
            <br />
            <asp:Button ID="btn_add" runat="server" class="btn-form" Text="CREAR" OnClick="btn_add_Click" />
        </div>

        <div class="div-gridrecipes">
            <asp:GridView ID="grid_recipes" runat="server" CssClass="table table-bordered bs-table" AutoGenerateColumns="False" EnablePersistedSelection="True"
                DataKeyNames="re_recipe" OnRowDeleting="grid_recipes_RowDeleting" OnSelectedIndexChanged="grid_recipes_SelectedIndexChanged"
                OnRowCommand="grid_recipes_RowCommand" Style="width: 100%;" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="re_recipe" Visible="false" />
                    <asp:BoundField HeaderText="ID" DataField="re_recipe_id" />
                    <asp:BoundField HeaderText="NOMBRE" DataField="re_name" />
                    <asp:BoundField HeaderText="TURNO" DataField="re_turn" />
                    <asp:BoundField HeaderText="COSTO" DataField="re_total_cost" />
                    <asp:BoundField HeaderText="OBSERVACION" DataField="re_observation" />
                    <asp:ImageField HeaderText="IMAGEN" DataImageUrlField="re_image" ControlStyle-Width="80">
<ControlStyle Width="80px"></ControlStyle>
                    </asp:ImageField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="btn_delete" CommandName="delete_recipe" CommandArgument='<%#Eval("re_recipe")%>' Text="eliminar" runat="server" />
                            <asp:Button ID="btn_edit" CommandName="edit_recipe" CommandArgument='<%#Eval("re_recipe")%>' Text="editar" runat="server" />
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

    <script>
    </script>
</asp:Content>

