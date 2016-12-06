<%-- 
    Document   : tickets
    Created on : 5/12/2016, 09:46:43 AM
    Author     : GERENTE COMERCIAL

--%>
<%
//String name = request.getParameter("name");
//int ntickets = Integer.parseInt(request.getParameter("tickets"));

String name = request.getParameter("persona");
String pelicula = request.getParameter("titulo");
int ntickets = Integer.parseInt(request.getParameter("ntickets"));
String horario = request.getParameter("horario");
String asientos= request.getParameter("asientos");

String[] asiento = asientos.split(","); 
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<title>Ticket</title>
	<link rel="stylesheet" href="css/ticket.css">
</head>
<body>  
    <a href="index.jsp" class="btn regresar">«Salir»</a>
       <% for(int i=0; i< ntickets; i++){ %>
	<div class="cardWrap">
	  <div class="card cardLeft">
	    <h1>Cine <span>Max</span></h1>
	    <div class="title">
	      <h2><%=pelicula%></h2>
	      <span>Pelicula</span>
	    </div>
	    <div class="name">
	      <h2><%=name%></h2>
	      <span>Nombre</span>
	    </div>
	    <div class="sala">
	      <h2>01</h2>
	      <span>Sala</span>
	    </div>
	    <div class="seat">
	      <h2><%=asiento[i]%></h2>
	      <span>Asiento</span>
	    </div>
	    <div class="time">
	      <h2><%=horario%></h2>
	      <span>Horario</span>
	    </div>
	  </div>
	  <div class="card cardRight">
	    <div class="eye"></div>
	    <div class="number">
	      <h3><%=asiento[i]%></h3>
	      <span>asiento</span>
	    </div>
	    <div class="barcode"></div>
	  </div>

	</div>
        <% } %>
</body>
</html>