package com.evaluation.models;

import java.io.Serializable;


import javax.persistence.*;

@Entity
@Table
public class Utilisateur implements Serializable{
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    @Column
    private int id;
    @Column
    private String username;
    @Column
    private String password;
    @Column
    private String roles;
    @OneToOne
    @JoinColumn(name="ens_id")
    private Enseignant ens_id;
    @Column
    private String etablissement;

    public Utilisateur(String username, String password, String roles, Enseignant ens_id) {
        this.username = username;
        this.password = password;
        this.roles = roles;
        this.ens_id = ens_id;
    }

    public Utilisateur(){}

    public Utilisateur(String username, String password, String roles, Enseignant ens_id, String etablissement) {
        this.username = username;
        this.password = password;
        this.roles = roles;
        this.ens_id = ens_id;
        this.etablissement = etablissement;
    }

    public Utilisateur(int id, String username, String password, String roles ) {

        super();
        this.id = id;
        this.username = username;
        this.password = password;
        this.roles = roles;

    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRoles() {
        return roles;
    }

    public void setRoles(String roles) {
        this.roles = roles;
    }

    public Enseignant getEns_id() {
        return ens_id;
    }

    public void setEns_id(Enseignant ens_id) {
        this.ens_id = ens_id;
    }

    public String getEtablissement() {
        return etablissement;
    }

    public void setEtablissement(String etablissement) {
        this.etablissement = etablissement;
    }
}
