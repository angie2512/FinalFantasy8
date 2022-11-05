<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="author" content="templatemo">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

    <title>Final Fantasy</title>

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
                        <li><a href="index.html" class="active">Principal</a></li>
                        <li><a href="<%=request.getContextPath()%>/HeroesServlet">Héroes</a></li>
                        <li><a href="enemigos.html">Enemigos</a></li>
                        <li><a href="hechizos.html.html">Hechizos</a></li>
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

<!-- ***** Main Banner Area Start ***** -->
<div class="main-banner">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 align-self-center">
                <div class="header-text">

                    <div class="card"  style="width: 40.5rem; height: 20rem; margin-top: 0rem;background-color: #00000090;">
                        <div class="container">
                            <p>
                            <p></p>
                            <div align = "left">
                                <h4> Final Fantasy Games </h4>
                                <p></p>
                                <h3>¡Todo lo que debes saber del juego!</h3>
                                <p></p>
                                <h4>Niveles, Experiencia, Debilidades, Fortalezas Potencia &amp; más.</h4>
                                <p>Tendrás la oportunidad de elegir si quieres ser héroe o villano, en esta wiki podrás descubrir detalles sobre la clase, la experiencia, el ataque, los objetos guardados y los hechizos de tu personaje</p>
                            </div>
                        </div>
                        <p></p>

                    </div>

                    <div class="buttons">
                        <div class="border-button">
                            <a href="https://www.youtube.com/watch?v=Pm67u0wQFe4">Tráiler: Última Saga</a>
                        </div>
                        <div class="main-button">
                            <a href="https://store.steampowered.com/agecheck/app/39210/?l=spanish" target="_blank">Compra Online</a>

                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-5 offset-lg-1">
                <div class="owl-banner owl-carousel">
                    <div class="item">
                        <img src="assets/images/heroe.jpg" alt="">
                    </div>
                    <div class="item">
                        <img src="assets/images/villano.jpg" alt="">
                    </div>
                    <div clas="item">
                        <img src="assets/images/objeto.jpg" alt="">
                    </div>
                    <div clas="item">
                        <img src="assets/images/hechizo.jpg" alt="">
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