package com.evaluation.services;

;
import com.evaluation.DAO.EnseignantDAO;
import com.evaluation.DAO.EnseignantDAOImpl;
import com.evaluation.DAO.EtablissementDAO;
import com.evaluation.models.Enseignant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


public class EnseignantServiceImpl implements EnseignantService {

    @Autowired
    private EnseignantDAO EnsDAO;


    public void setEnsDAO(EnseignantDAO EnsDAO){
        this.EnsDAO=EnsDAO;
    }
    public void saveEnseignant(Enseignant ens) {

        EnsDAO.saveEnseignant(ens);

    }

    public Enseignant loginEnseignant(Enseignant ens) {
        return EnsDAO.loginEnseignant(ens);
    }

    public List<Enseignant> getEnseignantBySection(int section) {
        return EnsDAO.getEnseignantBySection(section);
    }

    public Enseignant getEnseignantById(int enseignant){

        return  EnsDAO.getEnseignantById(enseignant);
    }
    public int getSessionId(){

        return EnsDAO.getSessionId();
    }

    public List<Enseignant> getAllEnsEtablissement(String etablissement) {
        return EnsDAO.getAllEnsEtablissement(etablissement);
    }



}
