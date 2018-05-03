package com.evaluation.models;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import java.util.List;
import java.util.Set;

@JsonIgnoreProperties(ignoreUnknown = true)
public class ListSousVariable {
    Set<SousVariable> listeSousVariable;
    public Set <SousVariable> getListeSousVariable()
    {
        return listeSousVariable;
    }
    public void setListeSousVariable(Set <SousVariable> liste)
    {
        this.listeSousVariable=liste;
    }
}
