<%@ Page Title="" Language="C#" MasterPageFile="~/Views/recipesHTT.Master" AutoEventWireup="true" CodeBehind="StartViewAdministrator.aspx.cs" Inherits="recipes.Views.StartViewAdministrator" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="about-us">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="block">
                        <%--<img class="wow fadeInUp" data-wow-duration="300ms" data-wow-delay="400ms" src="images/cooker-img.png" alt="cooker-img">--%>
                        <h1 class="heading wow fadeInUp" data-wow-duration="400ms" data-wow-delay="500ms">Nuestra<span>Historia </span>                            
                        </h1>
                        <div class="md-form">
                            <textarea type="text" id="Parrafo" runat="server" class="form-control" rows="4"></textarea>
                            <label for="form7">(parrafo inicio)</label>
                        </div>
                    </div>
                    <div class="block">
                        <h1 class="heading wow fadeInUp" data-wow-duration="400ms" data-wow-delay="500ms">Imagen<span>Inicio </span></h1>
                        <div>
                            <label for="ImageFile">Seleccionar Imagen</label>
                            <input type="file" id="files" name="ImageFiles" />
                        </div>
                        <div class="overlay hm-white-slight z-depth-1-half col-md-10">
                                    <output id="list"></output>
                        </div>
                    </div>
                </div>
                <!-- .col-md-12 close -->
            </div>
            <!-- .row close -->
        </div>
        <!-- .containe close -->
    </section>
    <script type="text/javascript">
      function archivo(evt) {
          var files = evt.target.files; // FileList object
             
          // Obtenemos la imagen del campo "file".
          for (var i = 0, f; f = files[i]; i++) {
              //Solo admitimos imágenes.
              if (!f.type.match('image.*')) {
                  continue;
              }
             
              var reader = new FileReader();
             
              reader.onload = (function(theFile) {
                  return function(e) {
                      // Insertamos la imagen
                      document.getElementById("list").innerHTML = ['<img class="img-responsive" src="', e.target.result, '" title="', escape(theFile.name), '"/>'].join('');
                  };
              })(f);
             
              reader.readAsDataURL(f);
          }
      }
             
        document.getElementById('files').addEventListener('change', archivo, false);
    </script>
</asp:Content>
