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

<%
    Enemigos enemigos = (Enemigos) request.getAttribute("editar");
%>

<!DOCTYPE html>

<html>
<head>

    <meta charset="utf-8">
    <meta name="author" content="templatemo">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

    <title>Final Fantasy: Editar Enemigo</title>

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
                        <li><a href="<%=request.getContextPath()%>/IndexServlet" >Principal</a></li>
                        <li><a href="<%=request.getContextPath()%>/HeroesServlet">H??roes</a></li>
                        <li><a href="<%=request.getContextPath()%>/EnemigosServlet" class="active">Enemigos</a></li>
                        <li><a href="<%=request.getContextPath()%>/HechizosServlet">Hechizos</a></li>
                        <li><a href="<%=request.getContextPath()%>/CatalogoServlet">Cat??logo de objetos</a></li>
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
                    <h2>Edita tu<em> Enemigo </em></h2>
                </div>
            </div>
        </div>
        <div class="page-content fade-in-up">
            <div class="col-md-6" style="margin: 0 auto">
                <div class="ibox" style="align-content: center">
                    <div class="ibox-head">
                        <div class="ibox-title">Datos del Enemigo</div>
                    </div>
                    <div class="row g-2">
                        <% if(session.getAttribute("infotodo")!= null) {%>
                        <div class="alert alert-danger" role="alert">
                            <%=session.getAttribute("infotodo")%>
                        </div>
                        <%session.removeAttribute("infotodo");%>
                        <%}%>
                    </div>
                    <div class="ibox-body">
                        <form method="post" action="<%=request.getContextPath()%>/EnemigosServlet?accion=editarEnemigo&villanoId=<%= enemigos.getIdVillanos()%>">
                            <div class="row g-2">
                                <div class="col-md">
                                    <div class="form-floating" style="margin-bottom: 5px;">
                                        <input type="text" class="form-control" id="floatingInputGrid1" placeholder="idenemigo" aria-label="Disabled input example" disabled readonly>
                                        <label for="floatingInputGrid1">Id Enemigo: <%=enemigos.getIdVillanos()%></label>
                                    </div>
                                </div>
                                <div class="col-md">
                                    <div class="form-floating" style="margin-bottom: 5px;">
                                        <input type="text" class="form-control" id="floatingInputGrid2" placeholder="nombreEnemigo" name="nombre">
                                        <label for="floatingInputGrid2"> Nombre: <%=enemigos.getNombre()%></label>
                                    </div>
                                </div>
                            </div>
                            <div class="row g-2">
                                <div class="col-md">
                                    <div class="form-floating" style="margin-bottom: 5px;">
                                        <input type="text" class="form-control" id="floatingInputGrid3" placeholder="ataqueEnemigo" name="ataque">
                                        <label for="floatingInputGrid3">Ataque: <%=enemigos.getAtaque()%></label>
                                    </div>
                                </div>
                                <div class="col-md">
                                    <div class="form-floating" style="margin-bottom: 5px;">
                                        <input type="text" class="form-control" id="floatingInputGrid4" placeholder="experienciaEnemigo" name="experiencia">
                                        <label for="floatingInputGrid4">Experiencia: <%=enemigos.getExperiencia()%></label>
                                    </div>
                                </div>
                            </div>
                            <div class="row g-2">
                                <div class="col-md">
                                    <div class="form-floating" style="margin-bottom: 5px;">
                                        <input type="text" class="form-control" id="floatingInputGrid5" placeholder="objetoEnemigo" name="objeto">
                                        <label for="floatingInputGrid4">Objeto: <%=enemigos.getObjeto()%></label>
                                    </div>
                                </div>
                                <div class="col-md">
                                    <div class="form-floating" style="margin-bottom: 5px;">
                                        <input type="text" class="form-control" id="floatingInputGrid6" placeholder="probabilidad" name="probabilidadObjeto">
                                        <label for="floatingInputGrid6">Probabilidad Objeto: <%=enemigos.getProbabilidadObjeto()%></label>
                                    </div>
                                </div>
                            </div>
                            <div class="row g-2">
                                <div class="col-md">
                                    <div class="form-floating" style="margin-bottom: 5px;">
                                        <input type="text" class="form-control" id="floatingInputGrid8" placeholder="generoEnemigo" name="genero">
                                        <label for="floatingInputGrid6">Genero: <%=enemigos.getGenero()%></label>
                                    </div>
                                </div>
                                <div class="col-md">
                                    <div class="form-floating" style="margin-bottom: 5px;">
                                        <input type="text" class="form-control" id="floatingInputGrid7" placeholder="idClase" name="claseId">
                                        <label for="floatingInputGrid4">ID Clase: <%=enemigos.getCase_idClase()%></label>
                                    </div>
                                </div>
                            </div>
                            <div style="color:#FF0000;"><p text-align="center;" style="margin-top: 10px;" class="font-weight-bold">Todos los campos son obligatorios.</p></div>
                            <div class="form-group">
                                <button class="btn btn-primary" type="submit" >Confirmar Cambios</button>
                                <a href="<%=request.getContextPath()%>/EnemigosServlet?accion=listar" class="btn btn-secondary">Cancelar</a>
                            </div>
                        </form>
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
