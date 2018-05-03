package com.evaluation.DAO;
import com.evaluation.models.Responsabilité;
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
public class ResponsabilitéDAOImpl implements ResponsabilitéDAO {

    @Autowired
    private SessionFactory sessionFactory;

    public void setSessionfactory(SessionFactory sessionfactory) {
        this.sessionFactory = sessionfactory;
    }

    public void saveResponsabilité(Responsabilité resp) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        if(resp!=null){
            try {
                session.save(resp);
                tx.commit();
                session.close();
            } catch (Exception e) {
                tx.rollback();
                session.close();
                e.printStackTrace();
            }
        }
    }

    public List<Responsabilité> getResponsabilitebyIdEns(int IdEns) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();

        try {
            Query query = session.createQuery("FROM com.evaluation.models.Responsabilité as resp  WHERE resp.code_ens =: IdE");
            query.setParameter("IdE", IdEns);
            List<Responsabilité> list = query.list();
            tx.commit();
            session.close();
            return list;
        }
        catch (Exception e){
            tx.rollback();
            session.close();
            e.printStackTrace();
            List<Responsabilité> list = null;
            return list;
        }
    }
}