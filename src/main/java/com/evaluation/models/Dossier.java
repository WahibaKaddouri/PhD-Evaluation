package com.evaluation.models;


import javax.persistence.*;

@Entity
@Table

public class Dossier {

    @Id
    @Column
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    @OneToOne
    @JoinColumn(name="ens_id")
    private Enseignant ens_id;
    private String etat;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Enseignant getEns_id() {
        return ens_id;
    }


    public void setEns_id(Enseignant ens_id) {
        this.ens_id = ens_id;
    }

    public String getEtat() {
        return etat;
    }

    public Dossier(){}

    public Dossier(Enseignant ens_id, String etat) {
        this.ens_id = ens_id;
        this.etat = etat;
    }

    public Dossier(Enseignant ens_id){this.ens_id=ens_id;}

    public void setEtat(String etat) {
        this.etat = etat;
    }
}
