package com.evaluation.DAO;
import com.evaluation.models.Activité_Pédagogique;
import org.hibernate.Session;
import org.hibernate.SessionBuilder;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;


@Repository
@Transactional
public class ActivitePedDAOImpl implements ActivitePedDAO {

    @Autowired
    private SessionFactory sessionFactory;

    public void setSessionfactory(SessionFactory sessionfactory) {
        this.sessionFactory = sessionfactory;
    }

    public void saveActivitePed(Activité_Pédagogique ap) {

        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        if(ap!=null){
            try {
                session.save(ap);
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