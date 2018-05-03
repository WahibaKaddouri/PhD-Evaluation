package com.evaluation.DAO;

import java.util.List;

import com.evaluation.models.Enseignant;
import com.evaluation.models.Utilisateur;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Repository;

@Repository
public class UserDaoImpl implements UserDao {
	@Autowired
	private SessionFactory sessionFactory;
	

	public void addUser(Utilisateur user) {
		sessionFactory.getCurrentSession().save(user);
	}


	public void editUser(Utilisateur user) {
		sessionFactory.getCurrentSession().update(user);
	}


	public void deleteUser(int userId) {
		sessionFactory.getCurrentSession().delete(findUser(userId));
	}


	public Utilisateur findUser(int userId) {
		return (Utilisateur) sessionFactory.getCurrentSession().get(Utilisateur.class, userId);
	}


	public Utilisateur findUserByName(String username) {

		Session session = sessionFactory.openSession();
		return session.createNativeQuery(
				"SELECT * " +
						"FROM utilisateur " +
						"WHERE username like :email", Utilisateur.class )
				.setParameter("email", username).getSingleResult();




	}



	public List<Utilisateur> getAllUsers() {
		return sessionFactory.getCurrentSession().createQuery("from User").list();
	}


    public String getEtablissementUser(){

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (!(authentication instanceof AnonymousAuthenticationToken)) {
            String currentUserName = authentication.getName();

            Session session = sessionFactory.openSession();
            Transaction tx = session.beginTransaction();
            try {
                Query query = session.createQuery("FROM Utilisateur  WHERE username=:UserName" );
                query.setParameter("UserName", currentUserName);
                Utilisateur user = (Utilisateur) query.getSingleResult();
                tx.commit();
                session.close();
                return user.getEtablissement();
            }
            catch (Exception e){
                tx.rollback();
                session.close();
                e.printStackTrace();
                return null;
            }

        }
        else {return null;}


    }

}
