package com.evaluation.models;

import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.*;


@Entity
@Table
public class Activité_Pédagogique {

    @Id
    @Column
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id_actP;

    @Column

    private int id_ens;

    @Column
    @NotEmpty
    private String annee;

    @Column
    @NotEmpty
    private String module;

    @Column
    @NotEmpty
    private String type_grad;

    @Column
    @NotEmpty
    private String cycle;


    public Activité_Pédagogique() {}

    public Activité_Pédagogique(int id_ens, String annee, String module, String type_grad, String cycle) {
        this.id_ens = id_ens;
        this.annee = annee;
        this.module = module;
        this.type_grad = type_grad;
        this.cycle = cycle;
    }

    public Activité_Pédagogique(int id_actP, int id_ens, String annee, String module, String type_grad, String cycle) {
        this.id_actP=id_actP;
        this.id_ens = id_ens;
        this.annee = annee;
        this.module = module;
        this.type_grad = type_grad;
        this.cycle = cycle;
    }

    public String getAnnee() {

        return annee;
    }

    public void setAnnee(String annee) {
        this.annee = annee;
    }


    public int getId_actP() {
        return id_actP;
    }

    public void setId_actP(int id_actP) {
        this.id_actP = id_actP;
    }

    public int getId_ens() {
        return id_ens;
    }

    public void setId_ens(int id_ens) {
        this.id_ens = id_ens;
    }

    public String getModule() {
        return module;
    }

    public void setModule(String module) {
        this.module = module;
    }

    public String getType_grad() {
        return type_grad;
    }

    public void setType_grad(String type_grad) {
        this.type_grad = type_grad;
    }

    public String getCycle() {
        return cycle;
    }

    public void setCycle(String cycle) {
        this.cycle = cycle;
    }
}