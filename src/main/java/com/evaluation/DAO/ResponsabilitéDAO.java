package com.evaluation.DAO;

import com.evaluation.models.Responsabilité;

import java.util.List;

public interface ResponsabilitéDAO {

    public void saveResponsabilité(Responsabilité r);
    public List<Responsabilité> getResponsabilitebyIdEns(int IdEns);

}
