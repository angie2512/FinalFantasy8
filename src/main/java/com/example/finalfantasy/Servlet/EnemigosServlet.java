package com.example.finalfantasy.Servlet;

import com.example.finalfantasy.Bean.Enemigos;
import com.example.finalfantasy.Bean.Heroes;
import com.example.finalfantasy.Daos.EnemigoDao;

import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "EnemigosServlet", value = "/EnemigosServlet")
public class EnemigosServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accion = request.getParameter("accion") == null ? "listar" : request.getParameter("accion");
        RequestDispatcher view;
        EnemigoDao enemigoDao = new EnemigoDao();

        RequestDispatcher requestDispatcher;


        switch (accion) {
            case ("editar"):
                String id= request.getParameter("id");
                int ene = Integer.parseInt(id);
                Enemigos en = enemigoDao.obtenerEnemigo(ene);
                if(en == null){
                    response.sendRedirect(request.getContextPath() + "/EnemigosServlet");
                }else{
                    request.setAttribute("editar",en);
                    view = request.getRequestDispatcher("editarEnemigo.jsp");
                    view.forward(request, response);
                }
                break;
            case ("añadirenemigo"):
                view = request.getRequestDispatcher("/añadirEnemigo.jsp");
                view.forward(request,response);
                break;

            case "listar":
                request.setAttribute("listaEnemigos", enemigoDao.listarEnemigos());
                requestDispatcher = request.getRequestDispatcher("menuenemigos.jsp");
                requestDispatcher.forward(request, response);
                break;

            case "borrar":
                String spell = request.getParameter("id");
                try{
                    int spelli = Integer.parseInt(spell);
                    enemigoDao.borrar(spelli);
                    response.sendRedirect(request.getContextPath()+"/EnemigosServlet");

                }catch (NumberFormatException e){
                    response.sendRedirect(request.getContextPath()+ "/CatalogoServlet");
                }
                break;

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String accion = request.getParameter("accion");
        EnemigoDao enemigoDao1 = new EnemigoDao();
        RequestDispatcher view;

        switch (accion){
            case("buscar"):
                String buscar = request.getParameter("keyword");
                ArrayList<Enemigos> listaFiltrada =enemigoDao1.buscarPorNombre(buscar);
                request.setAttribute("listaEnemigos",listaFiltrada);
                view = request.getRequestDispatcher("/menuenemigos.jsp");
                view.forward(request,response);
                break;

            case ("nuevoEnemigo"):
                String nombre = request.getParameter("nombreEnemigo");
                String ataque = request.getParameter("ataqueEnemigo");
                String experiencia = request.getParameter("experienciaEnemigo");
                String objeto = request.getParameter("objetoEnemigo");
                String probabilidadObjeto = request.getParameter("probabilidadEnemigo");
                String genero = request.getParameter("generoEnemigo");
                String idClase = request.getParameter("idClaseEnemigo");

                try{
                    int ataque1 = Integer.parseInt(ataque);
                    int experiencia1 = Integer.parseInt(experiencia);
                    float probabilidadObj1 = Float.parseFloat(probabilidadObjeto);
                    int claseId = Integer.parseInt(idClase);
                    Enemigos nuevoenemigo = new Enemigos();

                    nuevoenemigo.setNombre(nombre);
                    nuevoenemigo.setAtaque(ataque1);
                    nuevoenemigo.setExperiencia(experiencia1);
                    nuevoenemigo.setObjeto(objeto);
                    nuevoenemigo.setProbabilidadObjeto(probabilidadObj1);
                    nuevoenemigo.setGenero(genero);
                    nuevoenemigo.setCase_idClase(claseId);
                    enemigoDao1.anadirEnemigo(nuevoenemigo);
                    response.sendRedirect(request.getContextPath()+ "EnemigosServlet?");

                } catch (NumberFormatException e) {
                    response.sendRedirect(request.getContextPath() + "/HeroesServlet?");
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;


        }

    }
}