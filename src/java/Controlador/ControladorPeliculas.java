/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.ModeloPeliculas;
import Modelo.Conexion;
import Servlet.SVerImagen;
import include.Pelicula;
import java.awt.Image;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Rafael
 */
public class ControladorPeliculas {
    private Connection con;
    
    public boolean crearPelicula(Pelicula p){
        ModeloPeliculas modelop = new ModeloPeliculas();
        return modelop.crear_pelicula(p);
    }
    
    public String getViewPeliculas() throws SQLException, IOException{
        String htmlcode = "";        
        ModeloPeliculas modelop = new ModeloPeliculas(); 
        int i =0;
        for (Pelicula p : modelop.getAllPeliculas()) {
            
            
            
            //byte[] img = poster.getSource()
        
            htmlcode+=
            "<li>\n" +
"               <a href=\"detalles.jsp?id= "+ p.getId() +" \">\n" +
"                   <img src= "+"SVerImagen?id="+p.getId()+"  alt=\"\" class=\"cover\" />\n" +
"                   <p class=\"title\">"+ p.getTitulo() +"</p>\n" +
"                   <p class=\"genre\">"+ p.getGenero() +"</p>\n" +
"               </a>\n" +
"            </li>";
        }
        return htmlcode;
    }
    
    public String getDetallesPeliculas(int idPelicula){
        String htmlcode = "";
        Pelicula pr = new ModeloPeliculas().getPelicula(idPelicula);
        htmlcode = "<div class=\"single\" >\n" +
"         \n" +
"		<div class=\"cont span_2_of_3\">\n" +
"			  <div class=\"labout span_1_of_a1\">\n" +
"				<!-- start product_slider -->\n" +
"				     <ul id=\"etalage\">\n" +
"							<li>\n" +
"								<a href=\"optionallink.html\">\n" +
"									<img class=\"etalage_thumb_image\" src='"+pr.getPoster() +"' />\n" +
"									<img class=\"etalage_source_image\" src='"+pr.getPoster() +"' />\n" +
"								</a>\n" +
"							</li>\n" +
"						</ul>\n" +
"					\n" +
"					\n" +
"			<!-- end product_slider -->\n" +
"			</div>\n" +
"			<div class=\"cont1 span_2_of_a1\">\n" +
"				<h3 class=\"m_3\">"+pr.getTitulo()+"</h3>\n" +
"				\n" +
"				<div class=\"price_single\">\n" +							  
"							  <span class=\"actual\">$"+pr.getAnio()+"</span><a href=\"#\">click for offer</a>\n" +
"							</div>\n" +
"				<ul class=\"options\">\n" +
"					<h4 class=\"m_9\">Select a Size</h4>\n" +
"					<li><a href=\"#\">"+pr.getRated()+"</a></li>\n" +					
"					<div class=\"clear\"></div>\n" +
"				</ul>\n" +
"				<div class=\"btn_form\">\n" +
"				   <form>\n" +
"					 <input type=\"submit\" value=\"buy now\" title=\"\">\n" +
"				  </form>\n" +
"				</div>\n" +
"				<ul class=\"add-to-links\">\n" +
"    			   <li><img src=\"images/wish.png\" alt=\"\"/><a href=\"#\">Add to wishlist</a></li>\n" +
"    			</ul>\n" +
"    			<p class=\"m_desc\">"+pr.getFecha_lanz()+"</p>\n" +
"    			\n" +
"                <div class=\"social_single\">	\n" +
"				   <ul>	\n" +
"					  <li class=\"fb\"><a href=\"#\"><span> </span></a></li>\n" +
"					  <li class=\"tw\"><a href=\"#\"><span> </span></a></li>\n" +
"					  <li class=\"g_plus\"><a href=\"#\"><span> </span></a></li>\n" +
"					  <li class=\"rss\"><a href=\"#\"><span> </span></a></li>		\n" +
"				   </ul>\n" +
"			    </div>\n" +
"			</div>\n" +
"			<div class=\"clear\"></div>\n" +
"     \n" +
"     \n" +
"        \n" +
"	    \n" +
"	 <div class=\"toogle\">\n" +
"     	<h3 class=\"m_3\">Product Details</h3>\n" +
"     	<p class=\"m_text\">"+pr.getDirector()+"</p>\n" +
"     </div>					\n" +
"	 <div class=\"toogle\">\n" +
"     	<h3 class=\"m_3\">Product Reviews</h3>\n" +
"     	<p class=\"m_text\">"+pr.getActores()+"</p>\n" +
"     </div>\n" +
"     </div>\n" +
"     <div class=\"clear\"></div>\n" +
"	 \n" +
"	 \n" +
"       </div>";
        
        return htmlcode;
    }  
    
