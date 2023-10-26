<%--
  Created by IntelliJ IDEA.
  User: carlanebre
  Date: 26/10/23
  Time: 10:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Gestor de calificaciones</title>

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

            <div class="col-md-3 text-end btns-custom">
                <a href="profesor.jsp"><button type="button" class="btn btn-outline-primary btn-negativo">Inicio</button>
                </a>
            </div>
        </header>
    </div>
</div><!--end of header-custom-->

<div class="container wrapper-narrow px-4 py-5" id="login">
    <main class="form-signin w-100 m-auto">
        <form action="Login" method="post">
            <h1 class="h3 fw-normal">Accede con tu cuenta</h1>

            <div class="input-login-group">
                <div class="form-floating">
                    <input type="text" name="user" class="form-control" id="floatingInput" placeholder="Usuario">
                    <label for="floatingInput">Usuario</label>
                </div>
                <div class="form-floating">
                    <input type="password" name="password" class="form-control" id="floatingPassword" placeholder="Password">
                    <label for="floatingPassword">Contraseña</label>
                </div>
            </div>

            <button type="submit" class="btn btn--shadow-primary btn--block"><span>Entrar</span>
            </button>

            <%-- Muestra la alerta de error si existe --%>
            <% String error = (String) request.getAttribute("error");
                if (error != null) { %>
            <p>${error}</p>
            <% } %>
        </form>
    </main>
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
