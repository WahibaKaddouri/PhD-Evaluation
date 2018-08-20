package com.evaluation.models;

import javax.persistence.*;


@Entity
@Table
public class Encadrement {
    @Id
    @Column
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id_enc;

   @Column
    private int code_ens;

    @Column
    private String type;

    @Column
    private String candidat;

    @Column
    private String titre;


    @Column
    String date_soutenance;




    public Encadrement() {
    }

    public Encadrement(int code_ens, String type, String candidat, String titre, String date_soutenance) {
        this.code_ens = code_ens;
        this.type = type;
        this.candidat = candidat;
        this.titre = titre;
        this.date_soutenance = date_soutenance;
    }


    public Encadrement(int id_enc, int code_ens, String type, String candidat, String titre, String date_soutenance) {
        this.id_enc=id_enc;
        this.code_ens = code_ens;
        this.type = type;
        this.candidat = candidat;
        this.titre = titre;
        this.date_soutenance = date_soutenance;
    }

    public int getId_enc() {
        return id_enc;
    }

    public void setId_enc(int id_enc) {
        this.id_enc = id_enc;
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

    public String getCandidat() {
        return candidat;
    }

    public void setCandidat(String candidat) {
        this.candidat = candidat;
    }

    public String getTitre() {
        return titre;
    }

    public void setTitre(String titre) {
        this.titre = titre;
    }

    public String getDate_soutenance() {
        return date_soutenance;
    }

    public void setDate_soutenance(String date_soutenance) {
        this.date_soutenance = date_soutenance;
    }
}
