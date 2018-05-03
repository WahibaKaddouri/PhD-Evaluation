package com.evaluation.DAO;

import com.evaluation.models.Enseignant;
import com.evaluation.models.Grille;
import com.evaluation.models.SousVariable;
import com.evaluation.models.Variable;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;

@Repository
@Transactional
public class EvaluationDAOImpl implements EvaluationDAO{


    @Autowired
    private SessionFactory sessionFactory;

    public void setSessionfactory(SessionFactory sessionfactory) {
        this.sessionFactory = sessionfactory;
    }

    public void saveGrille(Grille grille){
        Session session= sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        try{
            session.save(grille);
            tx.commit();
            session.close();
        } catch (Exception e)
        {
            tx.rollback();
            session.close();
            e.printStackTrace();
        }
    }
    public void saveVariable(Variable variable){
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        try {
            session.save(variable);
            tx.commit();
            session.close();
        } catch (Exception ex)
        {
            tx.rollback();
            session.close();
            ex.printStackTrace();
        }
    }
    public void saveSousVariable(SousVariable sousVariable){
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        try {
            session.save(sousVariable);
            tx.commit();
            session.close();
        } catch (Exception ex)
            {
                tx.rollback();
                session.close();
                ex.printStackTrace();
        }
    }
    public Grille getGrilleEnseingnat(Enseignant enseignant)
    {
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        Query query = session.createQuery("FROM Grille WHERE ens_id=:ens");
        query.setParameter("ens",enseignant);
        Grille grille = (Grille) query.getSingleResult();
        tx.commit();
        session.close();
        return grille;
    }
    public List<Variable> getVariableGrille(Grille grille){
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        Query query = session.createQuery("FROM Variable WHERE grille=:grille");
        query.setParameter("grille",grille);
        try{
            List<Variable> liste = (List<Variable>)query.getResultList();
                    //getSingleResult();
            tx.commit();
            session.close();
            return liste;
        }
        catch (Exception ex){
            tx.rollback();
            session.close();
            return null;
        }
    }


    public Variable getVariableUniqueGrille(String nom, Grille grille){

        Session session = sessionFactory.openSession();

        Transaction tx = session.beginTransaction();
        Query query = session.createQuery("FROM Variable WHERE grille=:grille and nom=:nom");

        query.setParameter("grille",grille);
        query.setParameter("nom", nom);
        try{
            Variable var= (Variable)query.getSingleResult();
            //getSingleResult();
            tx.commit();
            session.close();
            return var;

        }
        catch (Exception ex) {
            tx.rollback();
            session.close();
            return null;
        }


    }

    public List<Variable> getVariableEns(Enseignant ens){
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        Grille grille = getGrilleEnseingnat(ens);
        List<Variable> variables= getVariableGrille(grille);

        return variables;
    }


    public void updateGrille(Grille g){
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        Grille grille = (Grille)session.get(Grille.class, g.getId_grille());
        session.evict(grille);
        session.flush();
        grille.setVariable(g.getVariable());
        session.merge(grille);
        session.flush();

    }
    public void updateVariable(Variable variable){
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        Variable var = (Variable)session.get(Variable.class, variable.getId() );
        session.evict(var);
        session.flush();
        var.setSousVariable(variable.getSousVariable());
        session.merge(var);
        session.flush();
    }

    public int getNbrPointsTotalSV (Variable variable){

        int sum=0;
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        Query query = session.createQuery("FROM SousVariable WHERE variable=:variable");
        query.setParameter("variable",variable);
        try{
            List<SousVariable> list = (List<SousVariable>)query.getResultList();
            //getSingleResult();
            tx.commit();
            for (int i = 0; i < list.size(); i++) {
                SousVariable sv = list.get(i);
                int varint= Integer.parseInt(sv.getPointSousVar());
                System.out.println(varint);
                sum=sum+varint;

            }


            session.close();
            return sum;

        }
        catch (Exception ex){
            tx.rollback();
            session.close();
            return 0;

        }



    }


    public void setNbrPointsTotalSV (Variable variable){

        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();



        variable.setTotal_point(getNbrPointsTotalSV(variable));
        session.update(variable);
        tx.commit();
        session.close();



    }

}
