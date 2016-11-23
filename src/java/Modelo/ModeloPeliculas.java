/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import include.Pelicula;
import java.io.File;
import java.io.FileInputStream;
import java.sql.Blob;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Rafael
 */
public class ModeloPeliculas extends Conexion{
    
    public boolean crear_pelicula(Pelicula p){
        PreparedStatement pst = null;
        
        boolean flag = false;
        try {
            String sql = "call insertPelicula(?,?,?,?,?,?,?,?,?,?)";
            
            //String inputFile = "c:\\entrada\\entrada.txt";
            //File imagen = new File("c:\\img\\c1.jpg");
            File imagen = new File(p.getPoster());
            //ruta puede ser: "/home/cmop/Desktop/1.jpg"
            FileInputStream   fis = new FileInputStream(imagen);
            //Lo convertimos en un Stream
            
            pst = getConnection().prepareStatement(sql);
            
            
            pst.setString(1, p.getTitulo());
            pst.setString(2, p.getAnio());
            pst.setString(3, p.getRated());
            pst.setString(4, p.getFecha_lanz());
            pst.setString(5, p.getDuracion());
            pst.setString(6, p.getDirector());
            pst.setString(7, p.getActores());
            //pst.setString(8, p.getPoster());
            pst.setBinaryStream(8, fis, (int) imagen.length());
            //pst.setBlob(8, fis);
            pst.setString(9, p.getIdioma());
            pst.setString(10, p.getGenero());
            
            System.out.println(fis);
            
            if(pst.executeUpdate() == 1){
                flag = true;
                
            }
        } catch (Exception e) {
            System.out.println(e);
        }finally{
            try {
                if(getConnection() != null) getConnection().close();
                if(pst != null) pst.close();
            } catch (Exception e) {
            }
        }        
        return flag;
    }
    
    public ArrayList<Pelicula> getAllPeliculas(){
        ArrayList<Pelicula> peliculas = new ArrayList<>();
        PreparedStatement pst = null;
        ResultSet rs = null;
        
        try {
            String sql = "call selectAllPeliculas()";
            pst = getConnection().prepareCall(sql);
            rs = pst.executeQuery();
            while (rs.next()) {                
                peliculas.add(new Pelicula(
                        rs.getInt("id_pelicula"), 
                        rs.getString("titulo"), 
                        rs.getString("anio"), 
                        rs.getString("rated"), 
                        rs.getString("fecha_lanz"), 
                        rs.getString("duracion"), 
                        rs.getString("director"), 
                        rs.getString("actores"), 
                        rs.getString("poster"), 
                        rs.getString("idioma"), 
                        rs.getString("genero") 
                        ));
            }
            
        } catch (Exception e) {
        }finally{
            try {
                if(getConnection() != null)getConnection().close();
                if(pst != null)pst.close();
                if(rs !=null)rs.close();
            } catch (Exception e) {
            
            }            
        }       
        
        return peliculas;
    }   
    
    
     public Pelicula getPelicula(int idPelicula){
        Pelicula pelicula = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        
        try {
            String sql = "select * from peliculas where id_pelicula = ?";
            pst = getConnection().prepareCall(sql);
            pst.setInt(1, idPelicula);
            rs = pst.executeQuery();
            while (rs.next()) {                
                pelicula = new Pelicula(rs.getInt("id_pelicula"), 
                        rs.getString("titulo"), 
                        rs.getString("anio"), 
                        rs.getString("rated"), 
                        rs.getString("fecha_lanz"), 
                        rs.getString("duracion"), 
                        rs.getString("director"), 
                        rs.getString("actores"), 
                        rs.getString("poster"), 
                        rs.getString("idioma"), 
                        rs.getString("genero") 
                        );
            }
            
        } catch (Exception e) {
        }finally{
            try {
                if(getConnection() != null)getConnection().close();
                if(pst != null)pst.close();
                if(rs !=null)rs.close();
            } catch (Exception e) {
            
            }            
        }       
        
        return pelicula;
    } 
    
    public boolean deletePelicula(int idPelicula){
        
        boolean flag = false;
        PreparedStatement pst = null;        
        try {
            String sql = "call deletePelicula(?)";
            pst = getConnection().prepareCall(sql);
            pst.setInt(1, idPelicula);            
            if(pst.executeUpdate() == 1){
                flag = true;
            }            
        } catch (Exception e) {
        }finally{
            try {
                if(getConnection() != null)getConnection().close();
                if(pst != null)pst.close();                
            } catch (Exception e) {
            
            }            
        } 
        return flag;
    }
    
    public boolean update_pelicula(Pelicula p){
        PreparedStatement pst = null;
        boolean flag = false;
        try {
            String sql = "call updatePelicula(?,?,?,?,?,?,?,?,?,?)";
            pst = getConnection().prepareStatement(sql);            
            pst.setInt(1, p.getId());
            pst.setString(2, p.getTitulo());
            pst.setString(3, p.getAnio());
            pst.setString(4, p.getRated());
            pst.setString(5, p.getFecha_lanz());
            pst.setString(6, p.getDuracion());
            pst.setString(7, p.getDirector());                        
            pst.setString(8, p.getActores());
            pst.setString(9, p.getIdioma());
            pst.setString(10, p.getGenero());
            
            if(pst.executeUpdate() == 1){
                flag = true;
            }
        } catch (Exception e) {
        }finally{
            try {
                if(getConnection() != null) getConnection().close();
                if(pst != null) pst.close();
            } catch (Exception e) {
            }
        }        
        return flag;
    }

    
          
    
}
