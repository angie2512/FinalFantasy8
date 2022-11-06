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

    <title>Liberty NFT Marketplace - Explore Listing Page</title>

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
                    <a href="index.html" class="logo">
                        <img src="assets/images/finalfan.jpg" alt="">
                    </a>
                    <!-- ***** Logo End ***** -->
                    <!-- ***** Menu Start ***** -->
                    <ul class="nav">
                        <li><a href="index.html" >Principal</a></li>
                        <li><a href="heroes.html" class="active">Héroes</a></li>
                        <li><a href="enemigos.html">Enemigos</a></li>
                        <li><a href="hechizos.html">Hechizos</a></li>
                        <li><a href="catalogo.html">Catálogo de objetos</a></li>
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
        </div>
        <div class="col-lg-7">
            <form id="search-form" name="gs" method="submit" role="search" action="#">
                <div class="row">
                    <div class="col-lg-4">
                        <fieldset>
                            <input type="text" name="keyword" class="searchText" placeholder="Escribe el nombre de un héroe..." autocomplete="on" required style="width: 1070px;margin-left: 0rem;margin-top: 0.7rem">
                        </fieldset>
                    </div>

                    <div class="col-lg-2">
                        <fieldset>
                            <button class="main-button" style="margin-left: 830px;margin-top: 0.7rem;width: 84px" >Buscar</button>
                        </fieldset>
                    </div>
                    <div class="col-lg-2">
                            <button class="main-button" style="margin-left: 800px;margin-top: 0.7rem;width: 120px" >Añadir héroe</button>
                    </div>
                    <div class="container">
                        <table class="table" style="color: white;width: 1300px; margin-top: 100px">
                            <thead>

                            <tr>
                                <th>#</th>
                                <th>ID</th>
                                <th>Nombre</th>
                                <th>Edad</th>
                                <th>Género</th>
                                <th>Clase</th>
                                <th>Nivel Inicial</th>
                                <th>Ataque</th>
                                <th>ID Pareja</th>
                                <th>Ptos.Experiencia Inicial</th>
                            </tr>

                            <tbody>
                            <% int i = 1;
                                for (Heroes heroes : listaHeroes) { %>
                            <tr>
                                <td><%=i%>
                                </td>
                                <td><%=heroes.getIdHeroes()%>
                                </td>
                                <td><%=heroes.getNombre()%>
                                </td>
                                <td><%=heroes.getEdad()%>
                                </td>
                                <td><%=heroes.getGenero()%>
                                </td>
                                <td><%=heroes.getClase()%>
                                </td>
                                <td><%=heroes.getNivel()%>
                                </td>
                                <td><%=heroes.getAtaque()%>
                                </td>
                                <td><%=heroes.getIdPareja()%>
                                </td>
                                <td><%=heroes.getExperienciaInicial()%>
                                </td>
                            </tr>
                            <% i++;
                            }
                            %>
                            </tbody>
                            </thead>
                        </table>

                    </div>
                </div>
            </form>
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
