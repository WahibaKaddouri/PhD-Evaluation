package com.evaluation.DAO;
import com.evaluation.models.Expertise;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;


@Repository
@Transactional
public class ExpertiseDAOImpl implements ExpertiseDAO {

    @Autowired
    private SessionFactory sessionFactory;

    public void setSessionfactory(SessionFactory sessionfactory) {
        this.sessionFactory = sessionfactory;
    }

    public void saveExpertise(Expertise exp) {

        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        if(exp!=null){
            try {
                session.save(exp);
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