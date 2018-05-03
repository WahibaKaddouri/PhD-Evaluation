package com.evaluation.DAO;

import com.evaluation.models.Etablissement;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;



@Repository
@Transactional
public class EtablissementDAOImpl implements EtablissementDAO {

    @Autowired
    private SessionFactory sessionFactory;


    public List<Etablissement> getAllEtablissements() {
        return sessionFactory.getCurrentSession().createQuery("select code_etablissement from Etablissement")
                .list();
    }
}
