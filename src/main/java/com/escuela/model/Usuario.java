package com.escuela.model;

public class Usuario {
    private String user;
    private String password;

    public Usuario(String user, String password) {
        super();
        this.user = user;
        this.password = password;
    }

    public String getLogin() {
        return user;
    }

    public void setLogin(String user) {
        this.user = user;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
