package com.evaluation.DAO;

import com.evaluation.models.Expertise;

import java.util.List;

public interface ExpertiseDAO {

    public void saveExpertise(Expertise ex);
    public void supprExpertise(int id_exp);
    public List<Expertise> getExpertisebyIdEns(int IdEns);
    public void UpdateExpertise(Expertise exp);

}
