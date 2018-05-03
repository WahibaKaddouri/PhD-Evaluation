package com.evaluation.services;

import com.evaluation.models.Enseignant;
import com.evaluation.models.Utilisateur;

import java.util.List;


public interface EnseignantService {

    void saveEnseignant(Enseignant ens);
    Enseignant loginEnseignant(Enseignant ens);
    List<Enseignant> getEnseignantBySection(int section);
    public Enseignant getEnseignantById(int enseignant);
    public int getSessionId();
    List<Enseignant> getAllEnsEtablissement(String etablissement);
}
