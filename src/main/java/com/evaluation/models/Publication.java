package com.evaluation.models;

import javax.persistence.*;


@Entity
@Table
public class Publication {
    @Id
    @Column
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id_pub;

   @Column
    private int code_ens;

    @Column
    private String type;

    @Column
    private String titre_article;

    @Column
    private String position_auteur;

    @Column
    private String titre_revue;


    @Column
    private int annee;

    @Column
    private String url;



    public Publication() {
    }


    public Publication(int code_ens, String type, String titre_article, String position_auteur, String titre_revue, int annee, String url) {
        this.code_ens = code_ens;
        this.type = type;
        this.titre_article = titre_article;
        this.position_auteur = position_auteur;
        this.titre_revue = titre_revue;
        this.annee = annee;
        this.url = url;
    }

    public Publication(int id_pub, int code_ens, String type, String titre_article, String position_auteur, String titre_revue, int annee, String url) {
        this.id_pub=id_pub;
        this.code_ens = code_ens;
        this.type = type;
        this.titre_article = titre_article;
        this.position_auteur = position_auteur;
        this.titre_revue = titre_revue;
        this.annee = annee;
        this.url = url;
    }



    public int getId_pub() {
        return id_pub;
    }

    public void setId_pub(int id_pub) {
        this.id_pub = id_pub;
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

    public String getTitre_article() {
        return titre_article;
    }

    public void setTitre_article(String titre_article) {
        this.titre_article = titre_article;
    }

    public String getPosition_auteur() {
        return position_auteur;
    }

    public void setPosition_auteur(String position_auteur) {
        this.position_auteur = position_auteur;
    }

    public String getTitre_revue() {
        return titre_revue;
    }

    public void setTitre_revue(String titre_revue) {
        this.titre_revue = titre_revue;
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
