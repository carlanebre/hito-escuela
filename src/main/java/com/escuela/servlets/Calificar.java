package com.escuela.servlets;

import jakarta.servlet.*;
import com.escuela.model.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "Calificar", value = "/Calificar")
public class Calificar extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String asignatura = request.getParameter("asignatura");
        String notaStr = request.getParameter("nota");
        String nombreAlumno = request.getParameter("alumno");

        // Obtén el profesor desde la sesión como "usuario"
        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
        if (usuario instanceof Profesor) {
            Profesor profesor = (Profesor) usuario;

            // Obtén la lista de alumnos desde la sesión
            List<Alumno> listaAlumnos = (List<Alumno>) request.getSession().getAttribute("alumnos");

            for (Alumno alumno : listaAlumnos) {
                if (alumno.getLogin().equals(nombreAlumno)) {
                    try {
                        int nota = Integer.parseInt(notaStr);

                        // Agrega la calificación al alumno con el profesor configurado
                        alumno.calificar(profesor, asignatura, nota);

                        // Mensaje de éxito
                        String successMessage = "<div class=\"alert alert-success\" role=\"alert\">\n" +
                                "  Se ha calificado a " + nombreAlumno + " con éxito.\n" +
                                "</div>";
                        request.setAttribute("successMessage", successMessage);
                    } catch (NumberFormatException e) {
                        // Si la nota no es un número válido
                        String errorMessage = "<div class=\"alert alert-danger\" role=\"alert\">\n" +
                                "  La nota debe ser un valor numérico válido.\n" +
                                "</div>";
                        request.setAttribute("errorMessage", errorMessage);
                    }

                    break; // Detén la búsqueda una vez que encuentres al alumno
                }
            }
        }

        // Después de realizar la calificación
        String successMessage = "<div class=\"alert alert-success\" role=\"alert\">\n" +
                "  Se ha calificado a " + nombreAlumno + " con éxito.\n" +
                "</div>";
        request.setAttribute("successMessage", successMessage);

        // Redirige de vuelta a la página profesor.jsp después de calificar
        request.getRequestDispatcher("profesor.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Método POST no implementado
    }
}
