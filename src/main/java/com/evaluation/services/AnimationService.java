package com.evaluation.services;

import com.evaluation.models.Animation;

import java.util.List;


public interface AnimationService {

    public void saveAnimation(Animation a);
    public List<Animation> getAnimationbyIdEns(int IdAnim);
    public void supprAnimation(int id_anim);
    public void UpdateAnimation(Animation anim);

}
