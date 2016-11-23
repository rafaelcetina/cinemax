<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Controlador.ControladorPeliculas"%>
<% request.setCharacterEncoding("utf-8"); %>


<!DOCTYPE html>
<html lang="es-MX">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    
    <title>ADMINISTRACIÓN</title>
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/admin.css">
    <link rel="stylesheet" href="css/forms.css">
    <script src="js/jquery.min.js"></script>
    <script src="js/main.js"></script>
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
    <h1>Añadir Pelicula a Cartelera</h1>
    <% // if(request.getParameter("ok").contains("1")) { out.print("<h2>Bien! Pelicula insertada correctamente</h2>"); } %>
    <form class="cf" action="crearpelicula" name="frmnuevo" method="POST" id="frm_nuevo">
      <div class="half left cf">
          <input type="text" placeholder="Título" name="titulo">
          <input type="text" placeholder="Año" name="anio">
          <input type="text" placeholder="Clasificación" name="rated">
          <input type="text" placeholder="Fecha de lanzamiento" name="fecha_lanz">
          <input type="text" placeholder="Duración (min)" name="duracion">
      </div>
      <div class="half right cf">
          <input type="text" placeholder="Director" name="director">
          <input type="text" placeholder="Actores" name="actores">
          <!--<input type="text" placeholder="Url de poster" name="poster">-->
          <input type="text" placeholder="Idioma" name="idioma">
          <input type="text" placeholder="Genero" name="genero">
          <input type="file" name="poster"/>
        
      </div>  
      <input type="submit" value="Enviar" id="input-submit">
    </form>

    <p>&larr; Hola administrador, no me jakees plx &rarr;</p>
    <p> <a href="index.jsp"><button class="mi_btn btn-home"><span class="text"><i class="fa fa-home"></i> Inicio</span></button></a>
        <a href="administracion.jsp"><button class="mi_btn btn-home"><span class="text"><i class="fa fa-film"></i> Ver peliculas</span></button></a>
    </p>

</body>
</html>
