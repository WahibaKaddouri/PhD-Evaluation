package com.evaluation.services;

import com.evaluation.models.Expertise;

import java.util.List;


public interface ExpertiseService {

    public void saveExpertise(Expertise e);
    public void supprExpertise(int id_exp);
    public List<Expertise> getExpertisebyIdEns(int IdEns);
    public void UpdateExpertise(Expertise exp);

}
