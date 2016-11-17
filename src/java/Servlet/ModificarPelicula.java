/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Controlador.ControladorPeliculas;
import include.Pelicula;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Rafael
 */
public class ModificarPelicula extends HttpServlet {

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
        int idPelicula = Integer.parseInt(request.getParameter("idpelicula"));
        String titulo = request.getParameter("titulo");
        String anio = request.getParameter("anio");
        String rated = request.getParameter("rated");
        String fecha_lanz = request.getParameter("fecha_lanz");
        String duracion = request.getParameter("duracion");
        String director = request.getParameter("director");
        String actores = request.getParameter("actores");
        String poster = request.getParameter("poster");
        String idioma = request.getParameter("idioma");
        String genero = request.getParameter("genero");
        
        Pelicula p = new Pelicula(idPelicula, titulo, anio, rated, fecha_lanz, duracion, director, actores, poster, idioma, genero);
        ControladorPeliculas cp = new ControladorPeliculas();
        if(cp.updatePelicula(p)){
            response.getWriter().println("Pelicula Modificado Exitosamente");
        }else{
            response.getWriter().println("ERROR al modificar el pelicula");
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
