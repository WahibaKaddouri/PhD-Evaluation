package com.evaluation.DAO;

import com.evaluation.models.Animation;

import java.util.List;

public interface AnimationDAO {

    public void saveAnimation(Animation a);
    public List<Animation> getAnimationbyIdEns(int IdAnim);
    public void supprAnimation(int id_anim);
    public void UpdateAnimation(Animation anim);

}
