<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if ((session.getAttribute("usuario") == null) || (session.getAttribute("usuario") == "")) {
%>
<!DOCTYPE html>
<html lang="en-US">
  <head>
    <meta charset="utf-8">
    <title>Cine Maxx :: Login</title>
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/login.css">

    <!--[if lt IE 9]>
  <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
 <![endif]-->
  </head>
  <body>

    <div class="container">

      <div id="login">

        <h2><span class="fa fa-lock"></span> Inicio de sesión</h2>

        <form action="iniciar.jsp" method="POST" id="formLogin">

          <fieldset>

            <p><label for="usuario">Usuario</label></p>
            <p><input type="text" name="usuario" id="usuario" autofocus="" required placeholder="administrador"></p>

            <p><label for="password">Contraseña</label></p>
            <p><input type="password" name="password" id="password" required placeholder="password"></p>

            <p class="btns"><input type="submit" id="btnSubmitLogin" value="Iniciar sesión"></p>
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
 
    } else {
%>
<script>
   location.href="administracion.jsp";
</script>
<% }
%>