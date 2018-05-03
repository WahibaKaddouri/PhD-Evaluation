package com.evaluation.DAO;

import com.evaluation.models.Etablissement;
import com.evaluation.models.Section;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;

@Repository
@Transactional
public class SectionDAOImpl implements SectionDAO{

    @Autowired
    private SessionFactory sessionFactory;
    public List<Section> getAllSection() {
        return sessionFactory.getCurrentSession().createQuery("from Section")
                .list();
    }
}
