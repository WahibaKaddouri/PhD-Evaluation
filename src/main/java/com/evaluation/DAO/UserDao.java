package com.evaluation.DAO;

import com.evaluation.models.Enseignant;
import com.evaluation.models.Utilisateur;

import java.util.List;

public interface UserDao {
	void addUser(Utilisateur user);
	void editUser(Utilisateur user);
	void deleteUser(int userId);
	Utilisateur findUser(int userId);
	Utilisateur findUserByName(String username);
	List<Utilisateur> getAllUsers();
	String getEtablissementUser();
	String getUserRole();
}
