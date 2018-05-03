package com.evaluation.DAO;
import com.evaluation.models.Animation;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;


@Repository
@Transactional
public class AnimationDAOImpl implements AnimationDAO {

    @Autowired
    private SessionFactory sessionFactory;

    public void setSessionfactory(SessionFactory sessionfactory) {
        this.sessionFactory = sessionfactory;
    }

    public void saveAnimation(Animation anim) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        if(anim!=null){
            try {
                session.save(anim);
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