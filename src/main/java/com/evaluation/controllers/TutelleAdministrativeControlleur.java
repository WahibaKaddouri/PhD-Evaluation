package com.evaluation.controllers;

import com.evaluation.models.Enseignant;
import com.evaluation.models.Fichier;
import com.evaluation.models.Section;
import com.evaluation.services.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.ServletContext;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;


@Controller
public class TutelleAdministrativeControlleur {


    @Autowired
    private EnseignantServiceImpl EnseignantService;

    @Autowired
    private EtablissementServiceImpl EtablissementService;

    @Autowired
    private SectionServiceImpl SectionService;

    @Autowired
    private EvaluationServiceImpl EvaluationService;

    @Autowired
    private UserServiceImpl UserService;

    @Autowired
    ServletContext context;

    @RequestMapping(value = "/Administration", method = RequestMethod.GET)
    public String AcceuilCun2(ModelMap model){
        List<Section> sections = SectionService.getAllSection();
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (!(authentication instanceof AnonymousAuthenticationToken)) {

            System.out.println(UserService.getEtablissementUser());
           String etablissement = UserService.getEtablissementUser();

            model.addAttribute ("etablissement", etablissement);
        }
        model.addAttribute ("section", sections);

        return ("Accueil_CUN2");
    }

    @RequestMapping(value = "/Administration/Listecandidat/", method = RequestMethod.GET)
    public String ShowList2( ModelMap model){

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (!(authentication instanceof AnonymousAuthenticationToken)) {

            String etablissement = UserService.getEtablissementUser();
            List<Enseignant> listes = EnseignantService.getAllEnsEtablissement(etablissement);
            model.addAttribute ("etablissement", etablissement);
            model.addAttribute("liste", listes);
        }


        return ("Liste_Candidats2");

    }

    @RequestMapping(value = "/Administration/dossier/{enseignant}", method = RequestMethod.GET)

    public String ShowDossierCandidat2(@PathVariable("enseignant") int enseignant, ModelMap model) throws IOException {

        Enseignant ens = EnseignantService.getEnseignantById(enseignant);
        model.addAttribute("idEns", ens.getId());

        String downloadFolder = context.getRealPath("/resources/files/Administratifs/");
        String downloadFolder1 = context.getRealPath("/resources/files/Pédagogiques/");
        File folder=new File(downloadFolder+ens.getId()+"/");
        File folder1=new File(downloadFolder1+ens.getId()+"/");
        System.out.println(folder);
        File[] fList = folder.listFiles();
        File[] fList1 = folder1.listFiles();
        List<String> names=  new ArrayList();
        List<String> names1=  new ArrayList();

        for (File file : fList){
            if (file.isFile()){
                System.out.println(file.getName());
                names.add(file.getName());

            }
            else{
                System.out.println("Folder : "+file.getName());
            }
        }

        for (File file1 : fList1){
            if (file1.isFile()){
                System.out.println(file1.getName());
                names1.add(file1.getName());

            }
            else{
                System.out.println("Folder : "+file1.getName());
            }
        }
        model.addAttribute("fichiers",names);
        model.addAttribute("fichiers1",names1);

        return ("Fichiers_Administratifs");

    }
}
