package com.evaluation.DAO;

import com.evaluation.models.Section;
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
public class SectionDAOImpl implements SectionDAO {

    @Autowired
    private SessionFactory sessionFactory;
    public List<Section> getAllSection() {
        return sessionFactory.getCurrentSession().createQuery("from Section")
                .list();
    }

    public int getSectionId(String section){

        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        try {
            Query query = session.createQuery("FROM Section  WHERE code_section=:section" );
            query.setParameter("section", section);
            Section sec  = (Section) query.getSingleResult();
            tx.commit();
            session.close();
            return sec.getId_section();
        }
        catch (Exception e){
            tx.rollback();
            session.close();
            e.printStackTrace();
            return 0;
        }

    }
}
