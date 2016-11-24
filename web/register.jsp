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
<html lang="en-US">
  <head>
    <meta charset="utf-8">
    <title>Cine Maxx :: Registro</title>
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/login.css">

    <!--[if lt IE 9]>
  <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
 <![endif]-->
  </head>
  <body>

    <div class="container">

      <div id="login">

        <h2><span class="fa fa-lock"></span> Registro de usuarios</h2>

        <form action="registrar.jsp" method="POST" id="formRegistrar">

          <fieldset>
            <p><label for="nombre">Nombre completo</label></p>
            <p><input type="text" name="nombre" autofocus="" required placeholder="Nombre completo"></p>
            
            <p><label for="email">Correo electrónico</label></p>
            <p><input type="email" name="email" required placeholder="usuario@mail.com"></p>
            
            <p><label for="usuario">Usuario</label></p>
            <p><input type="text" name="usuario" id="usuario" required placeholder="jperez01"></p>

            <p><label for="password">Contraseña</label></p>
            <p><input type="password" name="password" id="password" required placeholder="password"></p>
            
            <p class="btns"><input type="submit" id="btnSubmitRegistrar" value="Registrar">
                <a class="btn" href="administracion.jsp"> Cancelar</a>
            </p>
            <div class="info"></div>
            <div class="loading"></div>
          </fieldset>

        </form>
        
      </div> <!-- end login -->

    </div>

  </body>
  <script src="js/jquery.min.js"></script>
  <script src="js/login.js"></script>
</html>
<%
  }
%>