package com.example.finalfantasy.Servlet;

import com.example.finalfantasy.Bean.Objetos;
import com.example.finalfantasy.Daos.ObjetosDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "CatalogoServlet", value = "/CatalogoServlet")
public class CatalogoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ObjetosDao objetosDao = new ObjetosDao();
        ArrayList<Objetos> lista = objetosDao.listarObjetos();
        System.out.println(lista.get(0).getNombreObjeto());
        System.out.println(lista.get(0).getEfecto());
        RequestDispatcher view = request.getRequestDispatcher("catalogoobjetos.jsp");
        view.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
