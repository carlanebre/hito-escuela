<%--
  Created by IntelliJ IDEA.
  User: carlanebre
  Date: 26/10/23
  Time: 12:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Zona Privada</title>

  <link rel="shortcut icon" href="img/favicon.ico">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
  <link rel="stylesheet" type="text/css" href="css/estilos.css">

  <style>
    body {
      margin: 0;
      padding: 0;
      background-color: rgba(0, 0, 0, 0.5); /* Capa de opacidad */
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }

    .mensaje {
      background-color: #fff;
      padding: 20px;
      border-radius: 5px;
      text-align: center;
    }

    .enlace {
      text-decoration: none;
      color: #007BFF;
    }
  </style>
</head>
<body>
<div class="mensaje">
  <h1>Zona Privada</h1>
  <% if (session.getAttribute("nombreUsuario") == null) { %>
  <!-- Usuario no logueado -->
  <p>Estás intentando acceder a una zona privada.</p>
  <p>Por favor, <a href="login.jsp">inicia sesión</a> como profesor o alumno.</p>

  <% } else if (session.getAttribute("rol").equals("profesor")) { %>
  <!-- Usuario logueado como profesor -->
  <p>Estás intentando acceder a una zona privada.</p>
  <p><a class="enlace" href="profesor.jsp">Continuar como profesor</a></p>

  <% } else if (session.getAttribute("rol").equals("alumno")) { %>
  <!-- Usuario logueado como alumno -->
  <p>Esta es una zona privada para profesores.</p>
  <p>Estás intentando acceder a una zona privada.</p>
  <p>Si eres alumno, por favor <a href="login.jsp">vuelve atrás</a> o inicia sesión como profesor.</p>
  <% } %>
  <p><a class="enlace" href="login.jsp">Volver al inicio</a></p>
</div>
</body>
</html>

