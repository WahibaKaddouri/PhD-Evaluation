package com.evaluation.DAO;

import com.evaluation.models.Observation;
import org.hibernate.SessionFactory;

import java.util.List;

public interface ObservationDAO  {
    void setSessionfactory(SessionFactory sessionfactory);
    public void saveObservation(Observation o);
    public List<Observation> getListObservation();
    public Observation getObservationById(int enseignant);
}
