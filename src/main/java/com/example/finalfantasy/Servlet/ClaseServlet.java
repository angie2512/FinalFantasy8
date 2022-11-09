package com.example.finalfantasy.Servlet;

import com.example.finalfantasy.Bean.Clase;
import com.example.finalfantasy.Bean.ElementoClase;
import com.example.finalfantasy.Bean.Enemigos;
import com.example.finalfantasy.Daos.ClaseDao;
import com.example.finalfantasy.Daos.EnemigoDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "ClaseServlet", value = "/ClaseServlet")
public class ClaseServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accion = request.getParameter("accion") == null ? "listar" : request.getParameter("accion");
        RequestDispatcher view;
        ClaseDao claseDao = new ClaseDao();
        EnemigoDao ene = new EnemigoDao();
        switch (accion) {
            case ("clases"):
                String id= request.getParameter("id");
                ArrayList<ElementoClase> listafort = null;
                listafort = claseDao.listarfort(id);
                ArrayList<Clase> listaclases1 = null;
                listaclases1 = claseDao.listarClases();
                String clase = ene.obtenerClase(id);
                request.setAttribute("listaClases", listaclases1);
                request.setAttribute("forta", listafort);
                request.setAttribute("clase", clase);
                view = request.getRequestDispatcher("/elementoclase.jsp");
                view.forward(request,response);
                break;
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
        request.setCharacterEncoding("UTF-8");
        String accion = request.getParameter("accion");
        ClaseDao clasie = new ClaseDao();
        RequestDispatcher view;
        switch (accion){

            case ("dama"):

                String daño = request.getParameter("damage");
                String clase = request.getParameter("id1");
                String elemento = request.getParameter("id");
                float daa = 0;
                try {
                    daa = Float.parseFloat(daño);
                    clasie.actualizar(elemento,daa,clase);
                    response.sendRedirect(request.getContextPath() + "ClaseServlet?accion=clases&id="+clase);
                } catch (NumberFormatException e) {
                    request.getSession().setAttribute("infotodo","DAÑO NO VÁLIDO");
                    response.sendRedirect(request.getContextPath() + "ClaseServlet?accion=clases&id="+clase);
                }
                break;

        }
    }
}
