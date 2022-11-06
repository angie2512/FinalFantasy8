<%--
  Created by IntelliJ IDEA.
  User: Labtel
  Date: 3/11/2022
  Time: 16:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                    <h2>Descubre algunos de nuestros <em> Objetos </em></h2>
                </div>
            </div>
            <div class="col-lg-7">
                <form id="search-form" name="gs" method="submit" role="search" action="#">
                    <div class="row">
                        <div class="col-lg-4">
                            <fieldset>
                                <input type="text" name="keyword" class="searchText" placeholder="Escribe el nombre de un objeto..." autocomplete="on" required style="width: 532px; margin-left: 2rem; margin-top: 0.7rem">
                            </fieldset>
                        </div>

                        <div class="col-lg-2">
                            <fieldset>
                                <button class="main-button" style="margin-left: 20rem; margin-top: 0.7rem" >Buscar</button>
                            </fieldset>
                        </div>
                        <div class="col-lg-2">
                            <fieldset>
                                <button class="main-button" style="margin-left: 20rem; margin-top: 0.7rem" >Añadir objeto</button>
                            </fieldset>
                        </div>
                    </div>
                </form>
            </div>
            <div class="col-lg-3">
                <div class="item">
                    <div class="row">
                        <div class="col-lg-12">
                <span class="author">
                  <img src="" alt="" style="max-width: 50px; max-height: 50px; border-radius: 50%;">
                </span>
                            <img src="assets/images/personaje1.jpg" alt="" style="border-radius: 20px;">
                            <h4>Mold</h4>
                        </div>
                        <div class="col-lg-12">
                            <div class="line-dec"></div>
                            <div class="row">
                                <div class="col-6">
                                    <span>Current Bid: <br> <strong>5.15 ETH</strong></span>
                                </div>
                                <div class="col-6">
                                    <span>Ends In: <br> <strong>26th Nov</strong></span>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="main-button">
                                <a href="enemigos.html">View Details</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="item">
                    <div class="row">
                        <div class="col-lg-12">
                <span class="author">
                  <img src="" alt="" style="max-width: 50px; max-height: 50px; border-radius: 50%;">
                </span>
                            <img src="assets/images/personaje2.jpg" alt="" style="border-radius: 20px;">
                            <h4>Erde</h4>
                        </div>
                        <div class="col-lg-12">
                            <div class="line-dec"></div>
                            <div class="row">
                                <div class="col-6">
                                    <span>Current Bid: <br> <strong>5.15 ETH</strong></span>
                                </div>
                                <div class="col-6">
                                    <span>Ends In: <br> <strong>26th Nov</strong></span>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="main-button">
                                <a href="enemigos.html">View Details</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="item">
                    <div class="row">
                        <div class="col-lg-12">
                <span class="author">
                  <img src="" alt="" style="max-width: 50px; max-height: 50px; border-radius: 50%;">
                </span>
                            <img src="assets/images/personaje3.jpg" alt="" style="border-radius: 20px">
                            <h4>Noctus</h4>
                        </div>
                        <div class="col-lg-12">
                            <div class="line-dec"></div>
                            <div class="row">
                                <div class="col-6">
                                    <span>Current Bid: <br> <strong>5.15 ETH</strong></span>
                                </div>
                                <div class="col-6">
                                    <span>Ends In: <br> <strong>26th Nov</strong></span>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="main-button">
                                <a href="enemigos.html">View Details</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="item">
                    <div class="row">
                        <div class="col-lg-12">
                            <img src="assets/images/personaje4.jpg" alt="" style="border-radius: 20px; margin-top: 7px">
                            <h4>Ravus</h4>
                        </div>
                        <div class="col-lg-12">
                            <div class="line-dec"></div>
                            <div class="row">
                                <div class="col-6">
                                    <span>Current Bid: <br> <strong>3.63 ETH</strong></span>
                                </div>
                                <div class="col-6">
                                    <span>Ends In: <br> <strong>24th Nov</strong></span>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="main-button">
                                <a href="enemigos.html">View Details</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="item">
                    <div class="row">
                        <div class="col-lg-12">
                            <img src="assets/images/personaje5.jpg" alt="" style="border-radius: 20px; margin-top: 7px">
                            <h4>Yuna</h4>
                        </div>
                        <div class="col-lg-12">
                            <div class="line-dec"></div>
                            <div class="row">
                                <div class="col-6">
                                    <span>Current Bid: <br> <strong>4.68 ETH</strong></span>
                                </div>
                                <div class="col-6">
                                    <span>Ends In: <br> <strong>28th Nov</strong></span>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="main-button">
                                <a href="enemigos.html">View Details</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="item">
                    <div class="row">
                        <div class="col-lg-12">
                            <img src="assets/images/personaje6.jpg" alt="" style="border-radius: 20px;margin-top: 7px">
                            <h4>Cindy</h4>
                        </div>
                        <div class="col-lg-12">
                            <div class="line-dec"></div>
                            <div class="row">
                                <div class="col-6">
                                    <span>Current Bid: <br> <strong>2.03 ETH</strong></span>
                                </div>
                                <div class="col-6">
                                    <span>Ends In: <br> <strong>25th Nov</strong></span>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="main-button">
                                <a href="enemigos.html">View Details</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="item">
                    <div class="row">
                        <div class="col-lg-12">
                            <img src="assets/images/personaje7.jpg" alt="" style="border-radius: 20px; margin-top: 7px">
                            <h4>Karl</h4>
                        </div>
                        <div class="col-lg-12">
                            <div class="line-dec"></div>
                            <div class="row">
                                <div class="col-6">
                                    <span>Current Bid: <br> <strong>2.03 ETH</strong></span>
                                </div>
                                <div class="col-6">
                                    <span>Ends In: <br> <strong>25th Nov</strong></span>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="main-button">
                                <a href="enemigos.html">View Details</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="item">
                    <div class="row">
                        <div class="col-lg-12">
                            <img src="assets/images/personaje8.jpg" alt="" style="border-radius: 20px; margin-top: 7px">
                            <h4>Ape</h4>
                        </div>
                        <div class="col-lg-12">
                            <div class="line-dec"></div>
                            <div class="row">
                                <div class="col-6">
                                    <span>Current Bid: <br> <strong>2.64 ETH</strong></span>
                                </div>
                                <div class="col-6">
                                    <span>Ends In: <br> <strong>25th Nov</strong></span>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="main-button">
                                <a href="enemigos.html">View Details</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
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