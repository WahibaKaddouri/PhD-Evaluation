package com.evaluation.models;


import javax.persistence.*;
import java.util.Set;

@Entity
@Table
public class Variable {

    @Id
    @Column
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id_variable;
    @Column
    private String nom;
    @Column
    private int total_point;
    @OneToMany(mappedBy="variable")
    private Set<SousVariable> sousVariable;
    @ManyToOne
    @JoinColumn(name="id_grille", nullable=false)
    private Grille grille;

    public Variable(){}
    public Variable(Grille grille){this.grille= grille;}

    public Variable(String nom, int total_point, Set<SousVariable> sousVariable) {
        this.nom = nom;
        this.total_point = total_point;
        this.sousVariable = sousVariable;
    }

    public int getId() {
        return id_variable;
    }

    public void setId(int id) {
        this.id_variable = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public int getTotal_point() {
        return total_point;
    }

    public void setTotal_point(int total_point) {
        this.total_point = total_point;
    }

    public Set<SousVariable> getSousVariable() {
        return sousVariable;
    }

    public void setSousVariable(Set<SousVariable> sousVariable) {
        this.sousVariable = sousVariable;
    }
    //public void setGrille(Grille){}
}
