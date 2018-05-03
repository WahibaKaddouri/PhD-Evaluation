package com.evaluation.models;

import javax.persistence.*;


@Entity
@Table
public class Projet {
    @Id
    @Column
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id_pro;

   @Column
    private int code_ens;

    @Column
    private String type;

    @Column
    private String qualite;

    @Column
    private String titre;

    @Column
    private int annee;


    public Projet() {
    }

    public Projet(int code_ens, String type, String qualite, String titre, int annee) {
        this.code_ens = code_ens;
        this.type = type;
        this.qualite = qualite;
        this.titre = titre;
        this.annee = annee;
    }


    public int getId_pro() {
        return id_pro;
    }

    public void setId_pro(int id_pro) {
        this.id_pro = id_pro;
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

    public String getQualité() {
        return qualite;
    }

    public void setQualité(String qualité) {
        this.qualite = qualité;
    }

    public String getTitre() {
        return titre;
    }

    public void setTitre(String titre) {
        this.titre = titre;
    }

    public int getAnnee() {
        return annee;
    }

    public void setAnnee(int annee) {
        this.annee = annee;
    }
}
