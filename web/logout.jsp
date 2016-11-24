<%
session.setAttribute("usuario", null);
session.invalidate();
response.sendRedirect("login.jsp");
%>