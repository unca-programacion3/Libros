/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Libro;
import model.Autor;

/**
 *
 * @author cgallardo
 */
public class LibroDAO extends ConexionDAO {
    public List<Libro> getLibrosPorTitulo(String titulo) throws Exception{
        Connection conn = null; 
        ResultSet rs=null;
        PreparedStatement ps=null;
        Libro libro = null;
        List<Libro> lista=new ArrayList<Libro>();
        titulo="%"+titulo.trim().toUpperCase()+"%";
        
        try {
            conn = this.getDs().getConnection();
            String vsql="SELECT libro.*,autor.id as idAutor,autor.apellidonombre FROM libro LEFT OUTER JOIN autor on (libro.id_autor=autor.id) where libro.titulo like ? ORDER BY libro.titulo";
            ps = conn.prepareStatement(vsql);
            ps.setString(1, titulo);
            rs = ps.executeQuery();
            while (rs.next()) {
                libro = new Libro();
                libro.setId(rs.getInt("id"));
                libro.setTitulo(rs.getString("titulo"));
                libro.setAutor(new Autor(rs.getInt("idAutor"),rs.getString("apellidonombre")));
                libro.setEditorial(rs.getString("editorial"));
                libro.setPublicacion(rs.getInt("publicacion"));    
                lista.add(libro);
            }
            rs.close();
            rs=null;
            ps.close();
            ps=null;
            conn.close();
            conn=null;

        } catch (Exception e) {
            throw e;
        } finally {
            cierra_todo(rs, conn, ps);
        }
        
        return lista;
     }
    
    public Libro getLibroById(int idLibro) throws Exception{
        Connection conn = null;
        ResultSet rs=null;
        PreparedStatement ps=null;
        Libro libro = null;
        
        try {
            conn = this.getDs().getConnection();
            String vsql="SELECT libro.*,autor.id as idAutor,autor.apellidonombre FROM libro LEFT OUTER JOIN autor on (libro.id_autor=autor.id) where libro.id = ?";
            
            ps = conn.prepareStatement(vsql);
            ps.setInt(1, idLibro);
            rs = ps.executeQuery();
            
            if (rs.next()) {
                libro = new Libro();
                libro.setId(rs.getInt("id"));
                libro.setTitulo(rs.getString("titulo"));
                libro.setAutor(new Autor(rs.getInt("idAutor"),rs.getString("apellidonombre")));
                libro.setEditorial(rs.getString("editorial"));
                libro.setPublicacion(rs.getInt("publicacion"));
                libro.setResumen(rs.getString("resumen"));
                libro.setFoto(rs.getString("foto"));
            }
            rs.close();
            rs=null;
            ps.close();
            ps=null;
            conn.close();
            conn=null;

        } catch (Exception e) {
            throw e;
        } finally {
            cierra_todo(rs, conn, ps);
        }
        return libro;
     }
}
