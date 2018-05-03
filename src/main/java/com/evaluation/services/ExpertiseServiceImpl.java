package com.evaluation.services;

import com.evaluation.DAO.ExpertiseDAO;
import com.evaluation.models.Expertise;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class ExpertiseServiceImpl implements ExpertiseService {

    @Autowired
    private ExpertiseDAO ex;


    public void setEX(ExpertiseDAO ex){
        this.ex=ex;
    }

    public void saveExpertise(Expertise e){

        ex.saveExpertise(e);

    }

}
