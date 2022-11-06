package com.example.finalfantasy.Servlet;


import com.example.finalfantasy.Bean.Heroes;
import com.example.finalfantasy.Daos.HeroeDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
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
    }
}
