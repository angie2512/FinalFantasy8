package com.example.finalfantasy.Servlet;

import com.example.finalfantasy.Bean.Hechizos;
import com.example.finalfantasy.Daos.HechizoDao;
import jakarta.servlet.http.HttpServletRequest;

import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "HechizosServlet", value = "/HechizosServlet")
public class HechizosServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accion = request.getParameter("accion")==null?"listar":request.getParameter("accion");
        RequestDispatcher view;
        HechizoDao hechi = new HechizoDao();

        switch (accion){
            case ("borrar"):
                String spell = request.getParameter("id");
                try {
                    int spelli = Integer.parseInt(spell);
                    hechi.eliminarHechizo(spelli);
                }catch (NumberFormatException e){
                    response.sendRedirect(request.getContextPath()+ "/HechizosServlet");
                }
                break;
            case ("buscar"):
                view = request.getRequestDispatcher("/añadirhechizos.jsp");
                view.forward(request,response);
                break;
            case ("añadirhechizo"):
                view = request.getRequestDispatcher("/añadirhechizos.jsp");
                view.forward(request,response);
                break;
            case ("listar"):
                ArrayList<Hechizos> listaHechizos = null;
                try {
                    listaHechizos = hechi.listarHechizos();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                request.setAttribute("listaHechizos",listaHechizos);
                view = request.getRequestDispatcher("/menuhechizos.jsp");
                view.forward(request,response);
                break;
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String accion = request.getParameter("accion");
        HechizoDao hechi1 = new HechizoDao();

        switch (accion){

            case ("añadir"):
                String nombre = request.getParameter("nombrehechizo");
                String elemento = request.getParameter("elementohechizo");
                String potencia = request.getParameter("potenciahechizo");
                String precision = request.getParameter("precisionhechizo");
                String base = request.getParameter("basehechizo");
                String nivela = request.getParameter("nivelaprendizaje");
                int elel = Integer.parseInt(elemento);
                int pot = Integer.parseInt(potencia);
                int prec = Integer.parseInt(precision);
                int bas = Integer.parseInt(base);
                int lvl = Integer.parseInt(nivela);
                hechi1.agregarHechizo(nombre,pot,prec, lvl, bas,elel);
                break;

        }
    }
}
