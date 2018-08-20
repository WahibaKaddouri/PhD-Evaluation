package com.evaluation.services;

import com.evaluation.DAO.UserDao;
import com.evaluation.DAO.UserDaoImpl;
import com.evaluation.models.Utilisateur;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class UserServiceImpl implements UserService{

    @Autowired
    private UserDao userDao;

    public void addUser(Utilisateur user){userDao.addUser(user);}
    public void editUser(Utilisateur user){userDao.editUser(user);}
    public void deleteUser(int userId){userDao.deleteUser(userId);}
    public Utilisateur findUser(int userId){return userDao.findUser(userId);}
    public Utilisateur findUserByName(String username){return userDao.findUserByName(username);}
    public List<Utilisateur> getAllUsers(){return userDao.getAllUsers();}
    public String getEtablissementUser() { return userDao.getEtablissementUser();
    }
    public String getUserRole(){return userDao.getUserRole(); }


}
