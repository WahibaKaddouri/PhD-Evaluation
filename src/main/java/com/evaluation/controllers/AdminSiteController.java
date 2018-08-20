package com.evaluation.controllers;

import com.evaluation.models.Etablissement;
import com.evaluation.models.Utilisateur;
import com.evaluation.services.EnseignantServiceImpl;
import com.evaluation.services.EtablissementServiceImpl;
import com.evaluation.services.UserDetailsServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import static java.lang.System.out;

@Controller
public class AdminSiteController {
    @Autowired
    private UserDetailsServiceImpl UserDetailService;
    @Autowired
    private com.evaluation.services.UserService UserService;

    @Autowired
    private EnseignantServiceImpl EnseignantService;
    @Autowired

    private EtablissementServiceImpl EtablissementService;
    @RequestMapping(value = "/AdminSite", method = RequestMethod.GET)
    public String showAccueilAdministration(ModelMap model)
    {
        List<Utilisateur> users = UserService.getAllUsers();
        int nb_users = users.size();
        List<Utilisateur> usersCUN = new ArrayList<Utilisateur>();
        Iterator<Utilisateur> it = users.iterator();
        while (it.hasNext()){
            Utilisateur o = it.next();
            if(o.getRoles().compareTo("CUN")==0){
                usersCUN.add(o);
            }
        }
        int nb_CUN = usersCUN.size();
        List<Utilisateur> usersADM = new ArrayList<Utilisateur>();
        Iterator<Utilisateur> it1 = users.iterator();
        while (it1.hasNext()){
            Utilisateur o = it1.next();
            if(o.getRoles().compareTo("ADM")==0){
                usersADM.add(o);
            }
        }
        int nb_Admin = usersADM.size();
        model.addAttribute("nb_users",nb_users);
        model.addAttribute("nb_CUN",nb_CUN);
        model.addAttribute("nb_Admin",nb_Admin);
        model.addAttribute("users",users);
        return ("Accueil_AdminSite");
    }


    @RequestMapping(value="/AdminSite/CUN", method = RequestMethod.GET)
    public String ShowCUN(ModelMap model, HttpSession session){
        List<Utilisateur> users = UserService.getAllUsers();
        List<Utilisateur> usersCUN = new ArrayList<Utilisateur>();
        Iterator<Utilisateur> it = users.iterator();
        while (it.hasNext()){
            Utilisateur o = it.next();
            if(o.getRoles().compareTo("CUN")==0){
                usersCUN.add(o);
            }
        }
        model.addAttribute("userData", new Utilisateur());
        model.addAttribute("usersCUN", usersCUN);
        return ("AdminSite_CUN");
    }
    @RequestMapping(value = "/AdminSite/CUN", method = RequestMethod.POST)
    public String saveUserCUN(ModelMap model, @ModelAttribute("userData")Utilisateur user, HttpSession session)
    {
        user.setRoles("CUN");
        UserService.addUser(user);
        List<Utilisateur> users = UserService.getAllUsers();
        List<Utilisateur> usersCUN = new ArrayList<Utilisateur>();
        Iterator<Utilisateur> it = users.iterator();
        while (it.hasNext()){
            Utilisateur o = it.next();
            if(o.getRoles().compareTo("CUN")==0){
                usersCUN.add(o);
            }
        }
        model.addAttribute("usersCUN", usersCUN);
        return ("AdminSite_CUN");
    }
    @RequestMapping(value="/AdminSite/Administration", method = RequestMethod.GET)
    public String ShowAdministration(ModelMap model){
        List<Etablissement> etablissements = EtablissementService.getAllEtablissements();
        List<Utilisateur> users = UserService.getAllUsers();
        List<Utilisateur> usersADM = new ArrayList<Utilisateur>();
        Iterator<Utilisateur> it = users.iterator();
        while (it.hasNext()){
            Utilisateur o = it.next();
            if(o.getRoles().compareTo("ADM")==0){
                usersADM.add(o);
            }
        }
        model.addAttribute("etablissements", etablissements);
        model.addAttribute("usersADM", usersADM);
        model.addAttribute("userData", new Utilisateur());
        out.println("Asma2");
        return ("AdminSite_Administration");
    }
    @RequestMapping(value = "/AdminSite/Administration", method = RequestMethod.POST)
    public String saveUserAdmin(ModelMap model, @ModelAttribute("userData") @Valid Utilisateur user, BindingResult result, HttpSession session)
    {
        user.setRoles("ADM");
        UserService.addUser(user);
        List<Utilisateur> users = UserService.getAllUsers();
        List<Utilisateur> usersADM = new ArrayList<Utilisateur>();
        Iterator<Utilisateur> it = users.iterator();
        while (it.hasNext()){
            Utilisateur o = it.next();
            if(o.getRoles().compareTo("ADM")==0){
                usersADM.add(o);
            }
        }
        model.addAttribute("usersADM", usersADM);

        return ("AdminSite_Administration");
    }
    @RequestMapping(value="/AdminSite/Delete/{id}", method = RequestMethod.GET)
    public String deleteUser(@PathVariable int id, ModelMap model) throws IOException
    {
        UserService.deleteUser(id);

        List<Utilisateur> users = UserService.getAllUsers();
        int nb_users = users.size();
        List<Utilisateur> usersCUN = new ArrayList<Utilisateur>();
        Iterator<Utilisateur> it = users.iterator();
        while (it.hasNext()){
            Utilisateur o = it.next();
            if(o.getRoles().compareTo("CUN")==0){
                usersCUN.add(o);
            }
        }
        int nb_CUN = usersCUN.size();
        List<Utilisateur> usersADM = new ArrayList<Utilisateur>();
        Iterator<Utilisateur> it1 = users.iterator();
        while (it1.hasNext()){
            Utilisateur o = it1.next();
            if(o.getRoles().compareTo("ADM")==0){
                usersADM.add(o);
            }
        }
        int nb_Admin = usersADM.size();
        model.addAttribute("nb_users",nb_users);
        model.addAttribute("nb_CUN",nb_CUN);
        model.addAttribute("nb_Admin",nb_Admin);

        model.addAttribute("users", users);

        return ("Accueil_AdminSite");
    }


}
