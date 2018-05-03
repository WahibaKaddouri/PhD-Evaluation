package com.evaluation.DAO;
import com.evaluation.models.Encadrement;
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
public class EncadrementDAOImpl implements EncadrementDAO {

    @Autowired
    private SessionFactory sessionFactory;

    public void setSessionfactory(SessionFactory sessionfactory) {
        this.sessionFactory = sessionfactory;
    }

    public void saveEncadrement(Encadrement enc) {

        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        if(enc!=null){
            try {
                session.save(enc);
                tx.commit();
                session.close();
            } catch (Exception e) {
                tx.rollback();
                session.close();
                e.printStackTrace();
            }
        }
    }

    public List<Encadrement> getEncadrementbyIdEns(int IdEns) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();

        try {
            Query query = session.createQuery("FROM com.evaluation.models.Encadrement as Enc  WHERE Enc.code_ens =: IdE");
            query.setParameter("IdE", IdEns);
            List<Encadrement> list = query.list();
            tx.commit();
            session.close();
            return list;
        }
        catch (Exception e){
            tx.rollback();
            session.close();
            e.printStackTrace();
            List<Encadrement> list = null;
            return list;
        }
    }


}