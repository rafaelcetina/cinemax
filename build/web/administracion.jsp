<%@page import="Controlador.ControladorPeliculas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if ((session.getAttribute("usuario") == null) || (session.getAttribute("usuario") == "")) {
%>
<script>
   location.href="login.jsp";
</script>
<%} else {
%>
<!DOCTYPE html>
<html lang="es-MX">
<head>
    <meta charset="UTF-8">
    
    <title>ADMINISTRACIÓN</title>
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/jquery.min.js"></script>
    <script src="js/paneladministracion.js"></script>
    <style>
        table{
            border-collapse: collapse;
        }
        td, th{
            padding: .3em;
        }
        body{
            margin: 0 auto;
            text-align: center; 
        }
    </style>
</head>
  
<body>
    <h1>Lista de Peliculas en Cartelera</h1>
    
    <button class="mi_btn btn-add">
        <a href="crearpelicula.jsp">
        <span class="text">Añadir pelicula</span>
        </a>
    </button>


    <button class="mi_btn btn-add">
        <a href="register.jsp">
        <span class="text">Registrar usuarios</span>
        </a>
    </button>
    
   
    <table class="rwd-table">
      <tr>
        <th>Título</th>
        <th>Género</th>
        <th>Año</th>
        <th>Director</th>
        <th>Imagen</th>
        <th>Acciones</th>
      </tr>
      <% ControladorPeliculas cp = new ControladorPeliculas();%>
      <%= cp.getPanelView() %> 
    </table>

      <p>&larr; Hola <b><%=session.getAttribute("usuario")%></b>
    <a href='logout.jsp'>Cerrar sesión</a> &rarr;</p>
    <p> <a href="index.jsp"><button class="mi_btn btn-home"><span class="text"><i class="fa fa-home"></i> Inicio</span></button></a> </p>

</body>
</html>
<%
    }
%>