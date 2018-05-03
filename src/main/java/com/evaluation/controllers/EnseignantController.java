package com.evaluation.controllers;

import java.io.File;
import java.io.IOException;

import java.util.*;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import com.evaluation.loginValidator.EnsValidation;
import com.evaluation.models.*;
import com.evaluation.services.*;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.collections4.TransformerUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;

import org.springframework.util.FileCopyUtils;

import org.springframework.validation.BindingResult;

import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;


@Controller
//@RequestMapping(value="/ens")
public class EnseignantController {


       @Autowired
       private EnseignantService EnseignantService;

       @Autowired

       private EtablissementServiceImpl EtablissementService;

       @Autowired
       private SectionServiceImpl SectionService;

       @Autowired
       private FichierServiceImpl FichierService;


        @Autowired
        private ActivitePedServiceImpl ActivitePedService;

        @Autowired
        private DemandeServiceImpl DemandeService;

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
        private ResponsabilitéServiceImpl ResponsabilitéService;

        @Autowired
        private EvaluationServiceImpl EvaluationService;

        @Autowired
        private ObservationServiceImpl  ObservationService;



        @Autowired
        ServletContext context;


        private Enseignant ens;




        @RequestMapping(value = "/register", method = RequestMethod.GET)
        public String showForm( ModelMap model) {
            List<Etablissement> etablissements = EtablissementService.getAllEtablissements();
            List<Section> liste = SectionService.getAllSection();
            List <Number> sections = new ArrayList();
            Iterator<Section> iter = liste.iterator();
            while (iter.hasNext()){
                sections.add(iter.next().getId_section());
            }

            model.addAttribute("etablissements", etablissements);
            model.addAttribute("sections", sections);
            model.addAttribute("enssData", new Enseignant());
            return "register";
        }

        @RequestMapping(value = "/register", method = RequestMethod.POST)
        public String saveForm(Locale locale, ModelMap model, @ModelAttribute("enssData") @Valid Enseignant ens, BindingResult br, HttpSession session) {
            EnsValidation ensValidation = new EnsValidation();
            ensValidation.validate(ensValidation, br);
            if (br.hasErrors()) {

                br.getAllErrors();
                System.out.println(br.getAllErrors());
                return "register";
            } else {
                EnseignantService.saveEnseignant(ens);
                Grille grille = new Grille(ens);
                EvaluationService.saveGrille(grille);
                session.setAttribute("customer", ens);
                return "index";
            }

        }

        @RequestMapping(value = "/login", method = RequestMethod.GET)
        public String showFormLogin( ModelMap model, HttpSession session) {

            if (session.getAttribute("customer")==null){
                model.addAttribute("ensData", new Enseignant());
                return "login";
            }
            else{
                return "home";
            }

        }

        @RequestMapping(value = "/login", method = RequestMethod.POST)
        public String doLogin(Locale locale, ModelMap model, @ModelAttribute("ensData") Enseignant ens,  HttpSession session) {
            if (ens.getEmail() != null && ens.getPassword() != null && session.getAttribute("customer") == null) {

                ens = EnseignantService.loginEnseignant(ens);
                if (ens != null) {
                    session.setAttribute("customer", ens);
                    return "home";
                }

                else{

                    return "login";

                }
            }
            else{

                return  "home";


            }
        }



        @RequestMapping(value = "/Enseignant", method = RequestMethod.GET)
        public String showAccueil() {


            return "Accueil";

        }

        @RequestMapping(value = "/Enseignant/dossiers", method = RequestMethod.GET)
        public String showDossiers() {


            return "dossiers";

        }


        @RequestMapping(value = "/Enseignant/Dossier_pédagogique", method = RequestMethod.GET)
        public String showDossierPedagogique(ModelMap model) {


            FileBucket fileModel = new FileBucket();
            MultiFileBucket filesModel = new MultiFileBucket();
            model.addAttribute("multiFileBucket", filesModel);
            model.addAttribute("fileBucket", fileModel);
            int idEns= EnseignantService.getSessionId();
            return "Dossier_pédagogique";

        }



