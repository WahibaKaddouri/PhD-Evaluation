package com.evaluation.models;

import javax.persistence.*;

@Entity
@Table
public class Observation {
    @Id
    @Column
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id_obs;


    @Column
    private int code_ens;

    @Column
    private String obs_Fiche_cand;

    @Column
    private String obs_Dossier_adm;

    @Column
    private String obs_Dossier_ped;

    private String val_Fiche_cand;

    @Column
    private String val_Dossier_adm;

    @Column
    private String val_Dossier_ped;


    public Observation() {
    }

    public Observation(int code_ens, String obs_Fiche_cand, String obs_Dossier_adm, String obs_Dossier_ped, String val_Fiche_cand, String val_Dossier_ped, String val_Dossier_ped1) {
        this.code_ens = code_ens;
        this.obs_Fiche_cand = obs_Fiche_cand;
        this.obs_Dossier_adm = obs_Dossier_adm;
        this.obs_Dossier_ped = obs_Dossier_ped;
        this.val_Fiche_cand = val_Fiche_cand;
        this.val_Dossier_ped = val_Dossier_ped;
        this.val_Dossier_ped = val_Dossier_ped1;
    }

    public int getCode_ens() {
        return code_ens;
    }

    public int getId_obs() {
        return id_obs;
    }

    public void setCode_ens(int code_ens) {
        this.code_ens = code_ens;
    }

    public String getObs_Fiche_cand() {
        return obs_Fiche_cand;
    }

    public void setObs_Fiche_cand(String obs_Fiche_cand) {
        this.obs_Fiche_cand = obs_Fiche_cand;
    }

    public String getObs_Dossier_adm() {
        return obs_Dossier_adm;
    }

    public void setObs_Dossier_adm(String obs_Dossier_adm) {
        this.obs_Dossier_adm = obs_Dossier_adm;
    }

    public String getObs_Dossier_ped() {
        return obs_Dossier_ped;
    }

    public void setObs_Dossier_ped(String obs_Dossier_ped) {
        this.obs_Dossier_ped = obs_Dossier_ped;
    }

    public String getVal_Fiche_cand() {
        return val_Fiche_cand;
    }

    public void setVal_Fiche_cand(String val_Fiche_cand) {
        this.val_Fiche_cand = val_Fiche_cand;
    }

    public String getVal_Dossier_adm() {
        return val_Dossier_adm;
    }

    public void setVal_Dossier_adm(String val_Dossier_adm) {
        this.val_Dossier_adm = val_Dossier_adm;
    }

    public String getVal_Dossier_ped() {
        return val_Dossier_ped;
    }

    public void setVal_Dossier_ped(String val_Dossier_ped) {
        this.val_Dossier_ped = val_Dossier_ped;
    }
}


