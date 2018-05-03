package com.evaluation.services;

import com.evaluation.DAO.EncadrementDAO;
import com.evaluation.models.Encadrement;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class EncadrementServiceImpl implements EncadrementService {

    @Autowired
    private EncadrementDAO e;


    public void setE(EncadrementDAO e){
        this.e=e;
    }

    public void saveEncadrement(Encadrement enc){

        e.saveEncadrement(enc);

    }

    public List<Encadrement> getEncadrementbyIdEns(int IdEns){ return e.getEncadrementbyIdEns(IdEns);}

}
