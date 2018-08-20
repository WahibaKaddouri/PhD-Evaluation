package com.evaluation.DAO;
import com.evaluation.models.Ouvrage;
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
public class OuvrageDAOImpl implements OuvrageDAO {

    @Autowired
    private SessionFactory sessionFactory;

    public void setSessionfactory(SessionFactory sessionfactory) {
        this.sessionFactory = sessionfactory;
    }

    public void saveOuvrage(Ouvrage o) {

        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        if(o!=null){
            try {
                System.out.println("DAO");
                System.out.println(o.getTitre());
                System.out.println(o.getAuteurs());
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

    public void UpdateOuvrage(Ouvrage o) {

        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        if(o!=null){
            try {

                session.update(o);
                tx.commit();
                session.close();
            } catch (Exception e) {
                tx.rollback();
                session.close();
                e.printStackTrace();
            }
        }
    }

    public List<Ouvrage> getOuvragebyIdEns(int IdEns) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();

        try {
            Query query = session.createQuery("FROM com.evaluation.models.Ouvrage as ouv  WHERE ouv.code_ens =: IdE");
            query.setParameter("IdE", IdEns);
            List<Ouvrage> list = query.list();
            tx.commit();
            session.close();
            return list;
        }
        catch (Exception e){
            tx.rollback();
            session.close();
            e.printStackTrace();
            List<Ouvrage> list = null;
            return list;
        }
    }

    public void supprOuvrage(int id_ouv) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        try {
            Query query = session.createQuery("FROM com.evaluation.models.Ouvrage as ap  WHERE ap.id_ouv =: IdE");
            query.setParameter("IdE", id_ouv);
            List<Ouvrage> list = query.list();
            for (Ouvrage a: list){
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