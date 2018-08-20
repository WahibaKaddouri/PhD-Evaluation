package com.evaluation.services;

import com.evaluation.DAO.FichierDAOImpl;
import com.evaluation.models.Fichier;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class FichierServiceImpl implements FichierService {

    @Autowired
    FichierDAOImpl FichierDAO;
    public void addFichier(Fichier fichier) {
        FichierDAO.addFichier(fichier);

    }
    public void supprFichier(Fichier file){FichierDAO.supprFichier(file);}

}
