package com.evaluation.DAO;

import com.evaluation.models.Observation;
import org.hibernate.SessionFactory;

public interface ObservationDAO  {
    void setSessionfactory(SessionFactory sessionfactory);
    public void saveObservation(Observation o);
}
