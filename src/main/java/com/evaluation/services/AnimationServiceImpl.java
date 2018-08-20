package com.evaluation.services;

import com.evaluation.DAO.AnimationDAO;
import com.evaluation.models.Animation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


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

    public List<Animation> getAnimationbyIdEns(int IdAnim){return a.getAnimationbyIdEns(IdAnim);}
    public void supprAnimation(int id_anim){a.supprAnimation(id_anim);}
    public void UpdateAnimation(Animation anim){a.UpdateAnimation(anim);}

}
