package com.example.finalfantasy.Servlet;

<<<<<<< HEAD
import com.example.finalfantasy.Daos.HeroeDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
=======
import com.example.finalfantasy.Bean.Heroes;
import com.example.finalfantasy.Bean.Objetos;
import com.example.finalfantasy.Daos.HeroeDao;

import com.example.finalfantasy.Daos.ObjetosDao;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
>>>>>>> origin/master

@WebServlet(name = "HeroesServlet", value = "/HeroesServlet")
public class HeroesServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
<<<<<<< HEAD
        HeroeDao heroeDao = new HeroeDao();

        request.setAttribute("ListaHeroes", heroeDao.listarHeroes());
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("menuheroes.jsp");
        requestDispatcher.forward(request, response);
=======
        RequestDispatcher view = request.getRequestDispatcher("menuheroe.jsp");
        view.forward(request, response);
>>>>>>> origin/master
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
