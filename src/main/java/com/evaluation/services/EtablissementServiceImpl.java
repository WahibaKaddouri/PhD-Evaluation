package com.evaluation.services;

import com.evaluation.DAO.EtablissementDAO;
import com.evaluation.DAO.EtablissementDAOImpl;
import com.evaluation.models.Etablissement;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EtablissementServiceImpl implements EtablissementDAO {

    @Autowired
    private EtablissementDAOImpl EtbDAO;

    public List<Etablissement> getAllEtablissements() {
        return EtbDAO.getAllEtablissements();

    }
}
