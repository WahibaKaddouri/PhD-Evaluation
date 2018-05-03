package com.evaluation.models;

import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.util.Date;


@Entity
@Table
public class Enseignant {
        @Id
        @Column
        @GeneratedValue(strategy = GenerationType.AUTO)
        private int id;
        @NotEmpty
        @Column
        private String nom;
        @NotEmpty
        @Column
        private String prenom;

        @Column
        private String num_tel;
        @NotEmpty
        @Column
        private String email;
        @NotEmpty
        @Column
        private String password;
        @NotNull
        @Column
        private int id_section;
        @NotEmpty
        @Column
        private String id_etablissement;
        @Column
        private String date_doctorat;
        @Column
        private String date_installation_grade;

        public Enseignant(){

        }

    public Enseignant(int id, String nom, String prenom, String num_tel, String email ,int id_section, String date_doctorat, String date_installation_grade, String etablissement) {
        this.id = id;
        this.nom = nom;
        this.prenom = prenom;
        this.num_tel = num_tel;
        this.email=email;
        this.id_section = id_section;
        this.date_doctorat = date_doctorat;
        this.date_installation_grade = date_installation_grade;
        this.id_etablissement=etablissement;
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

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public String getNum_tel() {
        return num_tel;
    }

    public void setNum_tel(String num_tel) {
        this.num_tel = num_tel;
    }

    public int getId_section() {
        return id_section;
    }

    public void setId_section(int id_section) {
        this.id_section = id_section;
    }

    public String getDate_doctorat() {
        return date_doctorat;
    }

    public void setDate_doctorat(String date_doctorat) {
        this.date_doctorat = date_doctorat;
    }

    public String getDate_installation_grade() {
        return date_installation_grade;
    }

    public void setDate_installation_grade(String date_installation_grade) {
        this.date_installation_grade = date_installation_grade;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getId_etablissement() {
        return id_etablissement;
    }

    public void setId_etablissement(String id_etablissement) {
        this.id_etablissement = id_etablissement;
    }


}
