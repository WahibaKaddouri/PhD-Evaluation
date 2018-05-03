package com.evaluation.services;

import com.evaluation.DAO.ProjetDAO;
import com.evaluation.models.Projet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class ProjetServiceImpl implements ProjetService {

    @Autowired
    private ProjetDAO p;


    public void setE(ProjetDAO p){
        this.p=p;
    }

    public void saveProjet(Projet pro){

        p.saveProjet(pro);

    }

}
