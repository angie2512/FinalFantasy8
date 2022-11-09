<%--
  Created by IntelliJ IDEA.
  User: Angie
  Date: 8/11/2022
  Time: 10:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.finalfantasy.Bean.Heroes" %>

<%
  Heroes heroes = (Heroes) request.getAttribute("editar");
%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="author" content="templatemo">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

  <title>Final Fantasy: Editar Héroe</title>

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
            <li><a href="<%=request.getContextPath()%>/HeroesServlet" class="active">Héroes</a></li>
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
          <h2>Edita tu<em> Héroe </em></h2>
        </div>
      </div>
    </div>
    <div class="page-content fade-in-up">
      <div class="col-md-6" style="margin: 0 auto">
        <div class="ibox" style="align-content: center">
          <div class="ibox-head">
            <div class="ibox-title">Datos del Héroe</div>
          </div>
          <div class="ibox-body">
            <form method="post" action="<%=request.getContextPath()%>/HeroesServlet?accion=editarHeroe&id=<%= heroes.getIdHeroes()%>">
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
                    <input type="text" class="form-control" id="floatingInputGrid1" placeholder="idheroe" aria-label="Disabled input example" disabled readonly>
                    <label for="floatingInputGrid1">Id Héroe: <%=heroes.getIdHeroes()%></label>
                  </div>
                </div>
                <div class="col-md">
                  <div class="form-floating" style="margin-bottom: 5px;">
                    <input type="text" class="form-control" id="floatingInputGrid2" placeholder="nombreHeroe" name="nombre">
                    <label for="floatingInputGrid2"> Nombre: <%=heroes.getNombre()%></label>
                  </div>
                </div>
              </div>
              <div class="row g-2">
                <div class="col-md">
                  <div class="form-floating" style="margin-bottom: 5px;">
                    <input type="text" class="form-control" id="floatingInputGrid3" placeholder="edadHeroe" name="edad">
                    <label for="floatingInputGrid3">Edad: <%=heroes.getEdad()%></label>
                  </div>
                </div>
                <div class="col-md">
                  <div class="form-floating" style="margin-bottom: 5px;">
                    <input type="text" class="form-control" id="floatingInputGrid4" placeholder="generoHeroe" name="genero">
                    <label for="floatingInputGrid4">Género: <%=heroes.getGenero()%></label>
                  </div>
                </div>
              </div>
              <div class="row g-2">
                <div class="col-md">
                  <div class="form-floating" style="margin-bottom: 5px;">
                    <input type="text" class="form-control" id="floatingInputGrid5" placeholder="claseheroe" name="clase">
                    <label for="floatingInputGrid4">Clase: <%=heroes.getClase()%></label>
                  </div>
                </div>
                <div class="col-md">
                  <div class="form-floating" style="margin-bottom: 5px;">
                    <input type="text" class="form-control" id="floatingInputGrid6" placeholder="nivelheroe" name="nivel">
                    <label for="floatingInputGrid6">Nivel Inicial: <%=heroes.getNivel()%></label>
                  </div>
                </div>
              </div>
              <div class="row g-2">
                <div class="col-md">
                  <div class="form-floating" style="margin-bottom: 5px;">
                    <input type="text" class="form-control" id="floatingInputGrid7" placeholder="ataqueheroe" name="ataque">
                    <label for="floatingInputGrid4">Ataque: <%=heroes.getAtaque()%></label>
                  </div>
                </div>
                <div class="col-md">
                  <div class="form-floating" style="margin-bottom: 5px;">
                    <input type="text" class="form-control" id="floatingInputGrid8" placeholder="parejaHeroe" name="pareja">
                      <% if(heroes.getPareja().getNombre()!=null) {%>
                      <label for="floatingInputGrid6">Pareja: <%=heroes.getPareja().getNombre()%></label>
                      <%} else {%>
                    <label for="floatingInputGrid6">Pareja: No tiene</label>
                      <%}%>
                  </div>
                </div>
                <div class="col-md">
                  <div class="form-floating" style="margin-bottom: 5px;">
                    <input type="text" class="form-control" id="floatingInputGrid10" placeholder="experienciaHeroe" name="experiencia">
                    <label for="floatingInputGrid6">Experiencia Inicial: <%=heroes.getExperienciaInicial()%></label>
                  </div>
                </div>
              </div>
              <div style="color:#FF0000;"><p text-align="center;" style="margin-top: 10px;" class="font-weight-bold">Todos los campos son obligatorios.</p></div>
              <div class="form-group">
                <button class="btn btn-primary" type="submit" >Confirmar Cambios</button>
                <a href="<%=request.getContextPath()%>/HeroesServlet?accion=listar" class="btn btn-secondary">Cancelar</a>
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