        //-------------- Afficher Dossier administratif
        @RequestMapping(value = "/Enseignant/Dossier_administratif", method = RequestMethod.GET)
        public String showdossAdmin(ModelMap model) {


            FileBucket fileModel = new FileBucket();
            MultiFileBucket filesModel = new MultiFileBucket();
            model.addAttribute("multiFileBucket", filesModel);
            model.addAttribute("fileBucket", fileModel);
            int idEns= EnseignantService.getSessionId();
            model.addAttribute("idEns", idEns);
            return "dossierAdministratif";
        }




        //-------------- Afficher CV
        @RequestMapping(value = "/Enseignant/CV", method = RequestMethod.GET)
        public String showCV(ModelMap model1, ModelMap model2,HttpSession session) {
            model1.addAttribute("infoAP", new Activité_Pédagogique());
            return "CV";
        }

    //-------------- Afficher demande
    @RequestMapping(value = "/Enseignant/Demande", method = RequestMethod.GET)
    public String showDemande(ModelMap model, HttpSession session) {
        model.addAttribute("infoDem", new Demande());
        return "Demande";
    }

    //-------------- Save activité pédagogique
    @RequestMapping(value = "/Enseignant/CV/AP", method = RequestMethod.POST)
    public String saveCV(Locale locale, ModelMap model, @ModelAttribute("infoAP") Activité_Pédagogique ap,BindingResult br, HttpSession session) {
        ens= (Enseignant) session.getAttribute("customer");
        ActivitePedService.saveActivitePed(ap);
        return "CV";
    }

    //-------------- Save Ouvrage
    @RequestMapping(value = "/Enseignant/CV/OP", method = RequestMethod.POST)
    public String saveOP(Locale locale, ModelMap model,@RequestParam(value="titre") String titre,@RequestParam(value="type") String type,@RequestParam(value="auteurs") String auteurs,@RequestParam(value="anneeE") int anneeE,@RequestParam(value="nb_pages") int nb_pages,@RequestParam(value="maison") String maison, HttpSession session) {
        Ouvrage o=new Ouvrage(EnseignantService.getSessionId(),type,titre,auteurs,maison,anneeE,nb_pages);
        OuvrageService.saveOuvrage(o);
        return "CV";
    }

    //-------------- Save Encadrement
    @RequestMapping(value = "/Enseignant/CV/EP", method = RequestMethod.POST)
    public String saveEP(Locale locale, ModelMap model,@RequestParam(value="type") String type,@RequestParam(value="candidat") String candidat,@RequestParam(value="titre") String titre,@RequestParam(value="date_soutenance") String date_soutenance, HttpSession session) {
        Encadrement e=new Encadrement(EnseignantService.getSessionId(),type,candidat,titre,date_soutenance);
        EncadrementService.saveEncadrement(e);
        return "CV";
    }

    //-------------- Save publication
    @RequestMapping(value = "/Enseignant/CV/PS", method = RequestMethod.POST)
    public String savePS(Locale locale, ModelMap model,@RequestParam(value="type") String type,@RequestParam(value="titre_article") String titre_article,@RequestParam(value="position_auteur") String position_auteur,@RequestParam(value="titre_revue") String titre_revue,@RequestParam(value="annee") int annee,@RequestParam(value="url") String url,HttpSession session) {
        Publication p=new Publication(EnseignantService.getSessionId(),type,titre_article,position_auteur,titre_revue,annee,url);
        PublicationService.savePublication(p);
        return "CV";
    }

    //-------------- Save communication
    @RequestMapping(value = "/Enseignant/CV/CS", method = RequestMethod.POST)
    public String saveCS(Locale locale, ModelMap model,@RequestParam(value="type") String type,@RequestParam(value="titre_com") String titre_com,@RequestParam(value="position_auteur") String position_auteur,@RequestParam(value="titre_manif") String titre_manif,@RequestParam(value="annee") int annee,@RequestParam(value="url") String url,HttpSession session) {
        Communication c=new Communication(EnseignantService.getSessionId(),type,titre_com,position_auteur,titre_manif,annee,url);
        CommunicationService.saveCommunication(c);
        return "CV";
    }

