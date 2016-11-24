<%@ page import ="java.sql.*" %>
<%@ page import ="Modelo.Conexion" %>
<%
    String usuario = request.getParameter("usuario");    
    String pwd = request.getParameter("password");
    String nombre = request.getParameter("nombre");
    String email = request.getParameter("email");
    
    
    Conexion conexion = new Conexion();
    
    Connection con = conexion.getConnection();
    
    Statement st = con.createStatement();
    //ResultSet rs;
    int i = st.executeUpdate("insert into usuarios(nombre, email, usuario, password, fecha_alta) values ('" + nombre + "','" + email + "','" + usuario + "','" + pwd + "', CURDATE())");
    if (i > 0) {
        //session.setAttribute("userid", user);
        //response.sendRedirect("login.jsp");
       out.print("Registro Exitoso!!");
    } else {
       out.print("Fallo el registro!!");
    }
%>