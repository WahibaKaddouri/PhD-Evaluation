package com.evaluation.DAO;
import com.evaluation.models.Demande;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;


@Repository
@Transactional
public class DemandeDAOImpl implements DemandeDAO {

    @Autowired
    private SessionFactory sessionFactory;

    public void setSessionfactory(SessionFactory sessionfactory) {
        this.sessionFactory = sessionfactory;
    }

    public void saveDemande(Demande d) {

        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        if(d!=null){
            try {
                session.save(d);
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