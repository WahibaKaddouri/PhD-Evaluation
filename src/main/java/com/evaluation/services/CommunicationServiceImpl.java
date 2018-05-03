package com.evaluation.services;

import com.evaluation.DAO.CommunicationDAO;
import com.evaluation.models.Communication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class CommunicationServiceImpl implements CommunicationService {

    @Autowired
    private CommunicationDAO c;


    public void setC(CommunicationDAO c){
        this.c=c;
    }

    public void saveCommunication(Communication com){

        c.saveCommunication(com);

    }
    public List<Communication> getCommunicationbyIdEns(int IdEns){return c.getCommunicationbyIdEns(IdEns);}

}
