package com.evaluation.DAO;

import com.evaluation.models.Publication;

import java.util.List;

public interface PublicationDAO {

    public void savePublication(Publication p);
    public List<Publication> getPublicationbyIdEns(int IdEns);
    public void supprPublication(int id_pub);
    public void UpdatePublication(Publication pub);

}
