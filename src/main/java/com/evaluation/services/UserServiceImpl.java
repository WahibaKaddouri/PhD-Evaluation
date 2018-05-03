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
    private UserDaoImpl UserDAO;

    public String getEtablissementUser() {
        return UserDAO.getEtablissementUser();
    }


}
