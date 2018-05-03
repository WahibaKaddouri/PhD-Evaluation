package com.evaluation.models;

import javax.persistence.*;

@Entity
@Table
public class Fichier {

    @Column
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    @Column
    private String Username;


    public Fichier(){};
    public Fichier(String username) {
        Username = username;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return Username;
    }

    public void setUsername(String username) {
        Username = username;
    }
}