    //-------------- Save projet
    @RequestMapping(value = "/Enseignant/CV/PR", method = RequestMethod.POST)
    public String savePR(Locale locale, ModelMap model,@RequestParam(value="type") String type,@RequestParam(value="qualite") String qualite,@RequestParam(value="titre") String titre,@RequestParam(value="annee") int annee,HttpSession session) {
        Projet p=new Projet(EnseignantService.getSessionId(),type,qualite,titre,annee);
        ProjetService.saveProjet(p);
        return "CV";
    }

    //-------------- Save Animation
    @RequestMapping(value = "/Enseignant/CV/AS", method = RequestMethod.POST)
    public String saveAS(Locale locale, ModelMap model,@RequestParam(value="type") String type,@RequestParam(value="lieu") String lieu,@RequestParam(value="date") String date,@RequestParam(value="qualite") String qualite,HttpSession session) {
        Animation a=new Animation(EnseignantService.getSessionId(),type,lieu,date,qualite);
        AnimationService.saveAnimation(a);
        return "CV";
    }

    //-------------- Save expertise
    @RequestMapping(value = "/Enseignant/CV/EXP", method = RequestMethod.POST)
    public String saveAS(Locale locale, ModelMap model,@RequestParam(value="contexte") String contexte,@RequestParam(value="organisme") String organisme,@RequestParam(value="annee") int annee,HttpSession session) {
        Expertise e=new Expertise(EnseignantService.getSessionId(),contexte,organisme,annee);
        ExpertiseService.saveExpertise(e);
        return "CV";
    }

    //-------------- Save reponsabilité
    @RequestMapping(value = "/Enseignant/CV/RAS", method = RequestMethod.POST)
    public String saveRAS(Locale locale, ModelMap model,@RequestParam(value="type") String type,@RequestParam(value="annee_deb") int annee_deb,@RequestParam(value="annee_fin") int annee_fin,@RequestParam(value="structure") String structure,HttpSession session) {
        Responsabilité r=new Responsabilité(EnseignantService.getSessionId(),type,annee_deb,annee_fin,structure);
        ResponsabilitéService.saveResponsabilité(r);
        return "CV";
    }


    //-------------- Save Demande
    @RequestMapping(value = "/Enseignant/Demande", method = RequestMethod.POST)
    public String saveDemande(Locale locale, ModelMap model, @ModelAttribute("infoDem") Demande d, BindingResult br,HttpSession session) {
        ens= (Enseignant) session.getAttribute("customer");
        d.setCode_ens(EnseignantService.getSessionId());
        DemandeService.saveDemande(d);
        return "Demande";
    }




    @RequestMapping(value="/Enseignant/Dossier_administratif/Depot", method = RequestMethod.POST)
    public String singleFileUpload(@Valid FileBucket fileBucket, BindingResult result, ModelMap model, HttpServletRequest request) throws IOException {
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
                if (!(authentication instanceof AnonymousAuthenticationToken)) {
                    String currentUserName = authentication.getName();
                    Fichier fich= new Fichier();
                    fich.setUsername(currentUserName);
                    FichierService.addFichier(fich);
                    model.addAttribute("username", currentUserName );

                }

                if (result.hasErrors()) {
                    System.out.println("validation errors");
                    return "dossierAdministratif";
                } else {
                    System.out.println("Fetching file");
                    MultipartFile multipartFile = fileBucket.getFile();
                    String downloadFolder = context.getRealPath("/resources/files/Administratifs/");
                    File folder=new File(downloadFolder+EnseignantService.getSessionId()+"/");
                    System.out.println(folder);
                    folder.mkdirs();
                    FileCopyUtils.copy(fileBucket.getFile().getBytes(), new File(downloadFolder+EnseignantService.getSessionId()+"/" + fileBucket.getFile().getOriginalFilename()));
                    String fileName = multipartFile.getOriginalFilename();
                    model.addAttribute("fileName", fileName);
                    int idEns= EnseignantService.getSessionId();
                    model.addAttribute("idEns", idEns);
                    return "dossierAdministratif";
                }
        }

