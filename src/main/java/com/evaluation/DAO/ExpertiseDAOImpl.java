package com.evaluation.DAO;
import com.evaluation.models.Expertise;
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


    public void UpdateExpertise(Expertise exp) {

        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        if(exp!=null){
            try {
                session.update(exp);
                tx.commit();
                session.close();
            } catch (Exception e) {
                tx.rollback();
                session.close();
                e.printStackTrace();
            }
        }
    }


    public List<Expertise> getExpertisebyIdEns(int IdEns) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();

        try {
            Query query = session.createQuery("FROM com.evaluation.models.Expertise as Enc  WHERE Enc.code_ens =: IdE");
            query.setParameter("IdE", IdEns);
            List<Expertise> list = query.list();
            tx.commit();
            session.close();
            return list;
        }
        catch (Exception e){
            tx.rollback();
            session.close();
            e.printStackTrace();
            List<Expertise> list = null;
            return list;
        }
    }




    public void supprExpertise(int id_exp) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        try {
            Query query = session.createQuery("FROM com.evaluation.models.Expertise as ap  WHERE ap.id_exp =: IdE");
            query.setParameter("IdE", id_exp);
            List<Expertise> list = query.list();
            for (Expertise a: list){
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