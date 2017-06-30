<%@ Page Title="" Language="C#" MasterPageFile="~/Views/recipes.Master" AutoEventWireup="true" CodeBehind="RegisterUser.aspx.cs" Inherits="recipes.Views.RegisterUser" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content">
                        <td class="label">Nombre de usuario:</td>
                            <asp:RequiredFieldValidator ID="rfUserName" runat="server" ControlToValidate="txtUserName" Display="None" ErrorMessage="Nombre de usuario" InitialValue="-1" SetFocusOnError="True" ValidationGroup="regUser"></asp:RequiredFieldValidator>
                                                            <cc1:ValidatorCalloutExtender ID="rfUserName_validation" runat="server" Enabled="True" TargetControlID="rfUserName">
                                                            </cc1:ValidatorCalloutExtender>
                        </td>
                    </tr>
                    <tr>
                        <td class="label">Nombre:</td>
                        <td class="text">
                            <asp:TextBox runat="server" ID="txtName" class="detalle txtName" placeholder="Nombre"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="label">Apellido:</td>
                        <td class="text">
                            <asp:TextBox runat="server" ID="txtLastName" class="detalle txtLastName" placeholder="Apellido"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="label">Correo electronico:</td>
                        <td class="text">
                            <asp:TextBox runat="server" ID="txtEmail" class="detalle txtEmail" placeholder="Correo electronico"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="label">Telefono:</td>
                        <td class="text">
                            <asp:TextBox runat="server" ID="txtTelefono" class="detalle txtTelefono" placeholder="Numero de teléfono"/>
                        </td>
                    </tr>
                    
                </table>
                <table>
                    <tr>
                        <td class="button">
                            
                        </td>
                        <td class="button"></td>
                        <td class="button"><asp:Button runat="server" ID="btnMenu" class="btn btnMenu" Text="Registrar"/></td>
                        <td class="button"></td>
                    </tr>
                </table>
            </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
</asp:Content>
