package com.example.finalfantasy.Bean;


public class Heroes {
    private int idHeroes;
    private String nombre;
    private int edad;
    private String genero;
    private int nivel;
    private int ataque;
    private Heroes pareja;

    private int idPareja;

    public int getIdPareja() {
        return idPareja;
    }

    public void setIdPareja(int idPareja) {
        this.idPareja = idPareja;
    }

    private float experienciaInicial;
    private String clase;


    public Heroes getPareja() {
        return pareja;
    }

    public void setPareja(Heroes pareja) {
        this.pareja = pareja;
    }



    public int getIdHeroes() {
        return idHeroes;
    }

    public void setIdHeroes(int idHeroes) {
        this.idHeroes = idHeroes;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public int getNivel() {
        return nivel;
    }

    public void setNivel(int nivel) {
        this.nivel = nivel;
    }

    public int getAtaque() {
        return ataque;
    }

    public void setAtaque(int ataque) {
        this.ataque = ataque;
    }




    public float getExperienciaInicial() {
        return experienciaInicial;
    }

    public void setExperienciaInicial(float experienciaInicial) {
        this.experienciaInicial = experienciaInicial;
    }

    public String getClase() {
        return clase;
    }

    public void setClase(String clase) {
        this.clase = clase;
    }
}