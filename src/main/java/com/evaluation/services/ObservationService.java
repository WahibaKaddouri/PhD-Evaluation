package com.evaluation.services;
import com.evaluation.models.Observation;
import org.hibernate.SessionFactory;

public interface ObservationService {
    public void saveObservation(Observation obs);
}