    @RequestMapping(value="/Enseignant/Dossier_pedegogique/Depot", method = RequestMethod.POST)
    public String singleFileUploadPedagogique(@Valid FileBucket fileBucket, BindingResult result, ModelMap model) throws IOException {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (!(authentication instanceof AnonymousAuthenticationToken)) {
            String currentUserName = authentication.getName();
            Fichier fich= new Fichier();
            fich.setUsername(currentUserName);
            FichierService.addFichier(fich);
            model.addAttribute("username", currentUserName );

        }

        if (result.hasErrors()) {
            System.out.println("validation errors");
            return "Dossier_pédagigique";
        } else {
            System.out.println("Fetching file");
            MultipartFile multipartFile = fileBucket.getFile();
            String downloadFolder = context.getRealPath("/resources/files/Pédagogiques/");
            File folder=new File(downloadFolder+EnseignantService.getSessionId()+"/");
            System.out.println(folder);
            folder.mkdirs();
            FileCopyUtils.copy(fileBucket.getFile().getBytes(), new File(downloadFolder+EnseignantService.getSessionId()+"/" + fileBucket.getFile().getOriginalFilename()));
            String fileName = multipartFile.getOriginalFilename();
            model.addAttribute("fileName", fileName);
            int idEns= EnseignantService.getSessionId();
            model.addAttribute("idEns", idEns);

        }
        return "Dossier_pédagogique";
    }

    //-------------- Afficher fichiers administratifs
    @RequestMapping(value = "/Enseignant/dossier/{idEns}", method = RequestMethod.GET)
    public String ShowFichiersAdmin(@PathVariable("idEns") int idEns, ModelMap model,  HttpServletRequest request, HttpServletResponse response){

        String downloadFolder = context.getRealPath("/resources/files/Administratifs/");
        String downloadFolder1 = context.getRealPath("/resources/files/Pédagogiques/");
        File folder=new File(downloadFolder+EnseignantService.getSessionId()+"/");
        File folder1=new File(downloadFolder1+EnseignantService.getSessionId()+"/");
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
        model.addAttribute("idEns", idEns);
        return ("Fichiers_Administratifs");

    }





    //*****************ADMINISTRATION******************//
    @RequestMapping(value = "/Administration/AccueilAdministration", method = RequestMethod.GET)
    public String showAcceuil() {
        return "AccueilAdministration";

    }

    //---------Afficher la liste des enseignants
    @RequestMapping(value = "/Administration/Liste", method = RequestMethod.GET)
    public String showListe(ModelMap model) {
     // List<Enseignant> enseignants = EnseignantService.getListEns();
      //model.addAttribute("enseignants", enseignants);
        return "Liste";
    }


    //--------Afficher le profil d'un enseignant
    @RequestMapping(value = "/Administration/Profile/{ensId}", method = RequestMethod.GET)
    public String showProfile(@PathVariable("ensId") int ensId, ModelMap model) {
        Enseignant enseign = EnseignantService.getEnseignantById(ensId);
        model.addAttribute("enseign", enseign);
        return "Profile";
    }

    //--------Afficher le dossier d'un enseignant
    @RequestMapping(value = "/Administration/DossierEns/{ensId}", method = RequestMethod.GET)
    public String showDossierEns(@PathVariable("ensId") int ensId, ModelMap model) {
        Enseignant enseign = EnseignantService.getEnseignantById(ensId);
        model.addAttribute("enseign", enseign);
        return "DossierEns";
    }

    //---------Afficher la fiche de candidature
    @RequestMapping(value = "/Administration/FicheCandidature/{ensId}", method = RequestMethod.GET)
    public String showFicheCandidature(@PathVariable("ensId") int ensId, ModelMap model) {
        Enseignant enseign = EnseignantService.getEnseignantById(ensId);
        model.addAttribute("enseign", enseign);
        return "FicheCandidature";
    }

    //--------Afficher le dossier administratif d'un enseignant
    @RequestMapping(value = "/Administration/DossierAdministratif/{ensId}", method = RequestMethod.GET)
    public String showDossierAdministratif(@PathVariable("ensId") int ensId, ModelMap model) {
        Enseignant enseign = EnseignantService.getEnseignantById(ensId);
        model.addAttribute("enseign", enseign);
        return "DossierAdministratif";
    }

    @RequestMapping(value = "/Administration/DossierPedagogique/{ensId}", method = RequestMethod.GET)
    public String showDossierPedagogique() {
        return "DossierPedagogique";

    }

