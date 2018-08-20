package com.evaluation.services;

import com.evaluation.models.Publication;

import java.util.List;


public interface PublicationService {

    public void savePublication(Publication p);
    List<Publication> getPublicationbyIdEns(int IdEns);
    public void supprPublication(int id_pub);
    public void UpdatePublication(Publication pub);

}
