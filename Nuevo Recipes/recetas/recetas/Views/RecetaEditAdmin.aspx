<%@ Page Title="" Language="C#" MasterPageFile="~/Views/recetas.Master" AutoEventWireup="true" CodeBehind="RecetaEditAdmin.aspx.cs" Inherits="recetas.Views.RecetaEditAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="align-content: center; justify-content: center; position: center; align-items: center; display: flex">
        <div class="col-md-6">
            <h2 runat="server" id="title"></h2>
            <div class="form-group">
                <asp:Label Text="Codigo" runat="server" />
                <asp:TextBox runat="server" ID="txtCodigo" CssClass="form-control" required="true" placeholder="Codigo..." />
            </div>
            <div class="form-group">
                <asp:Label Text="Nombre" runat="server" />
                <asp:TextBox runat="server" ID="txtNombre" CssClass="form-control" required="true" placeholder="Nombre..." />
            </div>
            <div class="row">
                <div class="col-md-6">
                    <asp:Label Text="Costo" runat="server" />
                    <asp:TextBox runat="server" ID="txtCosto" required="true" CssClass="form-control" placeholder="Costo..." />
                </div>
                <div class="col-md-6">
                    <asp:Label Text="Turno" runat="server" />
                    <asp:DropDownList runat="server" ID="ddlTurno" required="true" CssClass="form-control">
                    </asp:DropDownList>
                </div>
            </div>
            <div class="form-group">
                <asp:Label Text="Observación" runat="server" />
                <asp:TextBox runat="server" ID="txtObs" class="form-control" TextMode="MultiLine" placeholder="Observación" />
            </div>
            <div class="form-group">
                <asp:Label Text="Video" runat="server" />
                <asp:TextBox runat="server" ID="txtVideo" CssClass="form-control" required="true" placeholder="Url de video..." />
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <asp:Label Text="Imagen" runat="server" />
                        <asp:FileUpload id="imgFile" type="file" runat="server"/>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="overlay hm-white-slight z-depth-1-half col-md-10">
                        <output id="list"></output>
                    </div>
                </div>
            </div>
            <asp:Button Text="Crear Receta" runat="server" ID="btnNuevaReceta" CssClass="btn btn-success" OnClick="btnNuevaReceta_Click" />
        </div>
    </div>
    <script type="text/javascript">
        $(function () {
            $("#imgFile").change(function (evt) {
                var files = evt.target.files; // FileList object

                // Obtenemos la imagen del campo "file".
                for (var i = 0, f; f = files[i]; i++) {
                    //Solo admitimos imágenes.
                    if (!f.type.match('image.*')) {
                        continue;
                    }

                    var reader = new FileReader();

                    reader.onload = (function (theFile) {
                        return function (e) {
                            // Insertamos la imagen
                            document.getElementById("list").innerHTML = ['<img class="img-responsive" src="', e.target.result, '" title="', escape(theFile.name), '"/>'].join('');
                        };
                    })(f);
                    reader.readAsDataURL(f);
                }
            });
        });
    </script>
</asp:Content>
