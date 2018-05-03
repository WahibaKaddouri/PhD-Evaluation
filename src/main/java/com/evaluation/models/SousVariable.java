package com.evaluation.models;


import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;


@JsonIgnoreProperties(ignoreUnknown = true)
@Entity
@Table
public class SousVariable {

    @Id
    @Column
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    @Column
    private String nom;
    @Column
    private String formule;
    @Column
    private int bareme;
    @Column
    private String info_supp;
    @ManyToOne
    @JoinColumn(name="id_variable", nullable=false)
    private Variable variable;
    @Column
    private String pointSousVar;

    public SousVariable(){}

    public SousVariable(String nom, String formule, int bareme, String info_supp, Variable variable, String pointSousVar) {
        this.nom = nom;
        this.formule = formule;
        this.bareme = bareme;
        this.info_supp = info_supp;
        this.variable = variable;
        this.pointSousVar = pointSousVar;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getFormule() {
        return formule;
    }

    public void setFormule(String formule) {
        this.formule = formule;
    }

    public int getBareme() {
        return bareme;
    }

    public void setBareme(int bareme) {
        this.bareme = bareme;
    }

    public String getInfo_supp() {
        return info_supp;
    }

    public void setInfo_supp(String info_supp) {
        this.info_supp = info_supp;
    }

    public Variable getVariable() {
        return variable;
    }

    public void setVariable(Variable variable) {
        this.variable=variable;
    }
    public String getPointSousVar() {
        return pointSousVar;
    }

    public void setPointSousVar(String pointSousVar) {
        this.pointSousVar = pointSousVar;
    }
}
