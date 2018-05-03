package com.evaluation.models;

import javax.persistence.*;


@Entity
@Table
public class Responsabilité {
    @Id
    @Column
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id_resp;

   @Column
    private int code_ens;

    @Column
    private String type;

    @Column
    private int annee_deb;

    @Column
    private int annee_fin;

    @Column
    private String structure;


    public Responsabilité() {
    }

    public Responsabilité(int code_ens, String type, int annee_deb, int annee_fin, String structure) {
        this.code_ens = code_ens;
        this.type = type;
        this.annee_deb = annee_deb;
        this.annee_fin = annee_fin;
        this.structure = structure;
    }

    public int getId_resp() {
        return id_resp;
    }

    public void setId_resp(int id_resp) {
        this.id_resp = id_resp;
    }

    public int getCode_ens() {
        return code_ens;
    }

    public void setCode_ens(int code_ens) {
        this.code_ens = code_ens;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getAnnee_deb() {
        return annee_deb;
    }

    public void setAnnee_deb(int annee_deb) {
        this.annee_deb = annee_deb;
    }

    public int getAnnee_fin() {
        return annee_fin;
    }

    public void setAnnee_fin(int annee_fin) {
        this.annee_fin = annee_fin;
    }

    public String getStructure() {
        return structure;
    }

    public void setStructure(String structure) {
        this.structure = structure;
    }
}
