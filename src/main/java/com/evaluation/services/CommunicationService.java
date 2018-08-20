package com.evaluation.services;

import com.evaluation.models.Communication;

import java.util.List;


public interface CommunicationService {

    public void saveCommunication(Communication com);
    public List<Communication> getCommunicationbyIdEns(int IdEns);
    public void supprCommunication(int id_com);
    public void UpdateCommunication(Communication com);


}
