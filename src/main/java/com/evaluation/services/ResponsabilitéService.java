package com.evaluation.services;

import com.evaluation.models.Responsabilité;

import java.util.List;


public interface ResponsabilitéService {

    public void saveResponsabilité(Responsabilité resp);
    public List<Responsabilité> getResponsabilitebyIdEns(int IdEns);
    public void supprResponsabilité(int id_resp);
    public void UpdateResponsabilité(Responsabilité resp);

}
