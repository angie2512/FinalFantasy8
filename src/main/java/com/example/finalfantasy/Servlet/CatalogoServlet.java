package com.example.finalfantasy.Servlet;

import com.example.finalfantasy.Bean.Objetos;
import com.example.finalfantasy.Daos.ObjetosDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "CatalogoServlet", value = "/CatalogoServlet")
public class CatalogoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accion = request.getParameter("accion")==null?"listar":request.getParameter("accion");
        RequestDispatcher view;
        ObjetosDao objeto = new ObjetosDao();

        switch (accion){
            case ("editar"):
                String id= request.getParameter("id");
                int o = Integer.parseInt(id);
                Objetos ob = objeto.obtenerObjeto(o);
                if(ob == null){
                    response.sendRedirect(request.getContextPath() + "/CatalogoServelt");
                }else{
                    request.setAttribute("editar",ob);
                    view = request.getRequestDispatcher("editarobjeto.jsp");
                    view.forward(request, response);
                }
                break;

            case ("borrar"):
                String spell = request.getParameter("id");
                try {
                    int spelli = Integer.parseInt(spell);
                    objeto.eliminarObjeto(spelli);
                    ArrayList<Objetos> listaObjetos = null;
                    listaObjetos = objeto.listarObjetos();
                    request.setAttribute("listaObjetos",listaObjetos);
                    view = request.getRequestDispatcher("/catalogoobjetos.jsp");
                    view.forward(request,response);
                }catch (NumberFormatException e){
                    response.sendRedirect(request.getContextPath()+ "/CatalogoServlet");
                }
                break;
            case ("añadirobjeto"):
                view = request.getRequestDispatcher("/añadirobjeto.jsp");
                view.forward(request,response);
                break;
            case ("listar"):
                ArrayList<Objetos> listaObjetos = null;
                listaObjetos = objeto.listarObjetos();
                request.setAttribute("listaObjetos",listaObjetos);
                view = request.getRequestDispatcher("/catalogoobjetos.jsp");
                view.forward(request,response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String accion = request.getParameter("accion");
        ObjetosDao objeto1 = new ObjetosDao();
        RequestDispatcher view;
        switch (accion){
            case ("añadir"):
                String nombre = request.getParameter("nombreobjeto");
                String peso = request.getParameter("pesoobjeto");
                String efecto = request.getParameter("efecto");
                boolean usado = false;
                float weight = Float.parseFloat(peso);
                objeto1.agregarObjeto(nombre,efecto, weight,usado);
                ArrayList<Objetos> listaObjetos = null;
                listaObjetos = objeto1.listarObjetos();
                request.setAttribute("listaObjetos",listaObjetos);
                view = request.getRequestDispatcher("/catalogoobjetos.jsp");
                view.forward(request,response);
                break;

        }
    }

}
