package com.evaluation.DAO;
import com.evaluation.models.Animation;
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


    public void UpdateAnimation(Animation anim) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        if(anim!=null){
            try {
                session.update(anim);
                tx.commit();
                session.close();
            } catch (Exception e) {
                tx.rollback();
                session.close();
                e.printStackTrace();
            }
        }
    }

    public List<Animation> getAnimationbyIdEns(int IdEns) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        try {
            Query query = session.createQuery("FROM com.evaluation.models.Animation as a  WHERE a.code_ens =: IdE");
            query.setParameter("IdE", IdEns);
            List<Animation> list = query.list();
            tx.commit();
            session.close();
            return list;
        }
        catch (Exception e){
            tx.rollback();
            session.close();
            e.printStackTrace();
            List<Animation> list = null;
            return list;
        }
    }

    public void supprAnimation(int id_anim) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        try {
            Query query = session.createQuery("FROM com.evaluation.models.Animation as ap  WHERE ap.id_anim =: IdAn");
            query.setParameter("IdAn", id_anim);
            List<Animation> list = query.list();
            for (Animation a: list){
                session.delete(a);
            }
            tx.commit();
            session.close();
        }
        catch (Exception e){
            tx.rollback();
            session.close();
            e.printStackTrace();

        }
    }
}