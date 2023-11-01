<%--
  Created by IntelliJ IDEA.
  User: carlanebre
  Date: 26/10/23
  Time: 11:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.escuela.model.Alumno" %>
<%@ page import="com.escuela.model.Calificacion" %>
<%@ page import="java.util.List" %>

<% String nombreUsuario = (String) session.getAttribute("nombreUsuario"); %>
<% String rol = (String) session.getAttribute("rol"); %>
<%-- Obtén el parámetro "alumno" de la URL --%>
<% String nombreAlumno = request.getParameter("alumno"); %>

<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.escuela.model.Escuela" %>

<% // Obtén la fecha actual
  Date fechaActual = new Date();
// Crea un objeto SimpleDateFormat para el formato deseado ("dd/MM/yy")
  SimpleDateFormat formatoFecha = new SimpleDateFormat("dd/MM/yy");
// Formatea la fecha actual
  String fechaFormateada = formatoFecha.format(fechaActual);
%>

<% if ("alumno".equals(rol)) { %> <!-- Si es alumno -->
<jsp:include page="private.jsp" />
<% } else if (rol == null) { %> <!-- Si no está iniciada sesión como nada -->
<jsp:include page="private.jsp" />
<% } else { %>
<!-- Contenido específico para profesores -->

<html>
<head>
  <title>Profesor</title>

  <link rel="shortcut icon" href="img/favicon.ico">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
  <link rel="stylesheet" type="text/css" href="css/estilos.css">
</head>
<body id="custom">
<div class="header-custom">
  <div class="container">
    <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-between py-3">

      <a href="profesor.jsp" class="nav-link px-2 link-dark">
        <span class="nav-icon"><ion-icon name="school"></ion-icon></span>
        <span class="title-gestor">Gestor de calificaciones</span>
      </a>

      <div class="flex-vertical-center">
        <div class="nav-group flex-vertical-center">
          <p class="user-name">
            <% if (nombreUsuario != null) { %>
            Bienvenido, <%= nombreUsuario %>
          <% } else { %>
          No se ha iniciado sesión como profesor
            <% } %>
          </p>

          <a href="profesor.jsp" class="btn-round">
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
        <div class="bar">
          <h3 class="bar__title">Mis alumnos</h3>
          <ul class="bar__list">
            <%
            ServletContext context = application.getContext("miEscuela");
            Escuela escuela = (Escuela) application.getAttribute("miEscuela");

            List<Alumno> listaAlumnos = escuela.getListaAlumnos();
            for (Alumno alumno : listaAlumnos) {
            %>
            <li class="bar__list__item">
              <a href="profesor.jsp?alumno=<%= alumno.getLogin() %>" class="bar__list__link">
                <%= alumno.getLogin() %>
                <%= alumno.getApellido() %>
              </a>
            </li>
            <%
              }
            %>
          </ul><!--end of bar__list-->
        </div><!--end of bar-->
      </div><!--end of column--bar-->

      <div class="add-notas mt-5">
        <div class="add">
          <h3>Añadir calificación</h3>
          <div class="rounded-button">
            <ion-icon name="add"></ion-icon>
          </div>
        </div><!---close add-->

        <form class="form-add" action="Calificar">
          <div class="form-group">
            <!-- Campo oculto para el nombre del alumno y profesor-->
            <input type="hidden" name="alumno" value="<%= request.getParameter("alumno") %>">
            <input type="hidden" name="profesor" value="<%= nombreUsuario %>">

            <label for="asignatura">Asignatura:</label>
            <input type="text" class="form-control" id="asignatura" name="asignatura" placeholder="Nombre de la asignatura">
          </div>
          <div class="form-group">
            <label for="nota">Nota (0/10):</label>
            <input type="number" class="form-control" id="nota" name="nota" placeholder="Calificación" min="0" max="10" step="0.1">
          </div>
          <button type="submit" class="btn btn--shadow-primary btn--block mt-4"><span>Calificar</span></button>
        </form>

        <%-- Muestra mensaje de éxito --%>
        <% String successMessage = (String) request.getAttribute("successMessage"); %>
        <% if (successMessage != null) { %>
        <div class="alert-container">
          <%= successMessage %>
        </div>
        <% } %>
      </div><!---add-notas-->
    </div><!--end of col-4-->

    <!-- Columna que ocupa el 70% -->
    <div class="col-8">
      <div class="ficha mb-5">
        <h3>Ficha de alumno</h3>

        <% // Obtiene el parámetro "alumno" de la URL
          String apellidoAlumno = "";
          // Verifica si se ha seleccionado un alumno
          if (nombreAlumno != null) {
            // Busca al alumno por su nombre en la lista de alumnos
            for (Alumno alumno : listaAlumnos) {
              if (nombreAlumno.equals(alumno.getLogin())) {
                apellidoAlumno = alumno.getApellido();
                break; // Detén la búsqueda una vez que encuentres al alumno
              }
            }
          }
        %>
        <% // Si el alumno no es nulo, muestra el nombre y apellido
          if (nombreAlumno != null) {
        %>
        <%
        } else {
        %>
        <h2 class="ficha-message">Selecciona un alumno para mostrar su ficha</h2>
        <%
          }
        %>
        <% // Busca al alumno por su nombre en la lista de alumnos
          if (nombreAlumno != null) {
            for (Alumno alumno : listaAlumnos) {
              if (nombreAlumno.equals(alumno.getLogin())) {
                apellidoAlumno = alumno.getApellido();
        %>

          <%
            if (alumno.getCalificaciones() != null && !alumno.getCalificaciones().isEmpty()) {
              for (Calificacion calificacion : alumno.getCalificaciones()) {

            }
          } else {
          %>

          <%
            }
          %>

        <%
                break; // Detén la búsqueda una vez que encuentres al alumno
              }
            }
          }
        %>

        <%
          boolean alumnoEncontrado = false;
// Verifica si se ha seleccionado un alumno
          if (nombreAlumno != null) {
            for (Alumno alumno : listaAlumnos) {
              if (nombreAlumno.equals(alumno.getLogin())) {
                alumnoEncontrado = true;
        %>
        <h2 class="ficha-name"><%= nombreAlumno + " " + apellidoAlumno %></h2>
        <%
          if (alumno.getCalificaciones() != null && !alumno.getCalificaciones().isEmpty()) {
        %>
        <div class="list__container">
          <div class="list__shadow"></div>
          <div class="list__wrapper">
            <div class="list list-profesor">
              <div class="list__row list__row--header">
                <div class="list__cell"></div>
                <div class="list__cell">Asignatura</div>
                <div class="list__cell">Nota</div>
                <div class="list__cell">Fecha</div>
                <div class="list__cell">Acción</div>
              </div><!--end of list__row-->

              <%
                for (Calificacion calificacion : alumno.getCalificaciones()) {
              %>

              <div class="list__row">
                <div class="list__cell nowrap">
                  <input class="form__checkbox" type="checkbox" id="checklist1">
                  <label class="form__label" for="checklist1"></label>
                </div>
                <div class="list__cell"><%= calificacion.getAsignatura() %></div>
                <div class="list__cell"><%= calificacion.getNota() %></div>
                <div class="list__cell"><%= fechaFormateada %></div>
                <div class="list__cell">
                  <a href="#0" class="list__icon" data-tooltip="Editar"><ion-icon name="pencil-sharp"></ion-icon></a>
                  <a href="#0" class="list__icon" data-tooltip="Ver detalle"><ion-icon name="eye"></ion-icon></a>
                  <a href="#0" class="list__icon" data-tooltip="Eliminar"><ion-icon name="trash"></ion-icon></a>
                </div>
              </div>
              <%
                }
              %>
            </div><!--end of list-->
          </div><!--end of wrapper-->
        </div><!--end of list__container-->
        <%
        } else {
        %>
        <p>No hay calificaciones para este alumno.</p>
        <%
                }
              }
            }
          }

          if (!alumnoEncontrado) {
        %>

        <%
          }
        %>
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