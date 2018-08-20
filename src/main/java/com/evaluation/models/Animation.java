package com.evaluation.models;

import javax.persistence.*;


@Entity
@Table
public class Animation {
    @Id
    @Column
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id_anim;

   @Column
    private int code_ens;

    @Column
    private String type;

    @Column
    private String lieu;

    @Column
    private String date;

    @Column
    private String qualite;


    public Animation() {
    }

    public Animation(int code_ens, String type, String lieu, String date, String qualite) {
        this.code_ens = code_ens;
        this.type = type;
        this.lieu = lieu;
        this.date = date;
        this.qualite = qualite;
    }

    public Animation(int id_anim, int code_ens, String type, String lieu, String date, String qualite) {
        this.id_anim=id_anim;
        this.code_ens = code_ens;
        this.type = type;
        this.lieu = lieu;
        this.date = date;
        this.qualite = qualite;
    }



    public int getId_anim() {
        return id_anim;
    }

    public void setId_anim(int id_anim) {
        this.id_anim = id_anim;
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

    public String getLieu() {
        return lieu;
    }

    public void setLieu(String lieu) {
        this.lieu = lieu;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getQualite() {
        return qualite;
    }

    public void setQualite(String qualite) {
        this.qualite = qualite;
    }
}
