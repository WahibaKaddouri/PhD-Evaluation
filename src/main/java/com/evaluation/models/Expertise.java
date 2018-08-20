package com.evaluation.models;

import javax.persistence.*;


@Entity
@Table
public class Expertise {
    @Id
    @Column
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id_exp;

   @Column
    private int code_ens;

    @Column
    private String contexte;

    @Column
    private String organisme;

    @Column
    private int annee;



    public Expertise() {
    }

    public Expertise(int code_ens, String contexte, String organisme, int annee) {
        this.code_ens = code_ens;
        this.contexte = contexte;
        this.organisme = organisme;
        this.annee = annee;
    }

    public Expertise(int id_exp, int code_ens, String contexte, String organisme, int annee) {
        this.id_exp=id_exp;
        this.code_ens = code_ens;
        this.contexte = contexte;
        this.organisme = organisme;
        this.annee = annee;
    }



    public int getId_exp() {
        return id_exp;
    }

    public void setId_exp(int id_exp) {
        this.id_exp = id_exp;
    }

    public int getCode_ens() {
        return code_ens;
    }

    public void setCode_ens(int code_ens) {
        this.code_ens = code_ens;
    }

    public String getContexte() {
        return contexte;
    }

    public void setContexte(String contexte) {
        this.contexte = contexte;
    }

    public String getOrganisme() {
        return organisme;
    }

    public void setOrganisme(String organisme) {
        this.organisme = organisme;
    }

    public int getAnnee() {
        return annee;
    }

    public void setAnnee(int annee) {
        this.annee = annee;
    }
}
