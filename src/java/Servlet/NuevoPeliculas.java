/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Controlador.ControladorPeliculas;
import include.Pelicula;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.DefaultFileItemFactory;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;

/**
 *
 * @author Rafael
 */
public class NuevoPeliculas extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, FileUploadException {
       response.setContentType("text/html;charset=UTF-8");
       
       //String titulo, anio, rated, fecha_lanz, duracion, director, actores, poster, idioma, genero;
      response.getWriter().println("creando pelicula");
      
      List<FileItem> items = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
      for (FileItem item : items) {
          if (item.isFormField()) {
              // Process regular form field (input type="text|radio|checkbox|etc", select, etc).
              String fieldname = item.getFieldName();
              String fieldvalue = item.getString();
              // ... (do your job here)
          } else {
              // Process form file field (input type="file").
              String fieldname = item.getFieldName();
              String filename = FilenameUtils.getName(item.getName());
              InputStream filecontent = item.getInputStream();
              // ... (do your job here)
          }
      }

       /*
       titulo= new String(request.getParameter("titulo").getBytes("ISO-8859-1"),"UTF-8");
       
       anio= new String(request.getParameter("anio").getBytes("ISO-8859-1"),"UTF-8");
       
       rated= new String(request.getParameter("rated").getBytes("ISO-8859-1"),"UTF-8");
       
       fecha_lanz= new String(request.getParameter("fecha_lanz").getBytes("ISO-8859-1"),"UTF-8");
       
       duracion= new String(request.getParameter("duracion").getBytes("ISO-8859-1"),"UTF-8");
       
       director= new String(request.getParameter("director").getBytes("ISO-8859-1"),"UTF-8");
       
       actores= new String(request.getParameter("actores").getBytes("ISO-8859-1"),"UTF-8");
       
       //FileInputStream is = new FileInputStream("C:\\Users\\CETINA\\Desktop\\IMAGENES\\mickey.jpg");
       
       poster= new String(request.getParameter("poster").getBytes("ISO-8859-1"),"UTF-8");
       //poster = request.getParameter("poster");
       //poster = "hola";
       idioma= new String(request.getParameter("idioma").getBytes("ISO-8859-1"),"UTF-8");
       
       genero= new String(request.getParameter("genero").getBytes("ISO-8859-1"),"UTF-8");
       */ 
       response.getWriter().println(items);
       /*
       response.getWriter().println(titulo);
        
        Pelicula p = new Pelicula(0, titulo, anio, rated, 
                fecha_lanz, duracion, director, actores, poster, idioma, genero);
        ControladorPeliculas cp = new ControladorPeliculas();
        
        if(cp.crearPelicula(p)){
            response.getWriter().println("<script> location.href='crearpelicula.jsp?ok=1' </script>");
        }else{
            response.getWriter().println("ERROR al crear pelicula");
        }
        */
        
        
       
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
