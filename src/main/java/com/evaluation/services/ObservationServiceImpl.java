package com.evaluation.services;

import com.evaluation.DAO.ObservationDAO;
import com.evaluation.models.Observation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class ObservationServiceImpl implements ObservationService {

    @Autowired
    private ObservationDAO obs;


    public void setO(ObservationDAO o){
        this.obs=o;
    }

    public void saveObservation(Observation ob){

        obs.saveObservation(ob);

    }

}
