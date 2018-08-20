package com.evaluation.services;

import com.evaluation.DAO.PublicationDAO;
import com.evaluation.models.Publication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class PublicationServiceImpl implements PublicationService {

    @Autowired
    private PublicationDAO p;


    public void setE(PublicationDAO p){
        this.p=p;
    }

    public void savePublication(Publication pub){

        p.savePublication(pub);

    }

    public List<Publication> getPublicationbyIdEns(int IdEns){return p.getPublicationbyIdEns(IdEns);}
    public void supprPublication(int id_pub){p.supprPublication(id_pub);}
    public void UpdatePublication(Publication pub){p.UpdatePublication(pub);}


}
