package com.evaluation.controllers;

import com.evaluation.models.*;
import com.evaluation.services.*;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.type.TypeFactory;
import org.omg.CORBA.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.util.*;

@Controller
public class CunController {
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

    @RequestMapping(value = "/CUN", method = RequestMethod.GET)
    public String AcceuilCun(ModelMap model){
        List<Section> sections = SectionService.getAllSection();
        model.addAttribute ("section", sections);
        return ("accueil_cun");
    }



    @RequestMapping(value = "/CUN/Listecandidat/{section}", method = RequestMethod.GET)
    public String ShowList(@PathVariable("section") int section, ModelMap model){
        List<Enseignant> listes = EnseignantService.getEnseignantBySection(section);
        model.addAttribute("liste", listes);
        model.addAttribute("izri", section);
        return ("Liste_Candidats");

    }



    @RequestMapping(value = "/CUN/Evaluation/{enseignant}", method = RequestMethod.GET)

    public String ShowEvaluation(@PathVariable("enseignant") int enseignant, ModelMap model) throws IOException {
        Enseignant ens = EnseignantService.getEnseignantById(enseignant);
        List<Variable> variables= EvaluationService.getVariableEns(ens);
        Grille grille = EvaluationService.getGrilleEnseingnat(ens);
        if (variables.size()!=4) {

            Variable variable1 = new Variable(grille);
            variable1.setNom("Encadrement");
            EvaluationService.saveVariable(variable1);


            Variable variable2 = new Variable(grille);
            variable2.setNom("ActivitesPedagogiques");
            EvaluationService.saveVariable(variable2);

            Variable variable3 = new Variable(grille);
            variable3.setNom("ProductionScientifiques");
            EvaluationService.saveVariable(variable3);

            Variable variable4 = new Variable(grille);
            variable4.setNom("ResponsabilitesAdministratives");
            EvaluationService.saveVariable(variable4);

            variables.add(variable1);
            variables.add(variable2);
            variables.add(variable3);
            variables.add(variable4);
            }


        model.addAttribute("ens", ens);
        System.out.println(ens.getNom());
        model.addAttribute("variables", variables);


        return ("EvaluationCandidat");

    }

    @RequestMapping(value = "/CUN/Evaluation/Encadrement/{enseignant}", method = RequestMethod.GET)

    public String ShowGrilleEncadrement(@PathVariable("enseignant") int enseignant, ModelMap model) throws IOException {

        Enseignant ens = EnseignantService.getEnseignantById(enseignant);
        model.addAttribute("ens", ens);

        return ("GrilleEncadrement");

    }


    @RequestMapping(value = "/CUN/Evaluation/Encadrement/{enseignant}", method = RequestMethod.POST)
    public @ResponseBody
    String getDataEncadrement(@RequestBody String data, HttpServletRequest request, HttpServletResponse response, @PathVariable("enseignant") int enseignant) throws IOException
    { try {
        ObjectMapper mapper = new ObjectMapper();
        TypeFactory typeFactory = mapper.getTypeFactory();
        System.out.println(data);
        Enseignant ens = EnseignantService.getEnseignantById(enseignant);
        List<SousVariable> myObjects = mapper.readValue(data, typeFactory.constructCollectionType(List.class, SousVariable.class));
        Iterator<SousVariable> iter = myObjects.iterator();
        System.out.println("m1");
        Grille grille = EvaluationService.getGrilleEnseingnat(ens);
        System.out.println(grille.getEns_id());
        List<Variable> variables= EvaluationService.getVariableGrille(grille);
        Variable variable= EvaluationService.getVariableUniqueGrille("Encadrement", grille);
        System.out.println(variable.getNom());
        System.out.println("m3");
        Set<SousVariable> x = new HashSet<SousVariable>();
        while (iter.hasNext()) {
            SousVariable sous = iter.next();
            sous.setVariable(variable);
            EvaluationService.saveSousVariable(sous);
            x.add(sous);
            System.out.println("m");
        }
        variable.setSousVariable(x);
        EvaluationService.updateVariable(variable);
        EvaluationService.setNbrPointsTotalSV(variable);

        Set<Variable> liste = grille.getVariable();
        liste.add(variable);
        grille.setVariable(liste);
        EvaluationService.updateGrille(grille);

        return ("GrilleEncadrement");}

        catch (JsonParseException e){ return ("La grille a été bien sauvegardée !");}

    }

