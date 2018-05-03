package com.evaluation.DAO;
import com.evaluation.models.Publication;
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
public class PublicationDAOImpl implements PublicationDAO {

    @Autowired
    private SessionFactory sessionFactory;

    public void setSessionfactory(SessionFactory sessionfactory) {
        this.sessionFactory = sessionfactory;
    }

    public void savePublication(Publication pub) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        if(pub!=null){
            try {
                session.save(pub);
                tx.commit();
                session.close();
            } catch (Exception e) {
                tx.rollback();
                session.close();
                e.printStackTrace();
            }
        }
    }

    public List<Publication> getPublicationbyIdEns(int IdEns) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        try {
            Query query = session.createQuery("FROM com.evaluation.models.Publication as pub  WHERE pub.code_ens =: IdE");
            query.setParameter("IdE", IdEns);
            List<com.evaluation.models.Publication> list = query.list();
            tx.commit();
            session.close();
            return list;
        }
        catch (Exception e){
            tx.rollback();
            session.close();
            e.printStackTrace();
            List<Publication> list = null;
            return list;
        }
    }
}