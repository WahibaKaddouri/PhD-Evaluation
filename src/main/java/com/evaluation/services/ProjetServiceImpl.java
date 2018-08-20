package com.evaluation.services;

import com.evaluation.DAO.ProjetDAO;
import com.evaluation.models.Projet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


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

    public void supprProjet(int id_pro){p.supprProjet(id_pro);}
    public List<Projet> getProjetbyIdEns(int IdEns){return p.getProjetbyIdEns(IdEns);}
    public void UpdateProjet(Projet pro){p.UpdateProjet(pro);}

}
