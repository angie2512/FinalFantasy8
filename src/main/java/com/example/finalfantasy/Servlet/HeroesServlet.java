package com.example.finalfantasy.Servlet;


import com.example.finalfantasy.Bean.Heroes;
import com.example.finalfantasy.Daos.HechizoDao;
import com.example.finalfantasy.Daos.HeroeDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;


@WebServlet(name = "HeroesServlet", value = "/HeroesServlet")
public class HeroesServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") == null?"listar":request.getParameter("action");
        HeroeDao heroeDao = new HeroeDao();
        RequestDispatcher view;

        switch (action){
            case "listar":
                request.setAttribute("ListaHeroes", heroeDao.listarHeroes());
                view = request.getRequestDispatcher("menuHeroes.jsp");
                view.forward(request, response);
                break;
            case ("añadirheroe"):
                view = request.getRequestDispatcher("/añadirHeroe.jsp");
                view.forward(request,response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String buscar = request.getParameter("keyword");
        HeroeDao heroeDao = new HeroeDao();
        ArrayList<Heroes> listaFiltrada =heroeDao.buscarPorNombre(buscar);
        request.setAttribute("ListaHeroes",listaFiltrada);
        RequestDispatcher view = request.getRequestDispatcher("menuHeroes.jsp");
        view.forward(request, response);

        String accion = request.getParameter("accion");
        HeroeDao heroeDao1 = new HeroeDao();


        switch (accion){

            case ("añadir"):
                String nombre = request.getParameter("nombreheroe");
                String edad = request.getParameter("edadheroe");
                String genero = request.getParameter("generoheroe");
                String clase = request.getParameter("claseheroe");
                String nivel = request.getParameter("nivelheroe");
                String ataque = request.getParameter("ataqueheroe");
                String pareja = request.getParameter("parejah");
                int edadh = Integer.parseInt(edad);
                int nivelh = Integer.parseInt(nivel);
                int ataqueh = Integer.parseInt(ataque);
                int parejaid = Integer.parseInt(pareja);

                try {
                    heroeDao1.añadirHeroes(nombre,edadh,genero,nivelh,ataqueh,clase,parejaid);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                response.sendRedirect(request.getContextPath() + "/HeroesServlet");
                break;

        }
    }
}
