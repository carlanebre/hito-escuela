package com.escuela.servlets;

import com.escuela.model.*;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "Login", value = "/Login")
public class Login extends HttpServlet {
    private Escuela escuela; // Mantén una única instancia de Escuela

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
    @Override
    public void init() throws ServletException {
        // Inicializa la instancia de Escuela en el método init
        escuela = new Escuela();
        escuela.nuevoProfesor("Amelia", "123", "Bases de datos, Entorno Servidor");
        escuela.nuevoProfesor("Pepe", "123", "Matemáticas, física");
        escuela.nuevoProfesor("Carmelo", "123", "Informática");
        escuela.nuevoAlumno("Paula", "123", "Cubero");
        escuela.nuevoAlumno("Mauro", "123","Marquez");
        escuela.nuevoAlumno("Carlos", "123", "Merino");
        escuela.nuevoAlumno("Lucas", "123", "Pascal");

        // Obtiene el contexto de la aplicación
        ServletContext context = getServletContext();

        // Obtén la lista de alumnos desde la instancia de Escuela
        List<Alumno> listaAlumnos = escuela.getListaAlumnos();

        // Almacena la instancia de Escuela en el contexto de la aplicación
        context.setAttribute("miEscuela", escuela);

        // Almacena la lista de alumnos en el contexto de la aplicación
        context.setAttribute("alumnos", listaAlumnos);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String user = request.getParameter("user"); // Obtener el user desde el formulario
        String password = request.getParameter("password"); // Obtener la contraseña desde el formulario

        Usuario usuario = escuela.getUsuarios().get(user);

        if (usuario != null && usuario.getPassword().equals(password)) {
            // Las credenciales son válidas, establece una sesión
            HttpSession session = request.getSession();
            session.setAttribute("usuario", usuario);
            session.setAttribute("nombreUsuario", usuario.getLogin()); // Almacena el nombre del usuario en la sesión

            if (usuario instanceof Profesor) {
                session.setAttribute("rol", "profesor"); // Establecer el rol del usuario

                // Obtener la lista de alumnos de la escuela
                // List<Alumno> listaAlumnos = escuela.getListaAlumnos();
                // session.setAttribute("alumnos", listaAlumnos);

                request.getRequestDispatcher("profesor.jsp").forward(request, response); // Reenvía a la página de profesor

            } else if (usuario instanceof Alumno) {
                session.setAttribute("rol", "alumno");
                session.setAttribute("apellidoUsuario", ((Alumno) usuario).getApellido());
                session.setAttribute("alumno", usuario); // Almacena el objeto Alumno en la sesión

                request.getRequestDispatcher("alumno.jsp").forward(request, response);
                //response.sendRedirect("alumno.jsp"); // Redirigir a la página de alumno
            }
        } else {
            // Las credenciales son incorrectas, muestra un mensaje de error
            String error = "<div class=\"alert alert-danger\" role=\"alert\">\n" +
                    "  Usuario o contraseña incorrectos. Por favor, inténtalo de nuevo.\n" +
                    "</div>";
            request.setAttribute("error", error);

            RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
            rd.forward(request, response);

            //response.sendRedirect("index.jsp"); // Ajusta la dirección de la página de login
        }
    }
}