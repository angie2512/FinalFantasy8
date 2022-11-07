package com.example.finalfantasy.Servlet;

import com.example.finalfantasy.Bean.Enemigos;
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
        String action = request.getParameter("action") == null ? "listar" : request.getParameter("action");

        EnemigoDao enemigoDao = new EnemigoDao();
        RequestDispatcher requestDispatcher;
        RequestDispatcher view;

        String villanoId;
        Enemigos enemigos;

        switch (action) {
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
                villanoId = request.getParameter("id");

                response.sendRedirect(request.getContextPath() + "/EnemigoServlet");
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

            case ("añadir"):
                String nombre = request.getParameter("nombreEnemigo");
                String ataque = request.getParameter("ataqueEnemigo");
                String experiencia = request.getParameter("experienciaEnemigo");
                String objeto = request.getParameter("objetoEnemigo");
                String probabilidadObjeto = request.getParameter("probabilidadEnemigo");
                String genero = request.getParameter("generoEnemigo");
                String idClase = request.getParameter("idClaseEnemigo");


                int ataque1 = Integer.parseInt(ataque);
                int experiencia0 = Integer.parseInt(experiencia);
                float probabilidadObj = Float.parseFloat(probabilidadObjeto);
                int idClase1 = Integer.parseInt(idClase);

                enemigoDao1.anadirEnemigo(nombre,ataque1,experiencia0,objeto,probabilidadObj,genero,idClase1);

                ArrayList<Enemigos> listaEnemigos = null;

                request.setAttribute("listaEnemigos",listaEnemigos);
                view = request.getRequestDispatcher("/menuenemigos.jsp");
                view.forward(request,response);
                break;


        }

    }
}