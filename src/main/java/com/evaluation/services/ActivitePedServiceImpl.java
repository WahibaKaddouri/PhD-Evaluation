package com.evaluation.services;

import com.evaluation.DAO.ActivitePedDAO;
import com.evaluation.DAO.EnseignantDAO;
import com.evaluation.models.Activité_Pédagogique;
import com.evaluation.models.Enseignant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


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

}
