package com.evaluation.DAO;

import com.evaluation.models.Etablissement;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;



public interface EtablissementDAO {

    public List<Etablissement> getAllEtablissements() ;
}
