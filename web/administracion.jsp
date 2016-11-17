<%@page import="Controlador.ControladorPeliculas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
    <a href="crearpelicula.jsp">
        <button class="mi_btn btn-add">
            <span class="text">Añadir pelicula</span>
        </button>
    </a>
   
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

    <p>&larr; Hola administrador, no me jakees plx &rarr;</p>
    <p> <a href="index.jsp"><button class="mi_btn btn-home"><span class="text"><i class="fa fa-home"></i> Inicio</span></button></a> </p>

</body>
</html>
