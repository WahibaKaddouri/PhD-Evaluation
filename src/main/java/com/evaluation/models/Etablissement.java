package com.evaluation.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table
public class Etablissement {

    @Id
    @Column
    private String code_etablissement;

    public Etablissement(){}

    public Etablissement(String code_etablissement) {
        this.code_etablissement = code_etablissement;
    }

    public String getCode_etablissement() {
        return code_etablissement;
    }

    public void setCode_etablissement(String code_etablissement) {
        this.code_etablissement = code_etablissement;
    }
}
