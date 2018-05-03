package com.evaluation.models;

import javax.persistence.*;


@Entity
@Table
public class Demande {
    @Id
    @Column
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id_dem;

    @Column
    private int code_ens;

    @Column
    private String contenu;

    public Demande(int id_dem, int code_ens, String contenu) {
        this.id_dem = id_dem;
        this.code_ens = code_ens;
        this.contenu = contenu;
    }

    public Demande(){}

    public int getId_dem() {
        return id_dem;
    }

    public void setId_dem(int id_dem) {
        this.id_dem = id_dem;
    }

    public int getCode_ens() {
        return code_ens;
    }

    public void setCode_ens(int code_ens) {
        this.code_ens = code_ens;
    }

    public String getContenu() {
        return contenu;
    }

    public void setContenu(String contenu) {
        this.contenu = contenu;
    }

}


