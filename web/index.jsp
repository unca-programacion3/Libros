<%@page contentType="text/html" language="java" %>  
<%@page import="java.util.List"%>
<%@page import="model.Libro"%>
<%@page import="model.Autor"%>

<%  List<Libro> listaLibros = (List<Libro>) request.getAttribute("listaLibros"); %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="icon" href="images/book_icon.png">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <title>Consulta de Libros</title>
    </head>
    <body>
        <jsp:include page="encabezado.html" />
        <div style="width: 90%; padding: 15pt;">
            <% if (request.getParameter("msj") != null) { %>
            <div class="alert alert-info">
                <% out.println(request.getParameter("msj")); %>
            </div>
            <% }%>

            <div class="panel-group" id="accordion1">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <a data-toggle="collapse"
                           data-parent="#accordion1" href="#collapseOne">
                            Parámetros de búsqueda
                        </a>
                    </div>
                    <div id="collapseOne" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <form action="libro" method="POST">
                                <div class="row">
                                    <div class="col-md-6">
                                        <label>Título</label>
                                        <input type="text" name="titulo" id="titulo" class="form-control" placeholder="Contiene..." value="">
                                    </div>

                                    <div class="col-md-12">
                                        <br />
                                        <button type="submit" class="btn btn-primary">
                                            <span class="glyphicon glyphicon-search"></span>
                                            Buscar
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <br>
                <div class="panel-group" id="accordion2">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <a class="accordion-toggle" data-toggle="collapse"
                               data-parent="#accordion2" href="#collapseTwo">Resultados: <%= (listaLibros != null) ? listaLibros.size() : "Ninguno"%>
                            </a>
                        </div>
                        <div id="collapseTwo" class="panel-collapse collapse in">
                            <div class="panel-body">
                                <table class="table table-striped table-bordered table-hover table-condensed">
                                    <thead>
                                    <th>Título</th>
                                    <th>Autor</th>
                                    <th>Editorial</th>
                                    <th>Publicación</th>
                                    </thead>
                                    <tbody>
                                        <%  if (listaLibros != null && listaLibros.size() > 0) {
                                                for (Libro libro : listaLibros) {%>
                                        <tr>
                                            <td><a href="libro?id=<%= libro.getId()%>"><%= libro.getTitulo()%></a></td>
                                            <td><%= libro.getAutor().getApellidoNombre()%></td>
                                            <td><%= libro.getEditorial()%></td>
                                            <td><%= libro.getPublicacion()%></td>
                                        </tr>
                                        <% }
                                        } else {%>
                                        <tr><td colspan="4">No se encontraron resultados para los datos ingresados</td></tr> 
                                        <%}%>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
