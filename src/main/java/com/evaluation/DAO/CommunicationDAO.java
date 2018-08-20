package com.evaluation.DAO;

import com.evaluation.models.Communication;

import java.util.List;

public interface CommunicationDAO {

    public void saveCommunication(Communication c);
    public List<Communication> getCommunicationbyIdEns(int IdEns);
    public void supprCommunication(int id_com);
    public void UpdateCommunication(Communication com);

}
