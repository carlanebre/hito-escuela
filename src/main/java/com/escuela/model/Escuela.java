package com.escuela.model;

import java.util.ArrayList;
import java.util.List;
import java.util.TreeMap;

public class Escuela {
    private TreeMap<String, Usuario> usuarios;

    public Escuela() {
        super();
        this.usuarios = new TreeMap<String, Usuario>();
    }

    public void nuevoProfesor(String user, String password, String especialidad) {
        usuarios.put(user, new Profesor(user, password, especialidad));
    }

    public void nuevoAlumno(String user, String password, String apellido) {
        usuarios.put(user, new Alumno(user, password, apellido));
    }


    public TreeMap<String, Usuario> getUsuarios() {
        return usuarios;
    }

    // Este método devuelve una lista de todos los alumnos
    public List<Alumno> getListaAlumnos() {
        List<Alumno> listaAlumnos = new ArrayList<>();
        for (Usuario usuario : usuarios.values()) {
            if (usuario instanceof Alumno) {
                listaAlumnos.add((Alumno) usuario);
            }
        }
        return listaAlumnos;
    }
}
