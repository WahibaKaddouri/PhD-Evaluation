package com.evaluation.DAO;
import com.evaluation.models.Communication;
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
public class CommunicationDAOImpl implements CommunicationDAO {

    @Autowired
    private SessionFactory sessionFactory;

    public void setSessionfactory(SessionFactory sessionfactory) {
        this.sessionFactory = sessionfactory;
    }

    public void saveCommunication(Communication com) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        if(com!=null){
            try {
                session.save(com);
                tx.commit();
                session.close();
            } catch (Exception e) {
                tx.rollback();
                session.close();
                e.printStackTrace();
            }
        }
    }


    public void UpdateCommunication(Communication com) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        if(com!=null){
            try {
                session.update(com);
                tx.commit();
                session.close();
            } catch (Exception e) {
                tx.rollback();
                session.close();
                e.printStackTrace();
            }
        }
    }


    public List<Communication> getCommunicationbyIdEns(int IdEns) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();

        try {
            Query query = session.createQuery("FROM com.evaluation.models.Communication as com  WHERE com.code_ens =: IdE");
            query.setParameter("IdE", IdEns);
            List<Communication> list = query.list();
            tx.commit();
            session.close();
            return list;
        }
        catch (Exception e){
            tx.rollback();
            session.close();
            e.printStackTrace();
            List<Communication> list = null;
            return list;
        }
    }


    public void supprCommunication(int id_com) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        try {
            Query query = session.createQuery("FROM com.evaluation.models.Communication as ap  WHERE ap.id_com =: IdC");
            query.setParameter("IdC", id_com);
            List<Communication> list = query.list();
            for (Communication a: list){
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