package com.evaluation.services;
import com.evaluation.models.Observation;

import java.util.List;

public interface ObservationService {
    public void saveObservation(Observation obs);
    public List<Observation> getListObservation();
    public Observation getObservationById(int enseignant);
}
