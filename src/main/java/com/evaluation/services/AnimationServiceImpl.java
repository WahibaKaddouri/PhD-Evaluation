package com.evaluation.services;

import com.evaluation.DAO.AnimationDAO;
import com.evaluation.models.Animation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class AnimationServiceImpl implements AnimationService {

    @Autowired
    private AnimationDAO a;


    public void setA(AnimationDAO a){
        this.a=a;
    }

    public void saveAnimation(Animation an){

        a.saveAnimation(an);

    }

}
