<%@page import="Controlador.ControladorPeliculas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="js/jquery.min.js"></script>
        <script src="js/paneladministracion.js"></script>
    </head>
    <body>
        <h1>Modificar producto</h1>
        
        <% ControladorPeliculas cp = new ControladorPeliculas();
           int idPelicula = Integer.parseInt(request.getParameter("id"));
        %>
        <%= cp.getEditViewPelicula(idPelicula)%>
        
        <a href="administracion.jsp">Ver productos</a>
        
    </body>
</html>
