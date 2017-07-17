<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserView.aspx.cs" Inherits="recipes.Views.UserView" 
   MasterPageFile="~/Views/recipes.Master" %>
<asp:Content ID="cont1" runat="server" ContentPlaceHolderID="head">

</asp:Content>
<asp:Content ID="cont2" runat="server" ContentPlaceHolderID="MainContent" >
    <div class="container">  
        <div class="row">
            <div class="col-lg-12">
                <h1>DATOS DE USUARIO</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <div>
                    <div class="form-group">
                        <label class="control-label">Nombre:</label>
                        <asp:TextBox ID="tbox_name" runat="server" Width="100%" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label class="control-label">Paterno:</label>
                        <asp:TextBox ID="tbox_father" runat="server" Width="100%" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label class="control-label">Materno:</label>
                        <asp:TextBox ID="tbox_mother" runat="server" Width="100%" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label class="control-label">Telefono o Celular:</label>
                        <asp:TextBox ID="tbox_phone" runat="server" Width="100%" CssClass="form-control" type="number"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label class="control-label">Email:</label>
                        <asp:TextBox ID="tbox_email" runat="server" Width="100%" Enabled="false" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div>
                        <label class="label-warning" id="lbl_message" runat="server"></label>
                    </div>
                    <div >
                        <asp:Button id="btn_update" runat="server" CssClass="btn btn-success" Width="25%" Text="Actualizar" OnClick="btn_update_Click"/>
                    </div>
                </div>
                <%--<table>
                    <tr>
                        <td style="width:25%"></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>Nombre:</td>
                        <td colspan="2"><asp:TextBox ID="tbox_name" runat="server" Width="100%"></asp:TextBox> </td>
                    </tr>
                    <tr>
                        <td>Paterno:</td>
                        <td colspan="2"><asp:TextBox ID="tbox_father" runat="server" Width="100%"></asp:TextBox> </td>
                    </tr>
                    <tr>
                        <td>Materno:</td>
                        <td colspan="2"><asp:TextBox ID="tbox_mother" runat="server" Width="100%"></asp:TextBox> </td>
                    </tr>
                    <tr>
                        <td>Email:</td>
                        <td colspan="2"><asp:TextBox ID="tbox_email" runat="server" Width="100%" Enabled="false"></asp:TextBox> </td>
                    </tr>
                    <tr>
                        <td></td>
                    </tr>
                    <tr>
                        <td><asp:Button id="btn_update" runat="server" CssClass="btn btn-success" Text="Actualizar"/></td>
                    </tr>
                </table>--%>
            </div>
            <div class="col-md-6">
                
                <table>
                    <tr>
                        <td style="width:15%"></td>
                        <td style="width:25%"></td>
                        <td style="width:15%"></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td colspan="3"><h3>PERSONAS</h3></td>
                        <td ></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>Nombre:</td>
                        <td><asp:TextBox ID="tbox_person_name" runat="server" Width="100%"></asp:TextBox></td>
                        <td><asp:Button id="btn_person_save" runat="server" Text="Guardar" CssClass="btn btn-success" OnClick="btn_person_save_Click"/></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            <label class="label-warning" id="lbl_person_error" runat="server" ></label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                        <asp:GridView ID="grid_person" runat="server" AutoGenerateColumns="false" Width="100%" CssClass="table" DataKeyNames="pe_person" OnRowCommand="grid_person_RowCommand">
                            <Columns>
                                <asp:BoundField DataField="pe_person" HeaderText="Codigo" HeaderStyle-Width="5%"/>
                                <asp:BoundField DataField="pe_name" HeaderText="Nombre"/>
                                <asp:TemplateField HeaderText="Opciones" ItemStyle-Width="20%">
                                    <ItemTemplate>
                                        <asp:Button id="btn_view" CommandName="view_person" CommandArgument='<%#Eval("pe_person")%>' Text="Ver" runat="server"
                                            Width="80%" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                            
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</asp:Content>