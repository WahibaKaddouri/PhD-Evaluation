package com.evaluation.models;

import javax.persistence.*;


@Entity
@Table
public class Communication {
    @Id
    @Column
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id_com;

   @Column
    private int code_ens;

    @Column
    private String type;

    @Column
    private String titre_com;

    @Column
    private String position_auteur;

    @Column
    private String titre_manif;


    @Column
    private int annee;

    @Column
    private String url;



    public Communication() {
    }


    public Communication(int code_ens, String type, String titre_com, String position_auteur, String titre_manif, int annee, String url) {
        this.code_ens = code_ens;
        this.type = type;
        this.titre_com = titre_com;
        this.position_auteur = position_auteur;
        this.titre_manif = titre_manif;
        this.annee = annee;
        this.url = url;
    }

    public int getId_com() {
        return id_com;
    }

    public void setId_com(int id_com) {
        this.id_com = id_com;
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

    public String getTitre_com() {
        return titre_com;
    }

    public void setTitre_com(String titre_com) {
        this.titre_com = titre_com;
    }

    public String getPosition_auteur() {
        return position_auteur;
    }

    public void setPosition_auteur(String position_auteur) {
        this.position_auteur = position_auteur;
    }

    public String getTitre_manif() {
        return titre_manif;
    }

    public void setTitre_manif(String titre_manif) {
        this.titre_manif = titre_manif;
    }

    public int getAnnee() {
        return annee;
    }

    public void setAnnee(int annee) {
        this.annee = annee;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
}