    @RequestMapping(value = "/CUN/Evaluation/ActivitesPedagogiques/{enseignant}", method = RequestMethod.GET)

    public String ShowGrilleAP(@PathVariable("enseignant") int enseignant, ModelMap model) throws IOException {

        Enseignant ens = EnseignantService.getEnseignantById(enseignant);
        model.addAttribute("ens", ens);

        return ("GrilleActivitesPedagogiques");

    }


    @RequestMapping(value = "/CUN/Evaluation/ActivitesPedagogiques/{enseignant}", method = RequestMethod.POST)
    public @ResponseBody
    String getData(@RequestBody String data, HttpServletRequest request, HttpServletResponse response, @PathVariable("enseignant") int enseignant) throws IOException
    { try {
        ObjectMapper mapper = new ObjectMapper();
        TypeFactory typeFactory = mapper.getTypeFactory();
        Enseignant ens = EnseignantService.getEnseignantById(enseignant);
        List<SousVariable> myObjects = mapper.readValue(data, typeFactory.constructCollectionType(List.class, SousVariable.class));
        Iterator<SousVariable> iter = myObjects.iterator();
        Grille grille = EvaluationService.getGrilleEnseingnat(ens);
        System.out.println(grille.getEns_id());

        List<Variable> variables= EvaluationService.getVariableGrille(grille);
        Variable variable= EvaluationService.getVariableUniqueGrille("ActivitesPedagogiques", grille);
        System.out.println(variable.getNom());

        Set<SousVariable> x = new HashSet<SousVariable>();
        while (iter.hasNext()) {
            SousVariable sous = iter.next();
            sous.setVariable(variable);
            EvaluationService.saveSousVariable(sous);
            x.add(sous);

        }
        variable.setSousVariable(x);
        EvaluationService.updateVariable(variable);
        EvaluationService.setNbrPointsTotalSV(variable);

        Set<Variable> liste = grille.getVariable();
        liste.add(variable);
        grille.setVariable(liste);
        EvaluationService.updateGrille(grille);

        return ("GrilleActivitesPedagogiques");}

    catch (JsonParseException e){ return ("La grille a été bien sauvegardée !");}

    }


    @RequestMapping(value = "/CUN/Evaluation/ProductionScientifiques/{enseignant}", method = RequestMethod.GET)

    public String ShowGrillePS(@PathVariable("enseignant") int enseignant, ModelMap model) throws IOException {

        Enseignant ens = EnseignantService.getEnseignantById(enseignant);
        model.addAttribute("ens", ens);

        return ("GrilleProductionScientifique");

    }


