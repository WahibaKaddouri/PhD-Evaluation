package com.evaluation.services;

import com.evaluation.DAO.OuvrageDAO;
import com.evaluation.models.Ouvrage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class OuvrageServiceImpl implements OuvrageService {

    @Autowired
    private OuvrageDAO o;


    public void setO(OuvrageDAO o){
        this.o=o;
    }

    public void saveOuvrage(Ouvrage ouv){

        o.saveOuvrage(ouv);

    }

    public List<Ouvrage> getOuvragebyIdEns(int IdEns){return o.getOuvragebyIdEns(IdEns);}

}
