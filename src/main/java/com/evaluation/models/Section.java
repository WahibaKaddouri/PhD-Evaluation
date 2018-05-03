package com.evaluation.models;


import javax.persistence.*;

@Entity
@Table
public class Section {
    @Id
    @Column
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id_section;
    @Column
    private String code_section;

    public Section(){}

    public Section(String code_section) {
        this.code_section = code_section;
    }

    public int getId_section() {
        return id_section;
    }

    public void setId_section(int id_section) {
        this.id_section = id_section;
    }

    public String getCode_section() {
        return code_section;
    }

    public void setCode_section(String code_section) {
        this.code_section = code_section;
    }
}
