package com.example.finalfantasy.Bean;

public class Hechizos {
    private int idHechizos;
    private String nombreHechizo;
    private int potencia;
    private int precision;
    private int nivelAprendizaje;
    private Hechizos heroes_idHeroes;
    private Hechizos elemento_idElemento;

    private String elemento;

    private int base;

    private int nelemento;

    public String getElemento() {
        return elemento;
    }

    public void setElemento(String elemento) {
        this.elemento = elemento;
    }

    public int getBase() {
        return base;
    }

    public void setBase(int base) {
        this.base = base;
    }

    public int getNelemento() {
        return nelemento;
    }

    public void setNelemento(int nelemento) {
        this.nelemento = nelemento;
    }

    private Hechizos idHechizoBase;

    public int getIdHechizos() {
        return idHechizos;
    }

    public void setIdHechizos(int idHechizos) {
        this.idHechizos = idHechizos;
    }

    public String getNombreHechizo() {
        return nombreHechizo;
    }

    public void setNombreHechizo(String nombreHechizo) {
        this.nombreHechizo = nombreHechizo;
    }

    public int getPotencia() {
        return potencia;
    }

    public void setPotencia(int potencia) {
        this.potencia = potencia;
    }

    public int getPrecision() {
        return precision;
    }

    public void setPrecision(int precision) {
        this.precision = precision;
    }

    public int getNivelAprendizaje() {
        return nivelAprendizaje;
    }

    public void setNivelAprendizaje(int nivelAprendizaje) {
        this.nivelAprendizaje = nivelAprendizaje;
    }

    public Hechizos getHeroes_idHeroes() {
        return heroes_idHeroes;
    }

    public void setHeroes_idHeroes(Hechizos heroes_idHeroes) {
        this.heroes_idHeroes = heroes_idHeroes;
    }

    public Hechizos getElemento_idElemento() {
        return elemento_idElemento;
    }

    public void setElemento_idElemento(Hechizos elemento_idElemento) {
        this.elemento_idElemento = elemento_idElemento;
    }

    public Hechizos getIdHechizoBase() {
        return idHechizoBase;
    }

    public void setIdHechizoBase(Hechizos idHechizoBase) {
        this.idHechizoBase = idHechizoBase;
    }
}
