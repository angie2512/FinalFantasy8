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

    <title>Final Fantasy: Heroe</title>

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
                    <h2>Lista de <em> Héroes </em></h2>
                </div>
                </div>
            </div>
            <div class="col-lg-7">
                <form id="search-form" name="gs" method="submit" role="search" action="#">
                    <div class="row">
                        <div class="col-lg-4">
                            <fieldset>
                                <input type="text" name="keyword" class="searchText" placeholder="Escribe el nombre de un héroe..." autocomplete="on" required style="width: 532px; margin-left: 2rem; margin-top: 0.7rem">
                            </fieldset>
                        </div>

                        <div class="col-lg-2">
                            <fieldset>
                                <button class="main-button" style="margin-left: 20rem; margin-top: 0.7rem" >Buscar</button>
                            </fieldset>
                        </div>
                        <div class="col-lg-2">
                            <fieldset>
                                <button class="main-button" style="margin-left: 20rem; margin-top: 0.7rem" >Añadir héroe</button>
                            </fieldset>
                        </div>
                        <div class="container">
                            <table class="table">
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th>id</th>
                                    <th>nombre</th>
                                    <th>apellido</th>
                                    <th>email</th>
                                </tr>

                                <tbody>
                                <% int i = 1;
                                    for (Heroes heroes : listaHeroes) { %>
                                <tr>
                                    <td><%=i%>
                                    </td>
                                    <td><%=heroes.getIdHeroe()%>
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
                                    <td><%=heroes.getPareja()%>
                                    </td>
                                    <td><%=heroes.getExperiencia()%>
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
