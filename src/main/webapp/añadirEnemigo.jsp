<%--
  Created by IntelliJ IDEA.
  User: alexia
  Date: 7/11/2022
  Time: 10:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.finalfantasy.Bean.Enemigos" %>


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
                        <li><a href="<%=request.getContextPath()%>/IndexServlet" class="active">Enemigos</a></li>
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
                    <h2>Crea tu propio <em> Enemigo </em></h2>
                </div>
            </div>
        </div>
        <div class="page-content fade-in-up">
            <div class="col-md-6" style="margin: 0 auto">
                <div class="ibox" style="align-content: center">
                    <div class="ibox-head">
                        <div class="ibox-title" style="color:white">¡Llena los datos de tu Enemigo!</div>
                    </div>

                    <% if(session.getAttribute("infotodo")!= null) {%>
                    <div class="row g-2">
                        <div class="alert alert-danger" role="alert">
                            <%=session.getAttribute("infotodo")%>
                        </div>
                    </div>
                    <%session.removeAttribute("infotodo");%>
                    <%}%>

                    <div class="ibox-body">
                        <form method="post" action="<%=request.getContextPath()%>/EnemigosServlet?accion=add">
                            <div class="row g-2">
                                <div class="col-md">
                                    <div class="form-floating" style="margin-bottom: 5px;">
                                        <input type="text" class="form-control" id="floatingInputGrid1" placeholder="Nombre" name="nombreEnemigo">
                                        <label for="floatingInputGrid1">Nombre del Enemigo</label>
                                    </div>
                                </div>
                                <div class="col-md">
                                    <div class="form-floating" style="margin-bottom: 5px;">
                                        <input type="text" class="form-control" id="floatingInputGrid" placeholder="ataque" name="ataqueEnemigo">
                                        <label for="floatingInputGrid1">Ataque</label>
                                    </div>
                                </div>
                                <div class="col-md">
                                    <div class="form-floating">
                                        <select class="form-select" id="floatingSelectGrid1" name="generoEnemigo">
                                            <option selected>Elige</option>
                                            <option value="M">M</option>
                                            <option value="F">F</option>
                                            <option value="O">O</option>
                                        </select>
                                        <label for="floatingSelectGrid1">Genero</label>
                                    </div>
                                </div>
                            </div>
                            <div class="row g-2">
                                <div class="col-md">
                                    <div class="form-floating" style="margin-bottom: 5px;">
                                        <input type="text" class="form-control" id="floatingInputGrid3" placeholder="Experiencia" name="experienciaEnemigo">
                                        <label for="floatingInputGrid3">Experiencia</label>
                                    </div>
                                </div>
                                <div class="col-md">
                                    <div class="form-floating" style="margin-bottom: 5px;">
                                        <input type="text" class="form-control" id="floatingInputGrid4" placeholder="Objeto" name="objetoEnemigo">
                                        <label for="floatingInputGrid4">Objeto</label>
                                    </div>
                                </div>
                            </div>
                            <div class="row g-2">
                                <div class="col-md">
                                    <div class="form-floating" style="margin-bottom: 5px;">
                                        <input type="text" class="form-control" id="floatingInputGrid5" placeholder="ProbabilidadObjeto" name="probabilidadEnemigo">
                                        <label for="floatingInputGrid4">Probabilidad del Objeto</label>
                                    </div>
                                </div>
                                <div class="col-md">
                                    <div class="form-floating" style="margin-bottom: 5px;">
                                        <input type="text" class="form-control" id="floatingInputGrid6" placeholder="ClaseID" name="idClaseEnemigo">
                                        <label for="floatingInputGrid6">ID de la Clase</label>
                                    </div>
                                </div>

                            </div>

                            <div style="color:#FF0000;"><p text-align="center;" style="margin-top: 10px;" class="font-weight-bold">Todos los campos son obligatorios.</p></div>
                            <div class="form-group">
                                <button class="btn btn-primary" type="submit" >Añadir</button>
                                <a href="<%=request.getContextPath()%>/EnemigosServlet?" class="btn btn-secondary">Cancelar</a>
                            </div>
                        </form>
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
