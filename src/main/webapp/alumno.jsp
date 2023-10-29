<%@ page import="com.escuela.model.Calificacion" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.escuela.model.Alumno" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %><%--
  Created by IntelliJ IDEA.
  User: carlanebre
  Date: 26/10/23
  Time: 12:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<% String nombreUsuario = (String) session.getAttribute("nombreUsuario"); %>
<%String apellidoUsuario = (String) session.getAttribute("apellidoUsuario");%>
<% String rol = (String) session.getAttribute("rol"); %>

<% // Obtén la fecha actual
  Date fechaActual = new Date();
// Crea un objeto SimpleDateFormat para el formato deseado ("dd/MM/yy")
  SimpleDateFormat formatoFecha = new SimpleDateFormat("dd/MM/yy");
// Formatea la fecha actual
  String fechaFormateada = formatoFecha.format(fechaActual);
%>

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

      <a href="alumno.jsp" class="nav-link px-2 link-dark">
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
          <a href="alumno.jsp" class="btn-round">
            <span></span>
            <ion-icon class="nav-user" name="person"></ion-icon>
          </a>

        </div>
        <div class="col-md-3 text-end btns-custom">
          <form action="Logout" class="f-logout" method="post">
            <button type="submit" class="btn btn-outline-primary btn-negativo">Salir</button>
          </form>
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
          <h2 class="ficha-name"><%= nombreUsuario %><%= " " + apellidoUsuario %></h2>
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
            <%-- Obtén las calificaciones del alumno de la sesión --%>
            <% ArrayList<Calificacion> calificacionesAlumno = ((Alumno) session.getAttribute("alumno")).getCalificaciones(); %>

            <%-- Verifica si el alumno tiene calificaciones --%>
            <% if (calificacionesAlumno != null && !calificacionesAlumno.isEmpty()) { %>
            <div class="list">
              <div class="list__row list__row--header2">
                <div class="list__cell">Asignatura</div>
                <div class="list__cell">Nota</div>
                <div class="list__cell">Fecha</div>
                <div class="list__cell">Profesor</div>
                <div class="list__cell">Acción</div>
              </div><!--end of list__row-->

              <%
                for (Calificacion calificacion : calificacionesAlumno) {
              %>
              <div class="list__row">
                <div class="list__cell"><%= calificacion.getAsignatura() %></div>
                <div class="list__cell"><%= calificacion.getNota() %></div>
                <div class="list__cell"><%= fechaFormateada %></div>
                <div class="list__cell"><%= calificacion.getProfesor() %></div>
                <div class="list__cell">
                  <a href="#" class="list__icon" data-tooltip="Reclamar"><ion-icon name="hand-left"></ion-icon></a>
                  <a href="#" class="list__icon" data-tooltip="Ver detalle"><ion-icon name="eye"></ion-icon></a>
                </div>
              </div><!--end of list__row-->
              <%
                }
              %>
            </div><!--end of list-->
            <% } else { %>
            <p>No hay calificaciones para este alumno.</p>
            <% } %>

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