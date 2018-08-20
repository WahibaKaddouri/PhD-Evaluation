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
import javax.validation.Valid;
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
    private ResponsabilitéServiceImpl ResponsabilitéService;

    @Autowired
    private SectionServiceImpl SectionService;

    @Autowired
    private EvaluationServiceImpl EvaluationService;

    @Autowired
    private ObservationServiceImpl ObservationService;

    @Autowired
    private UserServiceImpl UserService;

    @Autowired
    private OuvrageServiceImpl OuvrageService;

    @Autowired
    private EncadrementServiceImpl EncadrementService;

    @Autowired
    private PublicationServiceImpl PublicationService;

    @Autowired
    private CommunicationServiceImpl CommunicationService;

    @Autowired
    private ProjetServiceImpl ProjetService;

    @Autowired
    private AnimationServiceImpl AnimationService;

    @Autowired
    private ExpertiseServiceImpl ExpertiseService;



    @Autowired
    private ActivitePedServiceImpl ActivitePedService;

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
        List<Enseignant> listeAcceptes = EvaluationService.getEnsAcceptes("Candidature acceptee", section);
        List<Enseignant> listeRefuses = EvaluationService.getEnsAcceptes("Candidature rejetee", section);
        List<Enseignant> listeNEval = EvaluationService.getEnsAcceptes("Candidatures non evaluees", section);

        model.addAttribute("liste1", listeAcceptes);
        model.addAttribute("liste", listes);
        model.addAttribute("liste2", listeRefuses);
        model.addAttribute("liste3", listeNEval);

        return ("Liste_Candidats");

    }



    @RequestMapping(value = "/CUN/Evaluation/{enseignant}", method = RequestMethod.GET)

    public String ShowEvaluation(@PathVariable("enseignant") int enseignant, ModelMap model) throws IOException {
        Enseignant ens = EnseignantService.getEnseignantById(enseignant);
        List<Observation> obs= ObservationService.getListObservation();
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
        model.addAttribute("obs", obs);
        model.addAttribute("grille", grille);
        System.out.println(ens.getNom());
        model.addAttribute("variables", variables);


        return ("EvaluationCandidat");

    }

    @RequestMapping(value = "/CUN/Evaluation/{enseignant}", method = RequestMethod.POST)

    public String ShowEvaluationPost( @PathVariable("enseignant") int enseignant, ModelMap model, @RequestParam(value="observation") String observation ){

            Enseignant ens = EnseignantService.getEnseignantById(enseignant);
            List<Variable> variables= EvaluationService.getVariableEns(ens);
            Grille grille = EvaluationService.getGrilleEnseingnat(ens);
            EvaluationService.updateGrilleObservation( grille, observation);

            model.addAttribute("ens", ens);
            model.addAttribute("grille", grille);
            System.out.println(ens.getNom());
            model.addAttribute("variables", variables);


            return ("EvaluationCandidat");


    }

    @RequestMapping(value = "/CUN/Evaluation//Encadrement/{enseignant}", method = RequestMethod.GET)

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
        Grille grille = EvaluationService.getGrilleEnseingnat(ens);
        System.out.println(grille.getEns_id());
        Variable variable= EvaluationService.getVariableUniqueGrille("Encadrement", grille);
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
        EvaluationService.setNbrPointsObservationGrille(grille);
        Set<Variable> liste = grille.getVariable();
        liste.add(variable);
        grille.setVariable(liste);
        EvaluationService.updateGrille(grille);

        return ("GrilleEncadrement");}

        catch (JsonParseException e){ return  ("<body style=\"background-color:#696969\"><div class=\"w3-dark-grey w3-padding-48 w3-display-container\" style=\"background-color:##696969\">\n" +
                "<span class=\"w3-display-topmiddle w3-hide-small\" style=\"margin-top:16px\"></span>\n" +
                "<span class=\"w3-display-bottommiddle w3-hide-small\" style=\"margin-bottom:16px\"></span>\n" +
                "<div class=\"w3-center w3-display-container\" style=\"background-color:#1abc9c;color:white; max-width:600px; max-height:250px; position: absolute; text-align: center; margin:auto; top: 0; right: 0;bottom: 0;left: 0;\">\n" +
                "<span class=\"w3-display-left w3-hide-small\" style=\"left:-30px\"></span>\n" +
                "<span class=\"w3-display-right w3-hide-small\" style=\"right:-30px\"></span>\n" +
                "    <h2>Votre grille a été bien sauvegardée</h2>\n" +
                "</div>\n" +
                "</div></body>");}

    }



    @RequestMapping(value = "/CUN/Evaluation//ActivitesPedagogiques/{enseignant}", method = RequestMethod.GET)

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
        EvaluationService.setNbrPointsObservationGrille(grille);

        Set<Variable> liste = grille.getVariable();
        liste.add(variable);
        grille.setVariable(liste);
        EvaluationService.updateGrille(grille);


        return ("GrilleActivitesPedagogiques");}

    catch (JsonParseException e){  return  ("<body style=\"background-color:#696969\"><div class=\"w3-dark-grey w3-padding-48 w3-display-container\" style=\"background-color:##696969\">\n" +
            "<span class=\"w3-display-topmiddle w3-hide-small\" style=\"margin-top:16px\"></span>\n" +
            "<span class=\"w3-display-bottommiddle w3-hide-small\" style=\"margin-bottom:16px\"></span>\n" +
            "<div class=\"w3-center w3-display-container\" style=\"background-color:#1abc9c;color:white; max-width:600px; max-height:250px; position: absolute; text-align: center; margin:auto; top: 0; right: 0;bottom: 0;left: 0;\">\n" +
            "<span class=\"w3-display-left w3-hide-small\" style=\"left:-30px\"></span>\n" +
            "<span class=\"w3-display-right w3-hide-small\" style=\"right:-30px\"></span>\n" +
            "    <h2>Votre grille a été bien sauvegardée</h2>\n" +
            "</div>\n" +
            "</div></body>");}

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
        EvaluationService.setNbrPointsObservationGrille(grille);

        Set<Variable> liste = grille.getVariable();
        liste.add(variable);
        grille.setVariable(liste);
        EvaluationService.updateGrille(grille);


        return ("GrilleProductionScientifique");}

    catch (JsonParseException e){  return  ("<body style=\"background-color:#696969\"><div class=\"w3-dark-grey w3-padding-48 w3-display-container\" style=\"background-color:##696969\">\n" +
            "<span class=\"w3-display-topmiddle w3-hide-small\" style=\"margin-top:16px\"></span>\n" +
            "<span class=\"w3-display-bottommiddle w3-hide-small\" style=\"margin-bottom:16px\"></span>\n" +
            "<div class=\"w3-center w3-display-container\" style=\"background-color:#1abc9c;color:white; max-width:600px; max-height:250px; position: absolute; text-align: center; margin:auto; top: 0; right: 0;bottom: 0;left: 0;\">\n" +
            "<span class=\"w3-display-left w3-hide-small\" style=\"left:-30px\"></span>\n" +
            "<span class=\"w3-display-right w3-hide-small\" style=\"right:-30px\"></span>\n" +
            "    <h2>Votre grille a été bien sauvegardée</h2>\n" +
            "</div>\n" +
            "</div></body>");}

    }

    @RequestMapping(value = "/CUN/TableauBord", method = RequestMethod.GET)
    public String ShowTableauBord(ModelMap model )
    {
        int liste[] = new int[7];
        List<Enseignant> ens = new ArrayList<Enseignant>();
        int i = 0;
        int nb_ens = 0;
        int nb_evaluation = 0;
        int nb_attente = 0;
        //Nombre de postulants par section
        for (i = 0; i < 7; i++) {
            ens = EnseignantService.getEnseignantBySection(i);
            if (ens == null) {
                liste[i] = 0;
            } else {
                liste[i] = ens.size();
            }
        }
        model.addAttribute("liste", liste);

        //Nombre de postulants
        List<Enseignant> ens1 = EnseignantService.getListEnseignant();
        nb_ens = ens1.size();
        model.addAttribute("nb_ens", nb_ens);

        int nb_acceptees= EvaluationService.getEnsAcceptes("Candidature acceptee",0).size()+EvaluationService.getEnsAcceptes("Candidature acceptee",1).size()
                +EvaluationService.getEnsAcceptes("Candidature acceptee",2).size()+
                EvaluationService.getEnsAcceptes("Candidature acceptee",3).size()+
                EvaluationService.getEnsAcceptes("Candidature acceptee",4).size()+
                EvaluationService.getEnsAcceptes("Candidature acceptee",5).size()+
                EvaluationService.getEnsAcceptes("Candidature acceptee",6).size();
         int nb_rejet= EvaluationService.getEnsAcceptes("Candidature rejetee", 0).size()+
                 EvaluationService.getEnsAcceptes("Candidature rejetee", 1).size()+
                 EvaluationService.getEnsAcceptes("Candidature rejetee", 2).size()+
                 EvaluationService.getEnsAcceptes("Candidature rejetee", 3).size()+
                 EvaluationService.getEnsAcceptes("Candidature rejetee", 4).size()+
                 EvaluationService.getEnsAcceptes("Candidature rejetee", 5).size()+
                 EvaluationService.getEnsAcceptes("Candidature rejetee", 6).size();

        model.addAttribute("nb_acceptees", nb_acceptees);
        model.addAttribute("nb_rejet", nb_rejet);
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
        EvaluationService.setNbrPointsObservationGrille(grille);

        Set<Variable> liste = grille.getVariable();
        liste.add(variable);
        grille.setVariable(liste);
        EvaluationService.updateGrille(grille);


        return ("GrilleResponsabilitesAdministratives");}

    catch (JsonParseException e){ return  ("<body style=\"background-color:#696969\"><div class=\"w3-dark-grey w3-padding-48 w3-display-container\" style=\"background-color:##696969\">\n" +
            "<span class=\"w3-display-topmiddle w3-hide-small\" style=\"margin-top:16px\"></span>\n" +
            "<span class=\"w3-display-bottommiddle w3-hide-small\" style=\"margin-bottom:16px\"></span>\n" +
            "<div class=\"w3-center w3-display-container\" style=\"background-color:#1abc9c;color:white; max-width:600px; max-height:250px; position: absolute; text-align: center; margin:auto; top: 0; right: 0;bottom: 0;left: 0;\">\n" +
            "<span class=\"w3-display-left w3-hide-small\" style=\"left:-30px\"></span>\n" +
            "<span class=\"w3-display-right w3-hide-small\" style=\"right:-30px\"></span>\n" +
            "    <h2>Votre grille a été bien sauvegardée</h2>\n" +
            "</div>\n" +
            "</div></body>");}

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

    //--------Afficher le profil d'un enseignant
    @RequestMapping(value = "/CUN/Profile/{ensId}", method = RequestMethod.GET)
    public String showProfile(@PathVariable("ensId") int ensId, ModelMap model) {
        Enseignant enseign = EnseignantService.getEnseignantById(ensId);
        Dossier d = EnseignantService.getEnsDossier(ensId);
        model.addAttribute("EtatD",d.getEtat());
        System.out.println(d.getEtat());
        model.addAttribute("enseign", enseign);
        return "ProfilCUN";
    }


    @RequestMapping(value = "/CUN/dossierADM/{enseignant}", method = RequestMethod.GET)

    public String ShowDossierCandidat2(@PathVariable("enseignant") int enseignant, ModelMap model) throws IOException {

        Enseignant ens = EnseignantService.getEnseignantById(enseignant);
        String role = UserService.getUserRole();
        System.out.println(role);
        model.addAttribute("idEns", ens.getId());
        model.addAttribute("role", role);

        String downloadFolder = context.getRealPath("/resources/files/Administratifs/");
        String downloadFolder1 = context.getRealPath("/resources/files/Pédagogiques/");
        File folder = new File(downloadFolder + ens.getId() + "/");
        File folder1 = new File(downloadFolder1 + ens.getId() + "/");
        System.out.println(folder);
        File[] fList = folder.listFiles();
        File[] fList1 = folder1.listFiles();
        List<String> names = new ArrayList();
        List<String> names1 = new ArrayList();
        if (fList!=null) {
            for (File file : fList) {
                if (file.isFile()) {
                    System.out.println(file.getName());
                    names.add(file.getName());


                } else {
                    System.out.println("Folder : " + file.getName());
                }
            }
            model.addAttribute("fichiers", names);
        }

        if (fList1!=null){

            for (File file1 : fList1) {
                if (file1.isFile()) {
                    System.out.println(file1.getName());
                    names1.add(file1.getName());


                } else {
                    System.out.println("Folder : " + file1.getName());
                }
            }
            model.addAttribute("fichiers1", names1);
        }



        return ("ADM_Dossier_Candidat");
    }

    @RequestMapping(value = "/CUN/dossierPED/{enseignant}", method = RequestMethod.GET)

    public String ShowDossierCandidatPed(@PathVariable("enseignant") int enseignant, ModelMap model) throws IOException {

        Enseignant ens = EnseignantService.getEnseignantById(enseignant);
        model.addAttribute("idEns", ens.getId());

        String downloadFolder = context.getRealPath("/resources/files/Administratifs/");
        String downloadFolder1 = context.getRealPath("/resources/files/Pédagogiques/");
        File folder = new File(downloadFolder + ens.getId() + "/");
        File folder1 = new File(downloadFolder1 + ens.getId() + "/");
        System.out.println(folder);
        File[] fList = folder.listFiles();
        File[] fList1 = folder1.listFiles();
        List<String> names = new ArrayList();
        List<String> names1 = new ArrayList();

        if (fList!=null) {
            for (File file : fList) {
                if (file.isFile()) {
                    System.out.println(file.getName());
                    names.add(file.getName());


                } else {
                    System.out.println("Folder : " + file.getName());
                }
            }
            model.addAttribute("fichiers", names);
        }

        if (fList1!=null){

            for (File file1 : fList1) {
                if (file1.isFile()) {
                    System.out.println(file1.getName());
                    names1.add(file1.getName());


                } else {
                    System.out.println("Folder : " + file1.getName());
                }
            }
            model.addAttribute("fichiers1", names1);
        }



        return ("ADM_Dossier_Candidat_Ped");
    }


    //---------Afficher la fiche de candidature
    @RequestMapping(value = "/CUN/FicheCandidature/{ensId}", method = RequestMethod.GET)
    public String showFicheCandidature(@PathVariable("ensId") int ensId, ModelMap model) {
        Enseignant enseign = EnseignantService.getEnseignantById(ensId);
        model.addAttribute("enseign", enseign);
        return "FicheCandidature";
    }


    @RequestMapping(value = "/CUN/Ouvrages/{ensId}", method = RequestMethod.GET)
    public String showCvEns(ModelMap model, @PathVariable("ensId") int ensId) {

        List<Ouvrage> ouvrage = OuvrageService.getOuvragebyIdEns(ensId);
        model.addAttribute("ouvrage", ouvrage);

        return "AfficherOuvrage";

    }

    @RequestMapping(value = "/CUN/Publications/{ensId}", method = RequestMethod.GET)
    public String showPub(ModelMap model, @PathVariable("ensId") int ensId) {

        List<Publication> publication = PublicationService.getPublicationbyIdEns(ensId);

        model.addAttribute("publication", publication);

        return "AffichagePublications";

    }

    @RequestMapping(value = "/CUN/Animation/{ensId}", method = RequestMethod.GET)
    public String showAnim(ModelMap model, @PathVariable("ensId") int ensId) {

        List<Animation> animation = AnimationService.getAnimationbyIdEns(ensId);

        model.addAttribute("animation", animation);

        return "AffichageAnimations";

    }

    @RequestMapping(value = "/CUN/AP/{ensId}", method = RequestMethod.GET)
    public String showAP(ModelMap model, @PathVariable("ensId") int ensId) {

        List<Activité_Pédagogique> AP = ActivitePedService.getEnseignementbyIdEns(ensId);

        model.addAttribute("AP", AP);

        return "AffichageActivitésPed";

    }


    @RequestMapping(value = "/CUN/Projet/{ensId}", method = RequestMethod.GET)
    public String showProj(ModelMap model, @PathVariable("ensId") int ensId) {

        List<Projet> projet = ProjetService.getProjetbyIdEns(ensId);

        model.addAttribute("projet", projet);

        return "AffichageProjets";

    }

    @RequestMapping(value = "/CUN/Expertise/{ensId}", method = RequestMethod.GET)
    public String showExp(ModelMap model, @PathVariable("ensId") int ensId) {

        List<Expertise> expertise = ExpertiseService.getExpertisebyIdEns(ensId);

        model.addAttribute("expertise", expertise);

        return "AffichageExpertises";

    }

    @RequestMapping(value = "/CUN/Responsabilites/{ensId}", method = RequestMethod.GET)
    public String showResp(ModelMap model, @PathVariable("ensId") int ensId) {

        List<Responsabilité> responsabilite = ResponsabilitéService.getResponsabilitebyIdEns(ensId);

        model.addAttribute("responsabilite", responsabilite);

        return "AffichageResponsabilités";

    }


    @RequestMapping(value = "/CUN/Communications/{ensId}", method = RequestMethod.GET)
    public String showEnsCommunication(ModelMap model, @PathVariable("ensId") int ensId) {

        List<Communication> communication = CommunicationService.getCommunicationbyIdEns(ensId);
        model.addAttribute("communication", communication);

        return "AffichageCommunications";

    }


    @RequestMapping(value = "/CUN/Encadrements/{ensId}", method = RequestMethod.GET)
    public String showEnsEncadrements(ModelMap model, @PathVariable("ensId") int ensId) {

        List<Encadrement> encadrement = EncadrementService.getEncadrementbyIdEns(ensId);
        model.addAttribute("encadrement", encadrement);

        return "AffichageEncadrement";

    }

    @RequestMapping(value = "/CUN/AffObsCUN/{ensId}", method = RequestMethod.GET)
    public String ShowObsCUN(@PathVariable("ensId") int ensId,ModelMap model )
    {

        Observation obs = ObservationService.getObservationById(ensId);
        model.addAttribute("obs", obs);

        Enseignant enseign = EnseignantService.getEnseignantById(ensId);
        model.addAttribute("enseign", enseign);

        return ("Aff_Obs_CUN");
    }






}
