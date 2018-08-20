package com.evaluation.models;

import javax.persistence.*;


@Entity
@Table
public class Ouvrage {
    @Id
    @Column
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id_ouv;


    @Column
    private int code_ens;


    @Column
    private String titre;

    @Column
    private String type;


    @Column
    private String auteurs;

    @Column
    private String maison;

    @Column
    private int anneeE;

    @Column
    private int nb_pages;



    public Ouvrage() {
    }


    public Ouvrage(int code_ens,String type, String titre,String auteurs, String maison, int anneeE, int nb_pages) {
        this.code_ens = code_ens;
        this.auteurs = auteurs;
        this.type = type;
        this.titre = titre;
        this.maison = maison;
        this.nb_pages = nb_pages;
        this.anneeE = anneeE;
    }



    public Ouvrage(int id_ouv, int code_ens,String type, String titre,String auteurs, String maison, int anneeE, int nb_pages) {
        this.id_ouv=id_ouv;
        this.code_ens = code_ens;
        this.auteurs = auteurs;
        this.type = type;
        this.titre = titre;
        this.maison = maison;
        this.nb_pages = nb_pages;
        this.anneeE = anneeE;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getId_ouv() {
        return id_ouv;
    }


    public String getTitre() {
        return titre;
    }

    public void setId_ouv(int id_ouv) {
        this.id_ouv = id_ouv;
    }

    public int getCode_ens() {
        return code_ens;
    }

    public void setCode_ens(int code_ens) {
        this.code_ens = code_ens;
    }

    public String getAuteurs() {
        return auteurs;
    }

    public void setAuteurs(String auteurs) {
        this.auteurs = auteurs;
    }

    public void setTitre(String titre) {
        this.titre = titre;
    }
    public String getMaison() {
        return maison;
    }

    public void setMaison(String maison) {
        this.maison = maison;
    }

    public int getAnnee() {
        return anneeE;
    }

    public void setAnnee(int annee) {
        this.anneeE = annee;
    }

    public int getNb_pages() {
        return nb_pages;
    }

    public void setNb_pages(int nb_pages) {
        this.nb_pages = nb_pages;
    }

}
