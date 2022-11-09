package com.example.finalfantasy.Servlet;


import com.example.finalfantasy.Bean.Hechizos;
import com.example.finalfantasy.Bean.Heroes;
import com.example.finalfantasy.Bean.Objetos;
import com.example.finalfantasy.Bean.ObjetoHasHeroes;
import com.example.finalfantasy.Daos.HechizoDao;
import com.example.finalfantasy.Daos.HeroeDao;
import com.example.finalfantasy.Daos.ObjetosDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;


@WebServlet(name = "HeroesServlet", value = "/HeroesServlet")
public class HeroesServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("accion") == null?"listar":request.getParameter("accion");
        HeroeDao heroeDao = new HeroeDao();
        ObjetosDao ob = new ObjetosDao();
        RequestDispatcher view;

        switch (action){
            case ("editarObjeto"):
                String idobjeto1 = request.getParameter("idd");
                String idHeroe1 = request.getParameter("idH");
                try {
                    int idO = Integer.parseInt(idobjeto1);
                    int idh = Integer.parseInt(idHeroe1);
                    Objetos ob1 = ob.obtenerObjeto(idO);
                    if(ob1 == null){
                        System.out.println("Objeto nulo");
                        System.out.println(idHeroe1);
                        response.sendRedirect(request.getContextPath()+ "/HeroesServlet?accion=listarinventario&id="+idHeroe1);
                    }else{
                        request.setAttribute("editar",ob1);
                        System.out.println("Objeto no nulo");
                        System.out.println(idHeroe1);
                        System.out.println(idO);
                        Heroes hero1 = heroeDao.obtenerHeroe(idh);
                        request.setAttribute("hero",hero1);
                        view = request.getRequestDispatcher("editarobjeto.jsp");
                        view.forward(request, response);
                    }
                    break;
                }catch (NumberFormatException e){
                    response.sendRedirect(request.getContextPath()+ "/HeroesServlet?accion=listarinventario&id="+idHeroe1);
                }
                break;
            case ("borrarObjeto"):
                String idobjeto = request.getParameter("idd");
                String idHeroe = request.getParameter("idH");
                try {
                    int idO = Integer.parseInt(idobjeto);
                    int idH = Integer.parseInt(idHeroe);
                    heroeDao.borrarObjeto(idO, idH);
                    System.out.println("NOBORRA");
                    response.sendRedirect(request.getContextPath()+ "/HeroesServlet?accion=listarinventario&id="+idH);
                }catch (NumberFormatException e){
                    response.sendRedirect(request.getContextPath()+ "/HeroesServlet?accion=listarinventario&id="+idHeroe);
                }
                break;
            case ("editar"):
                String id= request.getParameter("id");
                String nombre = request.getParameter("Nombre");
                String edad = request.getParameter("Edad");
                String genero = request.getParameter("Genero");
                String nivel = request.getParameter("Nivel");
                String ataque = request.getParameter("Ataque");
                String clase = request.getParameter("Clase");
                String exp = request.getParameter("ExperienciaInicial");
                int name = 0;
                int edad1 = 0;
                int genero1 = 0;
                int nivel1 = 0;
                int ataque1 = 0;
                int clase1 = 0;
                int exp1 = 0;
                int h = Integer.parseInt(id);
                Heroes he = heroeDao.obtenerHeroe(h);
                if(he == null){
                    response.sendRedirect(request.getContextPath() + "/HeroesServlet");
                }else{
                    request.setAttribute("editar",he);
                    view = request.getRequestDispatcher("editarHeroe.jsp");
                    view.forward(request, response);
                }
                break;

            case "listar":
                request.setAttribute("ListaHeroes", heroeDao.listarHeroes());
                view = request.getRequestDispatcher("menuHeroes.jsp");
                view.forward(request, response);
                break;

            case "listarinventario":
                String id1= request.getParameter("id");
                int idd = Integer.parseInt(id1);
                ArrayList<ObjetoHasHeroes> listaInventario = heroeDao.listarInventario(idd);
                request.setAttribute("listaInventario", listaInventario);
                view = request.getRequestDispatcher("inventarioinicial.jsp");
                view.forward(request, response);
                break;
            case ("add"):
                view = request.getRequestDispatcher("/añadirHeroe.jsp");
                view.forward(request,response);
                break;
            case ("borrar"):
                String spell = request.getParameter("id");
                try {
                    int spella = Integer.parseInt(spell);
                    heroeDao.eliminarHeroe(spella);
                    response.sendRedirect(request.getContextPath()+ "/HeroesServlet");
                }catch (NumberFormatException e){
                    response.sendRedirect(request.getContextPath()+ "/HeroesServlet");
                }
                break;


        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String accion = request.getParameter("accion");
        HeroeDao heroeDao1 = new HeroeDao();
        RequestDispatcher view;

        switch (accion){
            case ("editarHeroe"):
                String id= request.getParameter("id");
                int idd = Integer.parseInt(id);
                String edad1 = request.getParameter("edad");
                String nombre1 = request.getParameter("nombre");
                String genero1 = request.getParameter("genero");
                String nivel1 = request.getParameter("nivel");
                String ataque1 = request.getParameter("ataque");
                String clase1 = request.getParameter("clase");
                String idPareja1 = request.getParameter("pareja");
                String experienca1 = request.getParameter("experiencia");
                response.sendRedirect(request.getContextPath() + "/HeroesServlet");
                try{
                    int edadh = Integer.parseInt(edad1);
                    int nivelh = Integer.parseInt(nivel1);
                    int ataqueh = Integer.parseInt(ataque1);
                    int parejah = Integer.parseInt(idPareja1);
                    float experienciah = Float.parseFloat(experienca1);
                    heroeDao1.actualizar(idd,edadh,nombre1,genero1,nivelh,ataqueh,clase1,parejah,experienciah);
                    response.sendRedirect(request.getContextPath() + "/HeroesServlet?");
                } catch (NumberFormatException e) {
                    request.getSession().setAttribute("infotodo","Campos llenados erroneamente");
                    response.sendRedirect(request.getContextPath() + "/HeroesServlet?accion=editarHeroe&id="+id);
                }
                break;

            case("buscar"):
                String buscar = request.getParameter("keyword");
                ArrayList<Heroes> listaFiltrada =heroeDao1.buscarPorNombre(buscar);
                request.setAttribute("ListaHeroes",listaFiltrada);
                view = request.getRequestDispatcher("/menuHeroes.jsp");
                view.forward(request,response);
                break;

            case ("añadir"):
                String nombre = request.getParameter("nombreheroe");
                String edad = request.getParameter("edadheroe");
                String genero = request.getParameter("generoheroe");
                String clase = request.getParameter("claseheroe");
                String nivel = request.getParameter("nivelheroe");
                String ataque = request.getParameter("ataqueheroe");
                String pareja = request.getParameter("parejah");
                String experiencia = request.getParameter("experienciah");
                try{
                    int edadh = Integer.parseInt(edad);
                    int nivelh = Integer.parseInt(nivel);
                    int ataqueh = Integer.parseInt(ataque);
                    int parejah = Integer.parseInt(pareja);
                    int experienciah = Integer.parseInt(experiencia);
                    Heroes newheroe = new Heroes();
                    newheroe.setNombre(nombre);
                    newheroe.setEdad(edadh);
                    newheroe.setGenero(genero);
                    newheroe.setNivel(nivelh);
                    newheroe.setAtaque(ataqueh);
                    newheroe.setClase(clase);
                    newheroe.setIdPareja(parejah);
                    newheroe.setExperienciaInicial(experienciah);
                    heroeDao1.añadirHeroes(newheroe);
                    response.sendRedirect(request.getContextPath() + "/HeroesServlet?");
                } catch (NumberFormatException e) {
                    request.getSession().setAttribute("infotodo","Campos llenados erroneamente");
                    response.sendRedirect(request.getContextPath() + "/HeroesServlet?accion=add");
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
        }


        }
}
