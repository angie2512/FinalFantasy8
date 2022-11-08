package com.example.finalfantasy.Servlet;

import com.example.finalfantasy.Bean.Clase;
import com.example.finalfantasy.Daos.ClaseDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ClaseServlet", value = "/ClaseServlet")
public class ClaseServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accion = request.getParameter("accion") == null ? "listar" : request.getParameter("accion");
        RequestDispatcher view;
        ClaseDao claseDao = new ClaseDao();
        switch (accion) {
            case ("listar"):
                ArrayList<Clase> listaclases = null;
                listaclases = claseDao.listarClases();
                request.setAttribute("listaClases", listaclases);
                view = request.getRequestDispatcher("/subMenuClaseEnemigo.jsp");
                view.forward(request, response);
                break;
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
