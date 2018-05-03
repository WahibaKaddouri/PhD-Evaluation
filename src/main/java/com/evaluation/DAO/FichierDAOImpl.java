package com.evaluation.DAO;

import com.evaluation.models.Fichier;
import com.evaluation.models.Utilisateur;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;


@Repository
@Transactional
public class FichierDAOImpl implements FichierDAO {

    @Autowired
    private SessionFactory sessionFactory;

    public void addFichier(Fichier fichier) {

        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();

        if(fichier!=null){
            try {

                session.save(fichier);
                tx.commit();
                session.close();
            } catch (Exception e) {
                tx.rollback();
                session.close();
                e.printStackTrace();
            }
        }


    }
}
