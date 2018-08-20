package com.evaluation.DAO;

import com.evaluation.models.*;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.*;

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

    public int getNbrPointsGrille(Grille grille){

        int sum=0;
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        Query query = session.createQuery("FROM Variable WHERE grille=:grille");
        query.setParameter("grille",grille);
        try{
            List<Variable> list = (List<Variable>)query.getResultList();
            //getSingleResult();
            tx.commit();
            for (int i = 0; i < list.size(); i++) {
                Variable v = list.get(i);
                int varint= v.getTotal_point();
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

    public void setNbrPointsObservationGrille(Grille grille){

        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        grille.setNoteFinale(getNbrPointsGrille(grille));
        session.update(grille);
        tx.commit();
        session.close();


    }

    public void updateGrilleObservation(Grille grille, String Observation ){

        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        grille.setObservation(Observation);
        session.update(grille);
        tx.commit();
        session.close();

    }

    public  List<Enseignant> getEnsAcceptes(String observation, int section ){

        Session session = sessionFactory.openSession();
        List<Enseignant> listeEns = new ArrayList();
        int noteFinale =0;

        Transaction tx = session.beginTransaction();
        Query query = session.createQuery("FROM Grille WHERE observation=:observation");
        Query query2 = session.createQuery("FROM Grille WHERE noteFinale=:noteFinale");

        query.setParameter("observation",observation);
        query2.setParameter("noteFinale",noteFinale);

        try{
            List<Grille> list = (List<Grille>)query.getResultList();
            List<Grille> list2 = (List<Grille>)query2.getResultList();
            if (list.isEmpty()) System.out.println(("viiide2"));
            if (list2.isEmpty()) System.out.println(("viiide3"));
            tx.commit();
            if  (observation=="Candidatures non evaluees") {

                for (int i = 0; i < list2.size(); i++) {
                    Grille g = list2.get(i);
                    Enseignant ens = g.getEns_id();
                    if (ens.getId_section() == section) {

                        listeEns.add(ens);
                        System.out.println(ens.getId());
                    }


                }

                session.close();
                return listeEns;
            }

                else{
                    for (int i = 0; i < list.size(); i++) {
                        Grille g = list.get(i);
                        Enseignant ens = g.getEns_id();
                        if (ens.getId_section() == section) {

                            listeEns.add(ens);
                            System.out.println(ens.getId());
                        }


                    }

                    session.close();
                    return listeEns;
                }


        }
        catch (Exception ex) {
            tx.rollback();
            session.close();
            return null;
        }

    }

}