    //--------Afficher le CV d'un enseignant
    /*@RequestMapping(value = "/Administration/CvEns", method = RequestMethod.GET)
    public String showCvEns(ModelMap model) {
          List<Publication> publication = PublicationService.getPublicationbyIdEns(9);
          model.addAttribute("publication",  publication);
        //List<Ouvrage> ouvrage = OuvrageService.getOuvragebyIdEns(ensId);
       //model.addAttribute("ouvrage", ouvrage);

        System.out.println("l'url est");
        System.out.println(publication.get(0).getId_pub());
        System.out.println(publication.get(0).getUrl());
        return "CvEns";

    }*/

    @RequestMapping(value = "/Administration/Ouvrages/{ensId}", method = RequestMethod.GET)
    public String showCvEns(ModelMap model, @PathVariable("ensId") int ensId) {

        List<Publication> publication = PublicationService.getPublicationbyIdEns(ensId);
        int merde = publication.get(0).getId_pub();
        model.addAttribute("publication",  merde);

        model.addAttribute("idEns",  102);
        List<Ouvrage> ouvrage = OuvrageService.getOuvragebyIdEns(ensId);
        model.addAttribute("ouvrage", ouvrage);


        System.out.println("l'url est");
        System.out.println(publication.get(0).getId_pub());
        System.out.println(publication.get(0).getUrl());
        return "CvEns";

    }

    @RequestMapping(value = "/Administration/Publications/{ensId}", method = RequestMethod.GET)
    public String showEns(ModelMap model, @PathVariable("ensId") int ensId) {

        List<Publication> publication = PublicationService.getPublicationbyIdEns(ensId);

        model.addAttribute("publication",  publication);

        return "AffichagePublications";

    }

    @RequestMapping(value = "/Administration/Communications/{ensId}", method = RequestMethod.GET)
    public String showEnsCommunication(ModelMap model, @PathVariable("ensId") int ensId) {

        List<Communication> communication = CommunicationService.getCommunicationbyIdEns(ensId);
        model.addAttribute("communication", communication);

        return "AffichageCommunications";

    }

   /** @RequestMapping(value = "/Administration/Projets/{ensId}", method = RequestMethod.GET)
    public String showEnsProjets(ModelMap model, @PathVariable("ensId") int ensId) {

        List<Projet> projet = ProjetService.getProjetbyIdEns(ensId);
        model.addAttribute("projet", projet);

        return "AffichageProjets";

    }**/

    @RequestMapping(value = "/Administration/Encadrements/{ensId}", method = RequestMethod.GET)
    public String showEnsEncadrements(ModelMap model, @PathVariable("ensId") int ensId) {

        List<Encadrement> encadrement = EncadrementService.getEncadrementbyIdEns(ensId);
        model.addAttribute("encadrement", encadrement);

        return "AffichageEncadrement";

    }

    @RequestMapping(value = "/Administration/Responsabilites/{ensId}", method = RequestMethod.GET)
    public String showEnsResponsabilites(ModelMap model, @PathVariable("ensId") int ensId) {

        List<Responsabilité> responsabilite = ResponsabilitéService.getResponsabilitebyIdEns(ensId);
        model.addAttribute("responsabilite", responsabilite);

        return "AffichageResponsabilites";

    }

  /**  @RequestMapping(value = "/Administration/AP/{ensId}", method = RequestMethod.GET)
    public String showEnsAP(ModelMap model, @PathVariable("ensId") int ensId) {

        List<Activité_Pédagogique> AP =ActivitePedService.getAPbyIdEns(ensId);
        model.addAttribute("AP", AP);

        return "AffichageAP";

    }**/







    //-------------- Save observation
    @RequestMapping(value = "/Administration/ValidationVDA", method = RequestMethod.POST)
    public String saveOBS(Locale locale, ModelMap model,@RequestParam(value="obs_Fiche_cand")String observationF,@RequestParam(value="obs_Dossier_adm") String observationADM, @RequestParam(value="obs_Dossier_ped") String observationPED,@RequestParam(value="val_Fiche_cand") String validiteF, @RequestParam(value="val_Dossier_adm")String validiteADM,@RequestParam(value="val_Dossier_ped") String validitePED, HttpSession session) {
        Observation o=new Observation(9,observationF,observationADM, observationPED,validiteF,validiteADM, validitePED );
        ObservationService.saveObservation(o);
        return "DossierEns";
    }





}


