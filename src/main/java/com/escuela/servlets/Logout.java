package com.escuela.servlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "Logout", value = "/Logout")
public class Logout extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtener la sesión y cerrarla (invalidar)
        HttpSession session = request.getSession();
        session.invalidate();

        // Redirigir al usuario a la página de inicio de sesión
        response.sendRedirect("index.jsp");
    }
}