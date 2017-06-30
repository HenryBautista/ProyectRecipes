<%@ Page Title="" Language="C#" MasterPageFile="~/Views/recipes.Master" AutoEventWireup="true" CodeBehind="RegisterIngredient.aspx.cs" Inherits="recipes.Views.RegisterIngredient" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="SM" runat="server">

    </asp:ScriptManager>
    <div class="content">
        <div style="float:left; width:30%; height:30%;" >
                <img src="../Images/RecipePhotos/macdonalds-japones-1.jpg" style="width:100%; height:100%;"/>
            </div>
            <div style="float:left; width:70%;" class="detail">
                <table>
                    <tr>
                        <td class="label">Codigo:</td>
                        <td class="text">
                            <!-- -->
                            <asp:TextBox class="detalle" ID="tbox_code" runat="server" ></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="label">Nombre:</td>
                        <td class="text">
                            <asp:TextBox  CssClass="detalle" ID="tbox_name" placeholder="Costo ingrediente" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="label">Unidad de medida:</td>
                        <td class="text">
                            <asp:Datalist CssClass="form-control" id="dlist_unit" placeholder="Unidad medida" runat="server"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="label">Costo:</td>
                        <td class="text">
                            <asp:TextBox Cssclass="detalle" id="tbox_price" placeholder="Costo ingrediente" runat="server"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="label">Factor:</td>
                        <td class="text">
                            <asp:TextBox  Cssclass="detalle" id="tbox_factor" placeholder="Factor" runat="server"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="label">Categoria:</td>
                        <td class="text">
                            <asp:TextBox Cssclass="detalle" id="tbox_category" placeholder="Categoria del ingrediente" runat="server"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="label">Origen:</td>
                        <td class="text">
                            <asp:TextBox Cssclass="detalle" id="tbox_origin" placeholder="Origen del ingrediente " runat="server"/>
                        </td>
                    </tr>
                </table>
                <table>
                    <tr>
                        <td class="button">
                            <asp:Button id="btn_crear" runat="server" CssClass="btn btn-success" Text="Crear ingrediente" OnClick="btn_crear_Click"/>
                        </td>
                        <td class="button">
                            
                        </td>
                        <td class="button"></td>
                        <td class="button"></td>
                    </tr>
                </table>
            </div>
        
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
</asp:Content>
