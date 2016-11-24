<%
    if ((session.getAttribute("usuario") == null) || (session.getAttribute("usuario") == "")) {
%>
You are not logged in<br/>
<a href="login.jsp">Please Login</a>
<%} else {
%>
Welcome <%=session.getAttribute("usuario")%>
<a href='logout.jsp'>Log out</a>
<%
    }
%>