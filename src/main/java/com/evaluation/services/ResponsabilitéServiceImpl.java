package com.evaluation.services;

import com.evaluation.DAO.ResponsabilitéDAO;
import com.evaluation.models.Responsabilité;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class ResponsabilitéServiceImpl implements ResponsabilitéService {

    @Autowired
    private ResponsabilitéDAO r;


    public void setR(ResponsabilitéDAO r){
        this.r=r;
    }

    public void saveResponsabilité(Responsabilité resp){

        r.saveResponsabilité(resp);

    }
    public List<Responsabilité> getResponsabilitebyIdEns(int IdEns){return r.getResponsabilitebyIdEns(IdEns);}

    public void supprResponsabilité(int id_resp){r.supprResponsabilité(id_resp);}

    public void UpdateResponsabilité(Responsabilité resp){r.UpdateResponsabilité(resp);}

}
