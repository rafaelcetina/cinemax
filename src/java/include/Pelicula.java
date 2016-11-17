/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package include;


/**
 *
 * @author Rafael
 */
public class Pelicula {
    
    private int id;
    private String titulo;
    private String anio;
    private String rated;
    private String fecha_lanz;
    private String duracion;
    private String director;
    private String actores;
    private String poster;
    private String idioma;
    private String genero;
    
    public Pelicula() {
    }

    public Pelicula(int id, String titulo, String anio, String rated, String fecha_lanz, String duracion, String director, String actores, String poster, String idioma, String genero) {
        this.id = id;
        this.titulo = titulo;
        this.anio = anio;
        this.rated = rated;
        this.fecha_lanz = fecha_lanz;
        this.duracion = duracion;
        this.director = director;
        this.actores = actores;
        this.poster = poster;
        this.idioma = idioma;
        this.genero = genero;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getAnio() {
        return anio;
    }

    public void setAnio(String anio) {
        this.anio = anio;
    }

    public String getRated() {
        return rated;
    }

    public void setRated(String rated) {
        this.rated = rated;
    }

    public String getFecha_lanz() {
        return fecha_lanz;
    }

    public void setFecha_lanz(String fecha_lanz) {
        this.fecha_lanz = fecha_lanz;
    }

    public String getDuracion() {
        return duracion;
    }

    public void setDuracion(String duracion) {
        this.duracion = duracion;
    }

    public String getDirector() {
        return director;
    }

    public void setDirector(String director) {
        this.director = director;
    }

    public String getActores() {
        return actores;
    }

    public void setActores(String actores) {
        this.actores = actores;
    }

    public String getPoster() {
        return poster;
    }

    public void setPoster(String poster) {
        this.poster = poster;
    }

    public String getIdioma() {
        return idioma;
    }

    public void setIdioma(String idioma) {
        this.idioma = idioma;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }
    
    
    
}
    

   