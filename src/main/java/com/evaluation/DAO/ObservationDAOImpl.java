package com.evaluation.DAO;

import com.evaluation.models.Enseignant;
import com.evaluation.models.Observation;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;

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


    public List<Observation> getListObservation() {
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        try {
            Query query = session.createQuery("SELECT a FROM Observation a " );
            List<Observation> list = query.list();
            tx.commit();
            session.close();
            return list;
        }
        catch (Exception e){
            tx.rollback();
            session.close();
            e.printStackTrace();
            List<Observation> list = null;
            return list;
        }
    }

    public Observation getObservationById(int enseignant){

        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        try {
            Query query = session.createQuery("FROM com.evaluation.models.Observation as obs WHERE obs.code_ens =: enseignant" );
            query.setParameter("enseignant", enseignant);
            Observation ens = (Observation) query.getSingleResult();
            tx.commit();
            session.close();
            return ens;
        }
        catch (Exception e){
            tx.rollback();
            session.close();
            e.printStackTrace();
            return null;
        }

    }
}
