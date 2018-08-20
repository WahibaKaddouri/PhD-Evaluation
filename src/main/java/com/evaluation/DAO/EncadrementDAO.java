package com.evaluation.DAO;

import com.evaluation.models.Encadrement;

import java.util.List;

public interface EncadrementDAO {

    public void saveEncadrement(Encadrement e);
    public List<Encadrement> getEncadrementbyIdEns(int IdEns);
    public void supprEncadrement(int id_enc);
    public void UpdateEncadrement(Encadrement enc);

}
