package com.evaluation.DAO;

import com.evaluation.models.Dossier;
import com.evaluation.models.Enseignant;
import com.evaluation.models.Utilisateur;
import org.hibernate.query.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.util.List;


public class EnseignantDAOImpl implements EnseignantDAO {

    @Autowired
    private SessionFactory sessionFactory;


    public void setSessionfactory(SessionFactory sessionfactory) {
        this.sessionFactory = sessionfactory;
    }

    public void saveEnseignant(Enseignant ens) {


        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        ens.setPassword("dfa0c63e57a8fd8423df66af57020670");
        Utilisateur user = new Utilisateur();
        user.setPassword("dfa0c63e57a8fd8423df66af57020670");
        user.setUsername(ens.getEmail());
        user.setRoles("ENS");

        if(ens!=null){
            try {
                session.save(user);
                session.save(ens);
                tx.commit();
                session.close();
            } catch (Exception e) {
                tx.rollback();
                session.close();
                e.printStackTrace();
            }
        }
    }

    public Enseignant loginEnseignant(Enseignant ens) {

       Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        String hql = "from com.evaluation.models.Enseignant as c where c.email =? and c.password =?";
        try {
            Query query = session.createQuery(hql);
            query.setParameter(0, ens.getEmail());
            query.setParameter(1, ens.getPassword());
            ens = (Enseignant) query.uniqueResult();
            tx.commit();
            session.close();
        } catch (Exception e) {
            tx.rollback();
            session.close();
            e.printStackTrace();
        }
        return ens;

    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public Enseignant findUserByName(String username) {

        Session session = sessionFactory.openSession();
        return session.createNativeQuery(
                "SELECT * " +
                        "FROM enseignant " +
                        "WHERE email like :email", Enseignant.class )
                .setParameter("email", username).getSingleResult();

    }


    public List<Enseignant> getEnseignantBySection(int section) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        try {
            Query query = session.createQuery("FROM Enseignant  WHERE id_section=:sec" );
            query.setParameter("sec", section);
            List<Enseignant> list = query.list();
            tx.commit();
            session.close();
            return list;
        }
        catch (Exception e){
            tx.rollback();
            session.close();
            e.printStackTrace();
            List<Enseignant> list = null;
            return list;
        }
    }

    public Enseignant getEnseignantById(int enseignant){

        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        try {
            Query query = session.createQuery("FROM Enseignant  WHERE id=:enseignant" );
            query.setParameter("enseignant", enseignant);
            Enseignant ens = (Enseignant) query.getSingleResult();
            tx.commit();
            session.close();
            return ens;
        }
        catch (Exception e){
            tx.rollback();
            session.close();
            e.printStackTrace();
            return null;
        }

    }

    public int getSessionId(){

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (!(authentication instanceof AnonymousAuthenticationToken)) {
            String currentUserName = authentication.getName();

            Session session = sessionFactory.openSession();
            Transaction tx = session.beginTransaction();
            try {
                Query query = session.createQuery("FROM Enseignant  WHERE email=:UserName" );
                query.setParameter("UserName", currentUserName);
                Enseignant ens = (Enseignant) query.getSingleResult();
                tx.commit();
                session.close();
                return ens.getId();
            }
            catch (Exception e){
                tx.rollback();
                session.close();
                e.printStackTrace();
                return 0;
            }

        }
        else {return 0;}

    }

    public List<Enseignant> getAllEnsEtablissement(String etablissement){
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        try {
            Query query = session.createQuery("FROM Enseignant WHERE id_etablissement=:etablissement" );
            query.setParameter("etablissement", etablissement);
            List<Enseignant> list = query.list();
            tx.commit();
            session.close();
            return list;
        }
        catch (Exception e){
            tx.rollback();
            session.close();
            e.printStackTrace();
            List<Enseignant> list = null;
            return list;
        }
    }

    public List<Enseignant> getListEnseignant() {
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        try {
            Query query = session.createQuery("SELECT a FROM Enseignant a " );
            List<Enseignant> list = query.list();
            tx.commit();
            session.close();
            return list;
        }
        catch (Exception e){
            tx.rollback();
            session.close();
            e.printStackTrace();
            List<Enseignant> list = null;
            return list;
        }
    }

    public String getENSName(){

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (!(authentication instanceof AnonymousAuthenticationToken)) {
            String currentUserName = authentication.getName();

            Session session = sessionFactory.openSession();
            Transaction tx = session.beginTransaction();
            try {
                Query query = session.createQuery("FROM Enseignant  WHERE email=:UserName" );
                query.setParameter("UserName", currentUserName);
                Enseignant ens = (Enseignant) query.getSingleResult();
                tx.commit();
                session.close();
                return ens.getPrenom();
            }
            catch (Exception e){
                tx.rollback();
                session.close();
                e.printStackTrace();
                return "";
            }

        }
        else {return "";}

    }


    public String getENSPrenom(){

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (!(authentication instanceof AnonymousAuthenticationToken)) {
            String currentUserName = authentication.getName();

            Session session = sessionFactory.openSession();
            Transaction tx = session.beginTransaction();
            try {
                Query query = session.createQuery("FROM Enseignant  WHERE email=:UserName" );
                query.setParameter("UserName", currentUserName);
                Enseignant ens = (Enseignant) query.getSingleResult();
                tx.commit();
                session.close();
                return ens.getNom();
            }
            catch (Exception e){
                tx.rollback();
                session.close();
                e.printStackTrace();
                return "";
            }

        }
        else {return "";}

    }

    public  void  saveDossier(Dossier dossier){

        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();


        if(dossier!=null){
            try {

                session.save(dossier);
                tx.commit();
                session.close();
            } catch (Exception e) {
                tx.rollback();
                session.close();
                e.printStackTrace();
            }
        }


    }

    public void updateDossier(Dossier d){

        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        d.setEtat("Dossier soumis");
        session.update(d);
        tx.commit();
        session.close();
    }
    public Dossier getEnsDossier(int ens_id){

        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        try {
            Query query1 = session.createQuery("FROM Enseignant  WHERE id=:ens_id" );
            query1.setParameter("ens_id", ens_id);
            Enseignant ens = (Enseignant) query1.getSingleResult();
            System.out.println(ens.getId());


            Query query = session.createQuery("FROM Dossier  WHERE ens_id=:ens" );
            query.setParameter("ens", ens);
            Dossier d = (Dossier) query.getSingleResult();

            System.out.println(d.getEns_id());
            tx.commit();
            session.close();
            return d;
        }
        catch (Exception e){
            tx.rollback();
            session.close();
            e.printStackTrace();
            return null;
        }



    }

}
