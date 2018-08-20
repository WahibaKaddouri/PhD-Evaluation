package com.evaluation.DAO;
import com.evaluation.models.Activité_Pédagogique;
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


    public void updateActivitePed(Activité_Pédagogique ap) {

        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        if(ap!=null){
            try {

                session.update(ap);
                tx.commit();
                session.close();
            } catch (Exception e) {
                tx.rollback();
                session.close();
                e.printStackTrace();
            }
        }
    }


    public List<Activité_Pédagogique> getEnseignementbyIdEns(int IdEns) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        try {
            Query query = session.createQuery("FROM com.evaluation.models.Activité_Pédagogique as ap  WHERE ap.id_ens =: IdE");
            query.setParameter("IdE", IdEns);
            List<Activité_Pédagogique> list = query.list();
            tx.commit();
            session.close();
            return list;
        }
        catch (Exception e){
            tx.rollback();
            session.close();
            e.printStackTrace();
            List<Activité_Pédagogique> list = null;
            return list;
        }
    }

    public void supprActivite(int id_actP) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        try {
            Query query = session.createQuery("FROM com.evaluation.models.Activité_Pédagogique as ap  WHERE ap.id_actP =: IdA");
            query.setParameter("IdA", id_actP);
            List<Activité_Pédagogique> list = query.list();
            for (Activité_Pédagogique ap: list){
                session.delete(ap);
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