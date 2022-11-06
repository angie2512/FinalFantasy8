package com.example.finalfantasy.Bean;

public class Objetos {
    private int idObjetos;
    private float peso;
    private String nombreObjeto;
    private String efecto;
    private boolean usado;

    private String use;

    public String getUse() {
        return use;
    }

    public void setUse(String use) {
        this.use = use;
    }

    public int getIdObjetos() {
        return idObjetos;
    }

    public void setIdObjetos(int idObjetos) {
        this.idObjetos = idObjetos;
    }

    public float getPeso() {
        return peso;
    }

    public void setPeso(float peso) {
        this.peso = peso;
    }

    public String getNombreObjeto() {
        return nombreObjeto;
    }

    public void setNombreObjeto(String nombreObjeto) {
        this.nombreObjeto = nombreObjeto;
    }

    public String getEfecto() {
        return efecto;
    }

    public void setEfecto(String efecto) {
        this.efecto = efecto;
    }

    public boolean isUsado() {
        return usado;
    }

    public void setUsado(boolean usado) {
        this.usado = usado;
    }
}
