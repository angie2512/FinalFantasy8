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
                        <li><a href="<%=request.getContextPath()%>/IndexServlet" >Principal</a></li>
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
                    <h2>¡Añade todos los <em> Objetos </em> que quieras!</h2>
                </div>
            </div>
            </div>
            <div class="page-content fade-in-up">
                <div class="col-md-6" style="margin: 0 auto">
                    <div class="ibox" style="align-content: center">
                        <div class="ibox-head">
                            <div class="ibox-title">Datos de Objeto</div>
                        </div>
                        <div class="ibox-body">
                            <form method="post" action="<%=request.getContextPath()%>/CatalogoServlet?accion=add">
                                <div class="row g-2">
                                    <% if(session.getAttribute("infotodo")!= null) {%>
                                    <div class="alert alert-danger" role="alert">
                                        <%=session.getAttribute("infotodo")%>
                                    </div>
                                    <%session.removeAttribute("infotodo");%>
                                    <%}%>
                                </div>
                                <div class="row g-2">
                                    <div class="col-md">
                                        <div class="form-floating" style="margin-bottom: 5px;">
                                            <input type="text" class="form-control" id="floatingInputGrid1" placeholder="Nombre" name="nombreobjeto" required>
                                            <label for="floatingInputGrid1">Nombre del Objeto</label>
                                        </div>
                                        <% if(session.getAttribute("infonombre") != null) {%>
                                        <div class="alert alert-danger" role="alert">
                                            <%=session.getAttribute("infonombre")%>
                                        </div>
                                        <%session.removeAttribute("infonombre");%>
                                        <% }%>
                                    </div>
                                    <div class="col-md">
                                        <div class="form-floating" style="margin-bottom: 5px;">
                                            <input type="text" class="form-control" id="floatingInputGrid2" placeholder="peso" name="pesoobjeto" required>
                                            <label for="floatingInputGrid2">Peso</label>
                                        </div>
                                        <% if(session.getAttribute("infopeso") != null) {%>
                                        <div class="alert alert-danger" role="alert">
                                            <%=session.getAttribute("infopeso")%>
                                        </div>
                                        <%session.removeAttribute("infopeso"); %>
                                        <% }%>
                                    </div>
                                </div>
                                <div class="row g-2">
                                    <div class="col-md">
                                        <div class="form-floating" style="margin-bottom: 5px;">
                                            <input type="text" class="form-control" id="floatingInputGrid3" placeholder="efecto" name="efecto" required>
                                            <label for="floatingInputGrid3">Efecto/Uso</label>
                                        </div>
                                        <% if(session.getAttribute("infoefecto") != null) {%>
                                        <div class="alert alert-danger" role="alert">
                                            <%=session.getAttribute("infoefecto")%>
                                        </div>
                                        <%session.removeAttribute("infoefecto"); %>
                                        <% }%>
                                    </div>
                                </div>
                                <div style="color:#6530bb;"><p text-align="center;" style="margin-top: 10px;" class="font-weight-bold">Todos los campos son obligatorios.</p></div>
                                <div class="form-group">
                                    <button class="btn btn-primary" type="submit" >Añadir</button>
                                    <a href="<%=request.getContextPath()%>/CatalogoServlet?accion=listar" class="btn btn-secondary">Cancelar</a>
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