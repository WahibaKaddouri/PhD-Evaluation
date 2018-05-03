package com.evaluation.DAO;

import com.evaluation.models.Observation;
import com.evaluation.models.Ouvrage;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;

@Repository
@Transactional
public class ObservationDAOImpl implements ObservationDAO {

    @Autowired
    private SessionFactory sessionFactory;

    public void setSessionfactory(SessionFactory sessionfactory) {
        this.sessionFactory = sessionfactory;
    }

    public void saveObservation(Observation o) {

        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        if(o!=null){
            try {
                session.save(o);
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
