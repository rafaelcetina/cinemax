<%
session.setAttribute("id", request.getParameter("id"));
String id = request.getParameter("id");
%>
<body style="" >
    <center>
        
        <img src="SVerImagen?id=<%=id%>" width="300">
    </center>