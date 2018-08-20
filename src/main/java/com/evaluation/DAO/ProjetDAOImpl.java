package com.evaluation.DAO;
import com.evaluation.models.Projet;
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
public class ProjetDAOImpl implements ProjetDAO {

    @Autowired
    private SessionFactory sessionFactory;

    public void setSessionfactory(SessionFactory sessionfactory) {
        this.sessionFactory = sessionfactory;
    }

    public void saveProjet(Projet pro) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        if(pro!=null){
            try {
                session.save(pro);
                tx.commit();
                session.close();
            } catch (Exception e) {
                tx.rollback();
                session.close();
                e.printStackTrace();
            }
        }
    }



    public void UpdateProjet(Projet pro) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        if(pro!=null){
            try {
                session.update(pro);
                tx.commit();
                session.close();
            } catch (Exception e) {
                tx.rollback();
                session.close();
                e.printStackTrace();
            }
        }
    }

    public List<Projet> getProjetbyIdEns(int IdEns) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();

        try {
            Query query = session.createQuery("FROM com.evaluation.models.Projet as ouv  WHERE ouv.code_ens =: IdE");
            query.setParameter("IdE", IdEns);
            List<Projet> list = query.list();
            tx.commit();
            session.close();
            return list;
        }
        catch (Exception e){
            tx.rollback();
            session.close();
            e.printStackTrace();
            List<Projet> list = null;
            return list;
        }
    }

    public void supprProjet(int id_pro) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        try {
            Query query = session.createQuery("FROM com.evaluation.models.Projet as ap  WHERE ap.id_pro =: IdE");
            query.setParameter("IdE", id_pro);
            List<Projet> list = query.list();
            for (Projet a: list){
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