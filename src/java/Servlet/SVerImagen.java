/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Controlador.ControladorPeliculas;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;
import org.apache.tomcat.util.codec.binary.Base64;

/**
 *
 * @author CETINA
 */
public class SVerImagen extends HttpServlet {

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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        //response.setContentType("image/jpeg");
        try {
        HttpSession sesion=request.getSession();
        //response.setContentType("image/jpg");
        
        ControladorPeliculas p = new ControladorPeliculas();
        
        String idPelicula = String.valueOf(sesion.getAttribute("codigoPelicula"));
        
        int idPeli = Integer.parseInt(idPelicula);
        
        //System.out.println(idPeli);
        
        byte[] imag = p.obtenImagenPelicula(idPeli);
        if (imag != null) {
            ServletOutputStream out2 = response.getOutputStream();
            
            
            
            byte[] base = Base64.encodeBase64(imag);
            
            String cadena = new String(base, "UTF-8");
            
            System.out.println(cadena);
            
            out2.print(cadena);
            
            
            
            JOptionPane.showMessageDialog(null,"imagen encontrada");
        }
        else{
            JOptionPane.showMessageDialog(null,"Else Null");
        }
        }catch(Exception ex)
        {
            JOptionPane.showMessageDialog(null,"Error"+ex);
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
        processRequest(request, response);
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
        processRequest(request, response);
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
