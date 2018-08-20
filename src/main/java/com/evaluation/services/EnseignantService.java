package com.evaluation.services;

import com.evaluation.models.Dossier;
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
    List<Enseignant> getListEnseignant();
    public String getENSName();
    public String getENSPrenom();
    public  void  saveDossier(Dossier dossier);
    public void updateDossier(Dossier d);
    public Dossier getEnsDossier(int ens_id);


}