    @RequestMapping(value = "/CUN/Evaluation/ProductionScientifiques/{enseignant}", method = RequestMethod.POST)
    public @ResponseBody
    String getDataPS(@RequestBody String data, HttpServletRequest request, HttpServletResponse response, @PathVariable("enseignant") int enseignant) throws IOException
    { try {
        ObjectMapper mapper = new ObjectMapper();
        TypeFactory typeFactory = mapper.getTypeFactory();
        Enseignant ens = EnseignantService.getEnseignantById(enseignant);
        List<SousVariable> myObjects = mapper.readValue(data, typeFactory.constructCollectionType(List.class, SousVariable.class));
        Iterator<SousVariable> iter = myObjects.iterator();
        Grille grille = EvaluationService.getGrilleEnseingnat(ens);
        System.out.println(grille.getEns_id());
        List<Variable> variables= EvaluationService.getVariableGrille(grille);
        Variable variable= EvaluationService.getVariableUniqueGrille("ProductionScientifiques", grille);
        Set<SousVariable> x = new HashSet<SousVariable>();
        while (iter.hasNext()) {
            SousVariable sous = iter.next();
            sous.setVariable(variable);
            EvaluationService.saveSousVariable(sous);
            x.add(sous);

        }
        variable.setSousVariable(x);
        EvaluationService.updateVariable(variable);
        EvaluationService.setNbrPointsTotalSV(variable);

        Set<Variable> liste = grille.getVariable();
        liste.add(variable);
        grille.setVariable(liste);
        EvaluationService.updateGrille(grille);

        return ("GrilleProductionScientifique");}

    catch (JsonParseException e){ return ("La grille a été bien sauvegardée !");}

    }
    @RequestMapping(value = "/CUN/TableauBord", method = RequestMethod.GET)
    public String ShowTableauBord(ModelMap model )
    {
        int liste[] = new int[8];
        //List<Integer> liste = new ArrayList<Integer>();
        List<Enseignant> ens = new ArrayList<Enseignant>();
        int i=0;
        for ( i=1; i< 8; i++){
            ens = EnseignantService.getEnseignantBySection(i);
            if (ens==null)
            { liste[i]=0;}
            else {
                liste[i]= ens.size();}
        }
        model.addAttribute("liste", liste);
        return ("TableauBord");
    }

    @RequestMapping(value = "/CUN/Evaluation/ResponsabilitesAdministratives/{enseignant}", method = RequestMethod.GET)

    public String ShowGrilleRS(@PathVariable("enseignant") int enseignant, ModelMap model) throws IOException {

        Enseignant ens = EnseignantService.getEnseignantById(enseignant);
        model.addAttribute("ens", ens);

        return ("GrilleResponsabilitesAdministratives");

    }


    @RequestMapping(value = "/CUN/Evaluation/ResponsabilitesAdministratives/{enseignant}", method = RequestMethod.POST)
    public @ResponseBody
    String getDataRS(@RequestBody String data, HttpServletRequest request, HttpServletResponse response, @PathVariable("enseignant") int enseignant) throws IOException
    { try {
        ObjectMapper mapper = new ObjectMapper();
        TypeFactory typeFactory = mapper.getTypeFactory();
        Enseignant ens = EnseignantService.getEnseignantById(enseignant);
        List<SousVariable> myObjects = mapper.readValue(data, typeFactory.constructCollectionType(List.class, SousVariable.class));
        Iterator<SousVariable> iter = myObjects.iterator();
        Grille grille = EvaluationService.getGrilleEnseingnat(ens);
        System.out.println(grille.getEns_id());
        List<Variable> variables= EvaluationService.getVariableGrille(grille);
        Variable variable= EvaluationService.getVariableUniqueGrille("ResponsabilitesAdministratives", grille);
        System.out.println(variable.getNom());
        Set<SousVariable> x = new HashSet<SousVariable>();
        while (iter.hasNext()) {
            SousVariable sous = iter.next();
            sous.setVariable(variable);
            EvaluationService.saveSousVariable(sous);
            x.add(sous);

        }
        variable.setSousVariable(x);
        EvaluationService.updateVariable(variable);
        EvaluationService.setNbrPointsTotalSV(variable);

        Set<Variable> liste = grille.getVariable();
        liste.add(variable);
        grille.setVariable(liste);
        EvaluationService.updateGrille(grille);

        return ("GrilleResponsabilitesAdministratives");}

    catch (JsonParseException e){ return "Grille sauvegardée avec succes !";}

    }

    @RequestMapping(value = "/CUN/dossier/{enseignant}", method = RequestMethod.GET)

    public String ShowDossierCandidat(@PathVariable("enseignant") int enseignant, ModelMap model) throws IOException {

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
