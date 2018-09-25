/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author usuario
 */
public class Autor {
    private int id;    
    private String apellidoNombre;
    
    
    public Autor(int id, String apellidoNombre){
        this.id = id;
        this.apellidoNombre = apellidoNombre;
    }
            
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    

    
    public String getApellidoNombre() {
        return apellidoNombre;
    }

    public void setApellidoNombre(String apellidoNombre) {
        this.apellidoNombre = apellidoNombre;
    }
}
