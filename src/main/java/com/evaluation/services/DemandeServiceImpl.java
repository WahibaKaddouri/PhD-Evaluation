package com.evaluation.services;

import com.evaluation.DAO.DemandeDAO;
import com.evaluation.models.Demande;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class DemandeServiceImpl implements DemandeService {

    @Autowired
    private DemandeDAO dm;


    public void setDm(DemandeDAO dm){
        this.dm=dm;
    }

    public void saveDemande(Demande d){

        dm.saveDemande(d);

    }

}
