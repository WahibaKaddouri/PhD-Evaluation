package com.evaluation.services;

import com.evaluation.models.Utilisateur;

import java.util.List;

public interface UserService {
    public void addUser(Utilisateur user);
    public void editUser(Utilisateur user);
    public void deleteUser(int userId);
    public Utilisateur findUser(int userId);
    public Utilisateur findUserByName(String username);
    public List<Utilisateur> getAllUsers();
    String getEtablissementUser();
    String getUserRole();


}
