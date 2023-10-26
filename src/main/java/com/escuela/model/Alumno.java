package com.escuela.model;

import java.util.ArrayList;

public class Alumno extends Usuario {
    private ArrayList<Calificacion> calificaciones;

    private String apellido;

    public Alumno(String user, String password, String apellido) {
        super(user, password);
        this.apellido = apellido;
        calificaciones = new ArrayList<Calificacion>();
    }

    public String getApellido() {
        return apellido;
    }

    public Alumno(String login, String password) {
        super(login, password);
        calificaciones = new ArrayList<Calificacion>();
    }

    public ArrayList<Calificacion> getCalificaciones() {
        return calificaciones;
    }

    public void calificar(Profesor p, String asignatura, int nota) {
        this.calificaciones.add(new Calificacion(p, asignatura, nota));
    }

    @Override
    public String toString() {
        String calificaciones="";
        for (Calificacion c : this.getCalificaciones()) {
            calificaciones+=c.toString() + "\n";
        }
        return "Alumno: " + this.getLogin() + "\n" + calificaciones;
    }
}
