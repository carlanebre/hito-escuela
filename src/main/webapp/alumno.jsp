<%--
  Created by IntelliJ IDEA.
  User: carlanebre
  Date: 26/10/23
  Time: 12:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<% String nombreUsuario = (String) session.getAttribute("nombreUsuario"); %>
<% String rol = (String) session.getAttribute("rol"); %>

<% if ("profesor".equals(rol)) { %> <!-- Si es profesor -->
<jsp:include page="private.jsp" />
<% } else if (rol == null) { %> <!-- Si no está iniciada sesión como nada -->
<jsp:include page="private.jsp" />
<% } else { %>
<!-- Contenido específico para alumnos -->

<html>
<head>
  <title>Alumno</title>

  <link rel="shortcut icon" href="img/favicon.ico">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
  <link rel="stylesheet" type="text/css" href="css/estilos.css">
</head>
<body id="custom">
<div class="header-custom">
  <div class="container">
    <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-between py-3">

      <a href="login.jsp" class="nav-link px-2 link-dark">
        <span class="nav-icon"><ion-icon name="school"></ion-icon></span>
        <span class="title-gestor">Gestor de calificaciones</span>
      </a>

      <div class="flex-vertical-center">
        <div class="nav-group flex-vertical-center">
          <p class="user-name"><% if (nombreUsuario != null) { %>
            Bienvenido, <%= nombreUsuario %>
            <% } else { %>
            No se ha iniciado sesión como alumno
            <% } %></p>
          <a href="#" class="btn-round">
            <span></span>
            <ion-icon class="nav-user" name="person"></ion-icon>
          </a>

        </div>
        <div class="col-md-3 text-end btns-custom">
          <a href="login.html"><button type="button" class="btn btn-outline-primary btn-negativo">Salir</button>
          </a>
        </div>
      </div>
    </header>
  </div>
</div><!--end of header-custom-->

<div class="container container-usuario px-4 py-5">
  <div class="row">
    <!-- Columna que ocupa el 30% -->
    <div class="col-4">
      <div class="column--bar">
        <div class="bar bar-profile">
          <h3>Mi perfil</h3>
          <div class="profile-picture" style="background-image: url('img/defaultpic.png');"></div>
          <h2 class="ficha-name">Mariuska Marín</h2>
        </div><!--end of bar-->
      </div><!--end of column--bar-->
    </div><!--end of col-4-->

    <!-- Columna que ocupa el 70% -->
    <div class="col-8">
      <div class="ficha mb-5">
        <h3>Ficha de alumno</h3>
        <h2 class="ficha-name">Mis calificaciones</h2>

        <div class="list__container">
          <div class="list__shadow"></div>

          <div class="list__wrapper">
            <div class="list">
              <div class="list__row list__row--header">
                <div class="list__cell"></div>
                <div class="list__cell">Asignatura</div>
                <div class="list__cell">Nota</div>
                <div class="list__cell">Fecha</div>
                <div class="list__cell">Profesor</div>
                <div class="list__cell">Acción</div>
              </div><!--end of list__row-->

              <div class="list__row">
                <div class="list__cell nowrap">
                  <input class="form__checkbox" type="checkbox" id="checklist1">
                  <label class="form__label" for="checklist1"></label>
                </div>
                <div class="list__cell">Matemáticas</div>
                <div class="list__cell">9,5</div>
                <div class="list__cell">28/03/19</div>
                <div class="list__cell">Pascal</div>
                <div class="list__cell">
                  <a href="#" class="list__icon" data-tooltip="Reclamar"><ion-icon name="hand-left"></ion-icon></a>
                  <a href="#" class="list__icon" data-tooltip="Ver detalle"><ion-icon name="eye"></ion-icon></a>
                </div>
              </div><!--end of list__row-->

              <div class="list__row">
                <div class="list__cell nowrap">
                  <input class="form__checkbox" type="checkbox" id="checklist2">
                  <label class="form__label" for="checklist2"></label>
                </div>
                <div class="list__cell">Matemáticas</div>
                <div class="list__cell">9,5</div>
                <div class="list__cell">28/03/19</div>
                <div class="list__cell">Pascal</div>
                <div class="list__cell">
                  <a href="#" class="list__icon" data-tooltip="Reclamar"><ion-icon name="hand-left"></ion-icon></a>
                  <a href="#" class="list__icon" data-tooltip="Ver detalle"><ion-icon name="eye"></ion-icon></a>
                </div>
              </div><!--end of list__row-->

              <div class="list__row">
                <div class="list__cell nowrap">
                  <input class="form__checkbox" type="checkbox" id="checklist3">
                  <label class="form__label" for="checklist3"></label>
                </div>
                <div class="list__cell">Matemáticas</div>
                <div class="list__cell">9,5</div>
                <div class="list__cell">28/03/19</div>
                <div class="list__cell">Pascal</div>
                <div class="list__cell">
                  <a href="#" class="list__icon" data-tooltip="Reclamar"><ion-icon name="hand-left"></ion-icon></a>
                  <a href="#" class="list__icon" data-tooltip="Ver detalle"><ion-icon name="eye"></ion-icon></a>
                </div>
              </div><!--end of list__row-->

              <div class="list__row">
                <div class="list__cell nowrap">
                  <input class="form__checkbox" type="checkbox" id="checklist4">
                  <label class="form__label" for="checklist4"></label>
                </div>
                <div class="list__cell">Ciencias</div>
                <div class="list__cell">9,5</div>
                <div class="list__cell">28/03/19</div>
                <div class="list__cell">Pascal</div>
                <div class="list__cell">
                  <a href="#" class="list__icon" data-tooltip="Reclamar"><ion-icon name="hand-left"></ion-icon></a>
                  <a href="#" class="list__icon" data-tooltip="Ver detalle"><ion-icon name="eye"></ion-icon></a>
                </div>
              </div><!--end of list__row-->
            </div><!--end of list-->
          </div><!--end of wrapper-->
        </div><!--end of list__container-->
      </div><!--end of ficha-->
    </div><!--end of col-8-->
  </div><!--end of row-->
</div><!--end of container-->

<div class="footer">
  <p class="">Centro Educativo Los Pájaros Azules</p>
  <p class="">&copy; 2023</p>
</div>

<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
<script src="js/progress.js"></script>
</body>
</html>
<% } %>