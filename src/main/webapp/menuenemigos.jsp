<%@ page import="com.example.finalfantasy.Bean.Enemigos" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: Labtel
  Date: 3/11/2022
  Time: 16:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    ArrayList<Enemigos> listaEnemigos = (ArrayList<Enemigos>) request.getAttribute("listaEnemigos");
%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="author" content="templatemo">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

    <title>Final Fantasy: Enemigos</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">


    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="assets/css/fontawesome.css">
    <link rel="stylesheet" href="assets/css/templatemo-liberty-market.css">
    <link rel="stylesheet" href="assets/css/owl.css">
    <link rel="stylesheet" href="assets/css/animate.css">
    <link rel="stylesheet"href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>

    <script src="https://kit.fontawesome.com/46baa8e193.js" crossorigin="anonymous"></script>
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
                        <li><a href="<%=request.getContextPath()%>/EnemigosServlet" class="active">Enemigos</a></li>
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
                    <h2>Lista de <em> Enemigos </em></h2>
                </div>
            </div>
            <div class="col-lg-7" style="text-align: center">
                <div class="col-lg-2" style="padding-top: 5vh; margin: 0px auto;">
                    <fieldset>
                        <h4 style="width: 250px; border-top-width: 100px; height: 0.05rem; margin-left: 40px">¡Crea tu propio Enemigo!</h4>
                        <a type="button" class="btn btn-primary" href="<%=request.getContextPath()%>/EnemigosServlet?accion=añadirheroe" style="margin-left: 300px;width: 126px; background-color: #7453fc; border-color: #7453fc">
                            <i class="bi bi-pencil-square">Añadir Enemigo</i>
                        </a>
                    </fieldset>
                </div>
            </div>
            <form id="search-form" name="gs" method="post" role="search" action="<%=request.getContextPath()%>/EnemigosServlet?accion=buscar">
                <div class="col-lg-4">
                    <fieldset>
                        <input type="text" name="keyword" class="searchText" placeholder="Escribe el nombre de un héroe..." autocomplete="on" required style="width: 1140px;margin-top: 0.7rem">
                    </fieldset>
                </div>
                <div class="col-lg-2">
                    <fieldset>
                        <button class="main-button" type="submit" style="margin-left: 1170px;width: 120px;bottom: 46px" >Buscar</button>
                    </fieldset>
                </div>
            </form>
            <table class="table table-dark table-hover">
                <thead>
                <tr>
                    <th scope="col" class="text-center">Id</th>
                    <th scope="col" class="text-center">Nombre</th>
                    <th scope="col" class="text-center">Ataque</th>
                    <th scope="col" class="text-center">Experiencia</th>
                    <th scope="col" class="text-center">Objeto</th>
                    <th scope="col" class="text-center">Clase</th>
                    <th scope="col" class="text-center">Probabilidad Objeto</th>
                    <th scope="col" class="text-center">Genero</th>
                    <th scope="col" class="text-center">Editar</th>
                    <th scope="col" class="text-center">Borrar</th>
                </tr>
                </thead>
                <tbody>
                <% for(Enemigos enem : listaEnemigos) {%>
                <tr>
                    <th class="text-center" scope="row"><%= enem.getIdVillanos()%></th>
                    <td class="text-center"><%= enem.getNombre()%></td>
                    <td class="text-center"><%= enem.getAtaque()%></td>
                    <td class="text-center"><%= enem.getExperiencia()%></td>
                    <td class="text-center"><%= enem.getObjeto()%></td>
                    <td class="text-center"><%= enem.getClase()%></td>
                    <td class="text-center"><%= enem.getProbabilidadObjeto()%></td>
                    <% if(enem.getGenero().equals("F")) {%>
                    <td class="text-center">Femenino</td>
                    <%} else if (enem.getGenero().equals("M")){%>
                    <td class="text-center">Masculino</td>
                    <%} else if (enem.getGenero().equals("O")){ %>
                    <td class="text-center">Otro</td>
                    <%} else{ %>
                    <td class="text-center">-</td>
                    <%}%>

                    <td class="text-center">
                        <a type="button" class="btn btn-danger", style="background-color: #7453fc; border-color: #7453fc"
                           href="<%=request.getContextPath()%>/EnemigosServlet<%= enem.getIdVillanos()%>">
                            <i class="fa-solid fa-pen"></i></i>
                        </a>
                    </td>
                    <td class="text-center">
                        <a type="button" class="btn btn-danger", style="background-color: #7453fc; border-color: #7453fc"
                           onclick="return confirm('¿Estas seguro(a) que deseas borrar?')"
                           href="<%=request.getContextPath()%>/EnemigosServlet?accion=borrar&id=<%=enem.getIdVillanos()%>">
                            <i class="fa-solid fa-trash"></i>
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