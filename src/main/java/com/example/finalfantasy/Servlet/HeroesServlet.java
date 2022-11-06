package com.example.finalfantasy.Servlet;

import com.example.finalfantasy.Bean.Heroes;
import com.example.finalfantasy.Bean.Objetos;
import com.example.finalfantasy.Daos.HeroeDao;

import com.example.finalfantasy.Daos.ObjetosDao;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "HeroesServlet", value = "/HeroesServlet")
public class HeroesServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher view = request.getRequestDispatcher("menuheroe.jsp");
        view.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
