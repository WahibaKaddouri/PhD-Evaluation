package com.evaluation.DAO;

import com.evaluation.models.Dossier;
import com.evaluation.models.Enseignant;

import java.util.List;

public interface EnseignantDAO {

    public void saveEnseignant(Enseignant ens);
    public Enseignant loginEnseignant(Enseignant ens);
    public Enseignant findUserByName(String username);
    public List<Enseignant> getEnseignantBySection(int section);
    public Enseignant getEnseignantById(int enseignant);
    public int getSessionId();
    List<Enseignant> getAllEnsEtablissement(String etablissement);
    List<Enseignant> getListEnseignant();
    public String getENSName();
    public String getENSPrenom();
    public void  saveDossier(Dossier dossier);
    public void updateDossier(Dossier dossier);
    public Dossier getEnsDossier(int ens);
}
