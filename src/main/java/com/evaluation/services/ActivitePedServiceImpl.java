package com.evaluation.services;

import com.evaluation.DAO.ActivitePedDAO;
import com.evaluation.models.Activité_Pédagogique;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class ActivitePedServiceImpl implements ActivitePedService {

    @Autowired
    private ActivitePedDAO APDAO;


    public void setAPDAO(ActivitePedDAO APDAO){
        this.APDAO=APDAO;
    }

    public void saveActivitePed(Activité_Pédagogique ap){

        APDAO.saveActivitePed(ap);

    }

    public List<Activité_Pédagogique> getEnseignementbyIdEns(int IdEns){
        return APDAO.getEnseignementbyIdEns(IdEns);
    }

    public void supprActivite(int id_actP) {
        APDAO.supprActivite(id_actP);
    }
    public void updateActivitePed(Activité_Pédagogique ap){APDAO.updateActivitePed(ap);}

}
