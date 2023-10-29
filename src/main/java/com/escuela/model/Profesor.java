package com.escuela.model;

public class Profesor extends Usuario {
    private String especialidad;

    public Profesor(String login, String password, String especialidad) {
        super(login, password);
        this.especialidad = especialidad;
    }

    public String getEspecialidad() {
        return especialidad;
    }

    public void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }

    @Override
    public String toString() {
        return getLogin(); // método que obtiene el nombre del profesor
    }

}
