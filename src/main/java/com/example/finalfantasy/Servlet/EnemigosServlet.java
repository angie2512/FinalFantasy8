package com.example.finalfantasy.Servlet;

import com.example.finalfantasy.Bean.Enemigos;
import com.example.finalfantasy.Daos.EnemigoDao;

import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet(name = "EnemigosServlet", value = "/EnemigosServlet")
public class EnemigosServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "listar" : request.getParameter("action");

        EnemigoDao enemigoDao = new EnemigoDao();
        RequestDispatcher requestDispatcher;

        String villanoId;
        Enemigos enemigos;

        switch (action) {
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

    }
}