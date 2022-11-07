<%--
  Created by IntelliJ IDEA.
  User: Labtel
  Date: 3/11/2022
  Time: 16:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.finalfantasy.Bean.Objetos" %>

<%
    ArrayList<Objetos> listaobjetos = (ArrayList<Objetos>) request.getAttribute("listaObjetos");
%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="author" content="templatemo">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

    <title>Final Fantasy: Catalogo Objetos</title>

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
                        <li><a href="<%=request.getContextPath()%>/HeroesServlet">Héroes</a></li>
                        <li><a href="<%=request.getContextPath()%>/EnemigosServlet">Enemigos</a></li>
                        <li><a href="<%=request.getContextPath()%>/HechizosServlet">Hechizos</a></li>
                        <li><a href="<%=request.getContextPath()%>/CatalogoServlet" class="active">Catálogo de objetos</a></li>
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
                    <h2>Descubre algunos de nuestros <em> Objetos </em></h2>
                </div>
            </div>
            <div class="col-lg-7" style="text-align: center;">
                <div class="col-lg-2" style="padding-top: 5vh; margin: 0px auto;">
                    <fieldset>
                        <a type="button" class="btn btn-primary" href="<%=request.getContextPath()%>/CatalogoServlet?accion=añadirobjeto">
                            <i class="bi bi-pencil-square">Añadir Objeto</i>
                        </a>
                    </fieldset>
                </div>
            </div>
            <table class="table table-dark table-hover">
                <thead>
                <tr>
                    <th scope="col" class="text-center">Id</th>
                    <th scope="col" class="text-center">Nombre</th>
                    <th scope="col" class="text-center">Efecto/Uso</th>
                    <th scope="col" class="text-center">Peso</th>
                    <th scope="col" class="text-center">Usado por un héroe</th>
                    <th scope="col" class="text-center">Editar</th>
                    <th scope="col" class="text-center">Borrar</th>
                </tr>
                </thead>
                <tbody>
                <% for(Objetos obj : listaobjetos) {%>
                <tr>
                    <th class="text-center" scope="row"><%= obj.getIdObjetos()%></th>
                    <td class="text-center"><%= obj.getNombreObjeto()%></td>
                    <td class="text-center"><%= obj.getEfecto()%></td>
                    <td class="text-center"><%= obj.getPeso()%></td>
                    <td class="text-center"><%= obj.getUse()%></td>
                    <td class="text-center">
                        <a type="button" class="btn btn-danger", style="background-color: #7453fc; border-color: #7453fc"
                           href="<%=request.getContextPath()%>/CatalogoServlet?accion=editar&id=<%= obj.getIdObjetos()%>">
                            <i class="fa-solid fa-pen"></i>
                        </a>
                    </td>
                    <td class="text-center">
                        <a type="button" class="btn btn-danger", style="background-color: #7453fc; border-color: #7453fc"
                           onclick="return confirm('¿Estas seguro(a) que deseas borrar?')"
                           href="<%=request.getContextPath()%>/CatalogoServlet?accion=borrar&id=<%= obj.getIdObjetos()%>">
                            <i class="fa-solid fa-trash"></i>
                        </a>
                    </td>
                </tr>
                <% }%>
                </tbody>
            </table>
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