package com.evaluation.services;

import com.evaluation.models.Activité_Pédagogique;

import java.util.List;


public interface ActivitePedService {

    public void saveActivitePed(Activité_Pédagogique ap);
    public List<Activité_Pédagogique> getEnseignementbyIdEns(int IdEns);
    public void supprActivite(int id_actP);
    public void updateActivitePed(Activité_Pédagogique ap);

}
