/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Controlador.ControladorPeliculas;
import include.Pelicula;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;

/**
 *
 * @author Rafael
 */
public class insertarPelicula extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws org.apache.commons.fileupload.FileUploadException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, FileUploadException, Exception {
        response.setContentType("text/html;charset=UTF-8");
       
       //String titulo, descripcion, rated, fecha_lanz, duracion, director, actores, poster, idioma, genero;
      //response.getWriter().println("creando pelicula");
      String titulo = null, descripcion = null, rated = null, fecha_lanz = null, duracion = null, director = null, actores = null, idioma = null, genero = null, poster = null; 
      List<FileItem> items = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
      for (FileItem item : items) {
          if (item.isFormField()) {
              // Process regular form field (input type="text|radio|checkbox|etc", select, etc).
              String fieldname = item.getFieldName();
              response.getWriter().println(fieldname);
              String fieldvalue = item.getString();
              response.getWriter().println(fieldvalue);
              // ... (do your job here)
              switch(fieldname){
                case "titulo":
                        titulo = new String(fieldvalue.getBytes("ISO-8859-1"),"UTF-8");
                    break;
                case "descripcion":
                        descripcion = new String(fieldvalue.getBytes("ISO-8859-1"),"UTF-8");
                    break;
                case "rated":
                        rated = new String(fieldvalue.getBytes("ISO-8859-1"),"UTF-8");
                    break;
                case "fecha_lanz":
                        fecha_lanz = new String(fieldvalue.getBytes("ISO-8859-1"),"UTF-8");
                    break;
                case "duracion":
                        duracion = new String(fieldvalue.getBytes("ISO-8859-1"),"UTF-8");
                    break;
                case "director":
                        director = new String(fieldvalue.getBytes("ISO-8859-1"),"UTF-8");
                    break;
                case "actores":
                        actores = new String(fieldvalue.getBytes("ISO-8859-1"),"UTF-8");
                    break;
                case "idioma":
                        idioma = new String(fieldvalue.getBytes("ISO-8859-1"),"UTF-8");
                    break;
                case "genero":
                        genero = new String(fieldvalue.getBytes("ISO-8859-1"),"UTF-8");
                    break;
              }
              
              
              
          } else {
              // Process form file field (input type="file").
              String fieldname = item.getFieldName();
              String filename = FilenameUtils.getName(item.getName());
              InputStream filecontent = item.getInputStream();
               /*cual sera la ruta al archivo en el servidor*/
                File archivo_server = new File("c:/subidas/"+item.getName());
                  /*y lo escribimos en el servido*/
                  response.getWriter().println(archivo_server);
                  
                  item.write(archivo_server);
                  String img = "c:/subidas/"+item.getName();
                  poster = new String(img.getBytes("ISO-8859-1"),"UTF-8");
                  // ... (do your job here)
          }
          
      }
      Pelicula p; 
        p = new Pelicula(0, titulo, descripcion, rated, 
                fecha_lanz, duracion, director, actores, poster, idioma, genero);
      
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            ControladorPeliculas cp = new ControladorPeliculas();
            
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet insertarPelicula</title>");            
            out.println("</head>");
            out.println("<body>");
            if(cp.crearPelicula(p)){
                //out.println("<script> location.href='crearpelicula.jsp?ok=1' </script>");
                out.println("<h1>pelicula creada </h1>");
            }else{
                out.println("<h1>ERROR al crear pelicula</h1>");
            }
            out.println("<h1>Servlet insertarPelicula at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(insertarPelicula.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(insertarPelicula.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

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
