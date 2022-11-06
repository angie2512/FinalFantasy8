<%--
  Created by IntelliJ IDEA.
  User: Labtel
  Date: 3/11/2022
  Time: 16:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.finalfantasy.Bean.Hechizos" %>

<%
    ArrayList<Hechizos> listaHechizos = (ArrayList<Hechizos>) request.getAttribute("listaHechizos");
%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="author" content="templatemo">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

    <title>Final Fantasy: Hechizos</title>

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
                        <li><a href="<%=request.getContextPath()%>/IndexServlet" class="active">Principal</a></li>
                        <li><a href="<%=request.getContextPath()%>/HeroesServlet">Héroes</a></li>
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
                    <h2>Descubre algunos de nuestros <em> Hechizos </em></h2>
                </div>
            </div>
            <div class="col-lg-7">
                <form id="search-form" name="gs" method="post" role="search">
                    <div class="row">
                        <div class="col-lg-4">
                            <fieldset>
                                <input type="text" name="keyword" class="searchText" placeholder="Escribe el nombre de un hechizo..." autocomplete="on" required style="width: 532px; margin-left: 2rem; margin-top: 0.7rem">
                            </fieldset>
                        </div>
                        <div class="col-lg-2">
                            <fieldset>
                                <button class="main-button" action="<%=request.getContextPath()%>/HechizosServlet?accion=buscar" style="margin-left: 20rem; margin-top: 0.7rem" >Buscar</button>
                            </fieldset>
                        </div>
                        <div class="col-lg-2">
                            <fieldset>
                                <button class="main-button" action="<%=request.getContextPath()%>/HechizosServlet?accion=añadirhechizo" style="margin-left: 20rem; margin-top: 0.7rem" >Añadir hechizo</button>
                            </fieldset>
                        </div>
                    </div>
                </form>
            </div>
            <table class="table table-dark table-hover">
                <thead>
                <tr>
                    <th scope="col" class="text-center">Id</th>
                    <th scope="col" class="text-center">Nombre</th>
                    <th scope="col" class="text-center">Elemento</th>
                    <th scope="col" class="text-center">Potencia</th>
                    <th scope="col" class="text-center">Precisión</th>
                    <th scope="col" class="text-center">Hechizo Base</th>
                    <th scope="col" class="text-center">Nivel de Aprendizaje</th>
                    <th scope="col" class="text-center">Borrar</th>
                </tr>
                </thead>
                <tbody>
                <% for(Hechizos hechi : listaHechizos) {%>
                <tr>
                    <th class="text-center" scope="row"><%= hechi.getIdHechizos()%></th>
                    <td class="text-center"><%= hechi.getNombreHechizo()%></td>
                    <td class="text-center"><%= hechi.getElemento()%></td>
                    <td class="text-center"><%= hechi.getPotencia()%></td>
                    <td class="text-center"><%= hechi.getPrecision()%></td>
                    <td class="text-center"><%= hechi.getBase()%></td>
                    <td class="text-center"><%= hechi.getNivelAprendizaje()%></td>
                    <td class="text-center">
                        <a type="button" class="btn btn-danger"
                           onclick="return confirm('¿Estas seguro(a) que deseas borrar?')"
                           href="<%=request.getContextPath()%>/AdminServlet?accion=borrar&id=<%= hechi.getIdHechizos()%>">
                            <i class="bi bi-trash">Borrar</i>
                        </a>
                    </td>
                </tr>
                <% }%>
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

