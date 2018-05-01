package com.evaluation.controllers;

import com.evaluation.models.Enseignant;
import com.evaluation.models.Section;
import com.evaluation.services.EnseignantServiceImpl;
import com.evaluation.services.EtablissementServiceImpl;
import com.evaluation.services.EvaluationServiceImpl;
import com.evaluation.services.SectionServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.ServletContext;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

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
    ServletContext context;

    @RequestMapping(value = "/Administration", method = RequestMethod.GET)
    public String AcceuilCun2(ModelMap model){
        List<Section> sections = SectionService.getAllSection();
        model.addAttribute ("section", sections);
        return ("Accueil_CUN2");
    }

    @RequestMapping(value = "/Administration/Listecandidat/{section}", method = RequestMethod.GET)
    public String ShowList2(@PathVariable("section") int section, ModelMap model){
        List<Enseignant> listes = EnseignantService.getEnseignantBySection(section);
        model.addAttribute("liste", listes);
        model.addAttribute("izri", section);
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
