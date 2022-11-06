<%--
  Created by IntelliJ IDEA.
  User: Angie
  Date: 5/11/2022
  Time: 22:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="com.example.finalfantasy.Bean.Heroes" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>

<%
    ArrayList<Heroes> listaHeroes = (ArrayList <Heroes>) request.getAttribute("ListaHeroes");

%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="author" content="templatemo">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

    <title>Final Fantasy: Héroes</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">


    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="assets/css/fontawesome.css">
    <link rel="stylesheet" href="assets/css/templatemo-liberty-market.css">
    <link rel="stylesheet" href="assets/css/owl.css">
    <link rel="stylesheet" href="assets/css/animate.css">
    <link rel="stylesheet"href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>
    <!--

    TemplateMo 577 Liberty Market

    https://templatemo.com/tm-577-liberty-market

    -->
</head>

<body>

<!-- ***** Preloader Start ***** -->
<div id="js-preloader" class="js-preloader">
    <div class="preloader-inner">
        <span class="dot"></span>
        <div class="dots">
            <span></span>
            <span></span>
            <span></span>
        </div>
    </div>
</div>
<!-- ***** Preloader End ***** -->

<!-- ***** Header Area Start ***** -->
<header class="header-area header-sticky">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <nav class="main-nav">
                    <!-- ***** Logo Start ***** -->
                    <a href="<%=request.getContextPath()%>/IndexServlet" class="logo">
                        <img src="assets/images/finalfan.jpg" alt="">
                    </a>
                    <!-- ***** Logo End ***** -->
                    <!-- ***** Menu Start ***** -->
                    <ul class="nav">
                        <li><a href="<%=request.getContextPath()%>/IndexServlet">Principal</a></li>
                        <li><a href="<%=request.getContextPath()%>/HeroesServlet" class="active">Héroes</a></li>
                        <li><a href="<%=request.getContextPath()%>/EnemigosServlet">Enemigos</a></li>
                        <li><a href="<%=request.getContextPath()%>/HechizosServlet">Hechizos</a></li>
                        <li><a href="<%=request.getContextPath()%>/CatalogoServlet">Catálogo de objetos</a></li>
                    </ul>
                    <a class='menu-trigger'>
                        <span>Menu</span>
                    </a>
                    <!-- ***** Menu End ***** -->
                </nav>
            </div>
        </div>
    </div>
</header>
<!-- ***** Header Area End ***** -->


<div class="discover-items" style="padding-top: 140px">
    <div class="container">
        <div class="row">
            <div class="col-lg-5">
                <div class="section-heading">
                    <div class="line-dec"></div>
                    <h2>Lista de <em> Héroes </em></h2>
                </div>
            </div>
            <div class="col-lg-7" style="text-align: center">
                <div class="col-lg-2" style="padding-top: 5vh; margin: 0px auto;">
                    <fieldset>
                        <a type="button" class="btn btn-primary" href="<%=request.getContextPath()%>/HechizosServlet?accion=añadirhechizo">
                            <i class="bi bi-pencil-square">Añadir Hechizo</i>
                        </a>
                    </fieldset>
                </div>
            </div>
            <form id="search-form" name="gs" method="post" role="search" action="<%=request.getContextPath()%>/HeroesServlet">
                    <div class="col-lg-4">
                        <fieldset>
                            <input type="text" name="keyword" class="searchText" placeholder="Escribe el nombre de un héroe..." autocomplete="on" required style="width: 1140px;margin-top: 0.7rem">
                        </fieldset>
                    </div><div class="col-lg-2">
                        <div style="margin-top: 1px">
                        <fieldset>
                            <button class="main-button" type="submit" style="margin-left: 1170px;width: 120px;bottom: 46px" >Buscar</button>
                        </fieldset>
                        </div>
                    </div>
                    </form>
                    <div class="row">

                </div>
                    <div class="container">
                        <table class="table table-dark table-hover">
                            <thead>
                            <tr>
                                <th scope="col" class="text-center">ID</th>
                                <th scope="col" class="text-center">Nombre</th>
                                <th scope="col" class="text-center">Edad</th>
                                <th scope="col" class="text-center">Género</th>
                                <th scope="col" class="text-center">Clase</th>
                                <th scope="col" class="text-center">Nivel Inicial</th>
                                <th scope="col" class="text-center">Ataque</th>
                                <th scope="col" class="text-center">Pareja</th>
                                <th scope="col" class="text-center">Exp. Inicial</th>
                            </tr>
                            </thead>
                            <tbody>
                            <% int i = 1;
                                for (Heroes heroes : listaHeroes) { %>
                            <tr>
                                <td class="text-center" scope="row"> <%=heroes.getIdHeroes()%>
                                </td>
                                <td class="text-center"> <%=heroes.getNombre()%>
                                </td>
                                <td class="text-center"><%=heroes.getEdad()%>
                                </td>
                                <% if(heroes.getGenero().equals("F")) {%>
                                <td class="text-center">Femenino</td>
                                <%} else if (heroes.getGenero().equals("M")){%>
                                <td class="text-center">Masculino</td>
                                <%} else{ %>
                                <td class="text-center">Otro</td>
                                <%}%>
                                <td class="text-center"><%=heroes.getClase()%>
                                </td>
                                <td class="text-center"><%=heroes.getNivel()%>
                                </td>
                                <td class="text-center">
                                    <%=heroes.getAtaque()%>
                                </td>
                                <% if(heroes.getPareja().getNombre()!=null) {%>
                                   <td class="text-center"><%=heroes.getPareja().getNombre()%></td>
                                <%} else {%>
                                   <td class="text-center" >--Sin pareja--</td>
                                <%}%>
                                <td class="text-center">
                                    <%=heroes.getExperienciaInicial()%>
                                </td>
                                <td class="text-center">
                                    <a type="button" class="btn btn-danger"
                                       onclick="return confirm('¿Estas seguro(a) que deseas borrar?')"
                                       href="<%=request.getContextPath()%>/HeroesServlet?accion=borrar&id=<%= heroes.getIdHeroes()%>">
                                        <i class="bi bi-trash">Borrar</i>
                                    </a>
                                </td>
                            </tr>
                            <% i++;
                            }
                            %>
                            </tbody>
                        </table>
                    </div>
        </div>
    </div>



<!-- Scripts -->
<!-- Bootstrap core JavaScript -->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.min.js"></script>

<script src="assets/js/isotope.min.js"></script>
<script src="assets/js/owl-carousel.js"></script>

<script src="assets/js/tabs.js"></script>
<script src="assets/js/popup.js"></script>
<script src="assets/js/custom.js"></script>

</body>
</html>