    public String getPanelView(){
        String htmlcode = "";
        ModeloPeliculas mp = new ModeloPeliculas();
        ArrayList<Pelicula> peliculas = mp.getAllPeliculas();
        
        for(Pelicula p : peliculas){
            htmlcode += "<tr>"+
"        <td id='id_pelicula' style='display:none'>"+ p.getId() +"</td>" +
"        <td data-th=\"Título\">"+ p.getTitulo() +"</td>" +
"        <td data-th=\"Género\">"+ p.getGenero() +"</td>" +
"        <td data-th=\"Año\"> "+ p.getAnio() +" </td>" +
"        <td data-th=\"Director\">"+ p.getDirector() +"</td>" +
"        <td data-th=\"Imagen\"><a href=\"mostrarImagen.jsp?id="+ p.getId() +"\">\n"+
"                <img src="+"SVerImagen?id="+p.getId()+" width=\"32\" height=\"50\"  border=\"0\" />\n" +
"                </a></td>" +
"        <td data-th=\"Acciones\"><a id='btn-eliminar' class='btn btn-red' href=\"\"><i class='fa fa-trash-o'></i></a>"+
"        <a id='btn-modificar' class='btn btn-blue'  href='modificar.jsp?id="+p.getId()+"'><i class='fa fa-edit'></i></a></td>"+
"      </tr>";
        }
        return htmlcode;
    }
    
    public boolean deletePelicula(int id){
        ModeloPeliculas mp = new ModeloPeliculas();
        return mp.deletePelicula(id);
    }
    
    public String getEditViewPelicula(int idPelicula){
        ModeloPeliculas mp = new ModeloPeliculas();
        Pelicula pr = mp.getPelicula(idPelicula);
        String htmlcode = "";
        htmlcode += " <form id='frmmodificar' name='frmmodificar'>\n" +
"            <table>\n" +
                 "<tr>\n" +                    
"                    <td><input type=\"hidden\" name=\"idpelicula\" id=\"nombre\" value='"+pr.getId()+"'></td>\n" +
"                </tr>\n" +
"                <tr>\n" +
"                    <td><label for=\"\">Nombre:</label></td>\n" +
"                    <td><input type=\"text\" name=\"nombre\" id=\"nombre\" value='"+pr.getTitulo()+"'></td>\n" +
"                </tr>\n" +
"                <tr>\n" +
"                    <td><label for=\"\">Descripcion:</label></td>\n" +
"                    <td><textarea cols=\"30\" rows=\"6\" name=\"descripcion\" id=\"descripcion\">"+pr.getAnio()+"</textarea></td>\n" +
"                </tr>\n" +
"                <tr>\n" +
"                    <td><label for=\"\">Precio:</label></td>\n" +
"                    <td><input type=\"text\" name=\"precio\" id=\"precio\" value='"+pr.getFecha_lanz()+"'></td>\n" +
"                </tr>\n" +
"                <tr>\n" +
"                    <td><label for=\"\">Categoria:</label></td>\n" +
"                    <td><input type=\"text\" name=\"categoria\" id=\"categoria\" value='"+pr.getDuracion()+"'></td>\n" +
"                </tr>\n" +
"                <tr>\n" +
"                    <td><label for=\"\">Detalles:</label></td>\n" +
"                    <td><textarea cols=\"30\" rows=\"6\" name=\"detalles\" id=\"detalles\">"+pr.getDirector()+"</textarea></td>\n" +
"                </tr>\n" +
"                <tr>\n" +
"                    <td><label for=\"\">Reviews:</label></td>\n" +
"                    <td><textarea cols=\"30\" rows=\"6\" name=\"reviews\" id=\"reviews\">"+pr.getActores()+"</textarea></td>\n" +
"                </tr>\n" +                                  
"                 <tr>\n" +
"                    <td></td>\n" +
"                    <td><input type=\"submit\" value=\"Modificar Pelicula\" id=\"btnmodificarpelicula\"></td>\n" +
"                </tr>\n" +
"                \n" +
"                \n" +
"            </table>\n" +
"        </form>";
        return htmlcode;
    }
    
    public boolean updatePelicula(Pelicula p){
        ModeloPeliculas mp = new ModeloPeliculas();
        return mp.update_pelicula(p);
    }
    
    
    public byte[] obtenImagenPelicula(int item)  {
        ResultSet rs = null;
        
        byte[] buffer = null;
        try {
           
            Conexion conn = new Conexion();
        
            Connection con = conn.getConnection();
            
            String sql = "SELECT * FROM peliculas WHERE id_pelicula = '"+item+"'";
        //En este ejemplo solo recupero la primera Imagen
            java.sql.Statement stmt = con.createStatement();
            rs = stmt.executeQuery(sql);
            
            while (rs.next()){
                Blob bin = rs.getBlob("poster");
                if (bin != null) {
                    InputStream inStream = bin.getBinaryStream();
                    int size = (int) bin.length();
                    buffer = new byte[size];
                    int length = -1;
                    int k = 0;
                    try {
                        inStream.read(buffer, 0, size);
                    } catch (IOException ex) {
                        ex.printStackTrace();
                    }
                }
            }
        } catch (Exception ex) {
            return null;
        } finally {
            con=null;
            rs = null;
            
        }
        return buffer;
    }
       
    
}
