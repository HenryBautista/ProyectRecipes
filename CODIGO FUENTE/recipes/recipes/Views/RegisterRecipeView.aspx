<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterRecipeView.aspx.cs" Inherits="recipes.Views.RegisterRecipeView" MasterPageFile="~/Views/recipes.Master"%>


<asp:Content ID="head" ContentPlaceHolderID="head" runat="server">
    <link href="../Content/bootstrap.min.css" rel="stylesheet"  type="text/css"/>
    <script src="../Scripts/jquery-1.9.1.min.js"></script>
    <script src="../Scripts/bootstrap.min.js" type="text/javascript"></script>

</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="SM" runat="server">

    </asp:ScriptManager>
    <div class="container-fluid" runat="server">
        <div class="row"> 
            <div class="col-sm-12 col-md-12" style="background-color:whitesmoke"> 
                <div class="form-horizontal" style="padding-top:30px">
                   <div class="form-group">
                       <label class="col-lg-1 control-label">ID:</label>
                       <div class="col-lg-2">
                       <asp:TextBox CssClass="form-control " ID="tbox_id" runat="server" ></asp:TextBox>
                       </div>
                       <label class="col-lg-1 control-label">NOMBRE:</label>
                        <div class="col-lg-2">   
                            <asp:TextBox  CssClass="form-control" ID="tbox_name" runat="server"></asp:TextBox>
                        </div>
                       <label class="col-lg-1 control-label">TURNO:</label>
                       <div class="col-lg-2">
                            <asp:DropDownList ID="ddl_turn" CssClass="form-control" runat="server" DataValueField="co_correlative" DataTextField="co_name"></asp:DropDownList>
                       </div>
                        
                       <label class="col-lg-1 control-label">Costo Total:</label>
                       <div class="col-lg-2">
                            <asp:TextBox id="tbox_total" runat="server" TextMode="Number" step="0.01" min="0" CssClass="form-control" ></asp:TextBox>
                       </div>
                        
                   </div>
                    
                    <div class="form-group">
                        <label class="col-lg-1 control-label">IMAGEN:</label>
                        <div class="col-lg-2">
                            <asp:FileUpload id="file_image" runat="server" />
                        </div>
                        <label class="col-lg-1 control-label">OBSERVACION:</label>
                        <div class="col-lg-2">
                             <asp:TextBox id="tbox_Observation" runat="server"  TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <label runat="server" id="lbl_message" class="col-lg-2 label-danger control-label"></label>
                    </div>
                    <div class="form-group">
                        <div class="col-lg-1">
                            <asp:Button id="btn_add" runat="server" CssClass="btn btn-primary" Text="CREAR" OnClick="btn_add_Click"/>
                        </div>
                    </div>

                </div>  
            </div>
        </div>
        <div class="row"> 
            <div class="col-md-10">   
               <asp:GridView ID="grid_recipes" runat="server" CssClass="table table-bordered bs-table" AutoGenerateColumns="false">
                    <Columns>
                        <asp:BoundField DataField="re_recipe" Visible="false"/>
                        <asp:BoundField HeaderText="ID" DataField="re_recipe_id"/>
                        <asp:BoundField HeaderText="NOMBRE" DataField="re_name"/>
                        <asp:BoundField HeaderText="TURNO" DataField="re_turn"/>
                        <asp:BoundField HeaderText="COSTO" DataField="re_total_cost"/>
                        <asp:BoundField HeaderText="OBSERVACION" DataField="re_observation"/>
                        <asp:ImageField HeaderText="IMAGEN" DataImageUrlField="re_image" ControlStyle-Width="80"></asp:ImageField>
                    </Columns>
                </asp:GridView>
            </div>  
            
        </div>
    </div>
    
        <script>
    </script>
</asp:Content>
