package com.evaluation.models;


import javax.persistence.*;
import java.util.Set;

@Entity
@Table
public class Grille {

    @Id
    @Column
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id_grille;
    @Column
    private int noteFinale;
    @OneToMany(mappedBy="grille")
    private Set<Variable> variable;
    @OneToOne
    @JoinColumn(name="ens_id")
    private Enseignant ens_id;

    public Grille(){}
    public Grille(Enseignant ens_id){
        this.ens_id=ens_id;
    }

    public Grille(int noteFinale, Set<Variable> variable, Enseignant ens_id) {
        this.noteFinale = noteFinale;
        this.variable = variable;
        this.ens_id = ens_id;
    }

    public int getId_grille() {
        return id_grille;
    }

    public void setId_grille(int id_grille) {
        this.id_grille = id_grille;
    }

    public int getNoteFinale() {
        return noteFinale;
    }

    public void setNoteFinale(int noteFinale) {
        this.noteFinale = noteFinale;
    }

    public Set<Variable> getVariable() {
        return variable;
    }

    public void setVariable(Set<Variable> variable) {
        this.variable = variable;
    }

    public Enseignant getEns_id() {
        return ens_id;
    }

    public void setEns_id(Enseignant ens_id) {
        this.ens_id = ens_id;
    }
}
