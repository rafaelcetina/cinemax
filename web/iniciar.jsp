<%@ page import ="java.sql.*" %>
<%@ page import ="Modelo.Conexion" %>
<%
    String usuario = request.getParameter("usuario");    
    String pwd = request.getParameter("password");
    Conexion conexion = new Conexion();
    
    Thread.sleep(800);
    
    Connection con = conexion.getConnection();
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from usuarios where usuario='" + usuario + "' and password='" + pwd + "'");
    if (rs.next()) {
        session.setAttribute("usuario", usuario);
        
        out.println("Bienvenido <b>" + usuario+"</b>");
        %>
        <script>
            location.href="administracion.jsp";
        </script>
        <%
        //out.println("<a id='admin' href='logout.jsp'>Log out</a>");
        //response.sendRedirect("success.jsp");
    } else {
        //out.println("Invalid password <a href='index.jsp'>try again</a>");
        out.println("Datos de acceso incorrectos, intenta otra vez!");
    }
%>