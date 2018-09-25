<%@page contentType="text/html" language="java" %>  
<%@page import="model.Libro"%>
<%@page import="model.Autor"%>

<%  Libro libro = (Libro) request.getAttribute("libro"); %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="estilos/estilos.css">
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

                <div class="container card">
                    <img src="<%= libro.getFoto()%>" alt="foto libro" style="width:50%; height: 50%;" class="center">
                      <h2><%= libro.getTitulo()%></h2>
                      <p class="title"><%= libro.getAutor().getApellidoNombre()%></p>
                      <p><%= libro.getEditorial()%></p>
                      <p><%= libro.getResumen()%></p>
                      <p><button class="button">Comprar</button></p>
                    </div>
</div>
    </body>
</html>
