package com.evaluation.services;

import com.evaluation.models.Ouvrage;

import java.util.List;


public interface OuvrageService {

    public void saveOuvrage(Ouvrage o);
    public List<Ouvrage> getOuvragebyIdEns(int IdEns);
    public void supprOuvrage(int id_ouv);
    public void UpdateOuvrage(Ouvrage o);

}
