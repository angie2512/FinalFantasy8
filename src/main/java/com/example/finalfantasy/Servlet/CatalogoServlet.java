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
                    response.sendRedirect(request.getContextPath() + "/CatalogoServlet");
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
                    response.sendRedirect(request.getContextPath() + "/CatalogoServlet");
                }catch (NumberFormatException e){
                    response.sendRedirect(request.getContextPath()+ "/CatalogoServlet");
                }
                break;
            case ("addd"):
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
            case ("editarobjeto"):
                String iddd = request.getParameter("idH");
                String id= request.getParameter("id");
                int idd = Integer.parseInt(id);
                String peso1 = request.getParameter("pesoobjeto");
                String efecto1 = request.getParameter("efecto");
                if (peso1==null){
                    objeto1.editarObjetoSi(efecto1,idd);
                }
                else {
                    float weight1 = Float.parseFloat(peso1);
                    objeto1.editarObjetoNo(efecto1,weight1,idd);
                }
                if (iddd!=null){
                    response.sendRedirect(request.getContextPath()+ "/HeroesServlet?accion=listarinventario&id="+iddd);
                } else {
                    response.sendRedirect(request.getContextPath() + "/CatalogoServlet");
                }
                break;
            case ("add"):
                String nombre = request.getParameter("nombreobjeto");
                String peso = request.getParameter("pesoobjeto");
                String efecto = request.getParameter("efecto");
                boolean usado = false;
                int name = 0;
                int w = 0;
                int efect = 0;
                float weight = 0;
                int x2 = 0;
                if (nombre!=null){
                    x2 = objeto1.obRepetido(nombre);
                    if (x2==0){
                        name = 1;
                    }
                    else {
                        name = 0;
                        request.getSession().setAttribute("infonombre","Objeto ya registrado");
                    }
                } else {
                    name = 2;
                    request.getSession().setAttribute("infonombre","Campo Obligatorio");
                }
                if (peso!=null){
                    try {
                        weight = Float.parseFloat(peso);
                        w = 4;
                    }catch (NumberFormatException e){
                        w = 2;
                        request.getSession().setAttribute("infopeso","El peso debe ser un número decimal positivo");
                    }
                    if (w==4){
                        if (weight>0){
                            w=1;
                        } else {
                            w = 0;
                            request.getSession().setAttribute("infopeso","El peso debe ser positivo");
                        }
                    }
                } else {
                    w = 3;
                    request.getSession().setAttribute("infopeso","Campo Obligatorio");
                }
                if (efecto!=null){
                    efect = 1;
                } else {
                    efect = 0;
                    request.getSession().setAttribute("infoefecto","Campo Obligatorio");
                }
                if (name==1 & w==1 & efect==1){
                    objeto1.agregarObjeto(nombre,efecto, weight,usado);
                    response.sendRedirect(request.getContextPath() + "/CatalogoServlet?");
                } else {
                    request.getSession().setAttribute("infotodo","Campos llenados erroneamente");
                    response.sendRedirect(request.getContextPath()+"/CatalogoServlet?accion=addd");
                }
                break;
        }
    }

}
