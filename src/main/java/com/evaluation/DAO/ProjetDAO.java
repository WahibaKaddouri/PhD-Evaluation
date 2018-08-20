package com.evaluation.DAO;

import com.evaluation.models.Projet;

import java.util.List;

public interface ProjetDAO {

    public void saveProjet(Projet p);
    public void supprProjet(int id_pro);
    public List<Projet> getProjetbyIdEns(int IdEns);
    public void UpdateProjet(Projet pro);

}
