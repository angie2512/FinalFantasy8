package com.example.finalfantasy.Servlet;

import com.example.finalfantasy.Daos.HeroeDao;

import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet(name = "HeroesServlet", value = "/HeroesServlet")
public class HeroesServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HeroeDao heroeDao = new HeroeDao();
        System.out.println("]*********");
        String accion = request.getParameter("accion")==null?"heroes":request.getParameter("accion");
        RequestDispatcher view;

        switch (accion){
            case ("añadir"):

                break;
            case "heroes":
                request.setAttribute("ListaHeroes", heroeDao.listarHeroes());
                System.out.println("a");
                view = request.getRequestDispatcher("menuheroe.jsp");
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
