package com.evaluation.controllers;

import com.evaluation.models.*;
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
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.ServletContext;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;


@Controller
public class TutelleAdministrativeControlleur {


    @Autowired
    private EnseignantService EnseignantService;

    @Autowired

    private EtablissementServiceImpl EtablissementService;

    @Autowired
    private SectionServiceImpl SectionService;

    @Autowired
    private FichierServiceImpl FichierService;

    @Autowired
    private UserServiceImpl UserService;


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
    private ObservationServiceImpl ObservationService;


    @Autowired
    ServletContext context;

    /*@RequestMapping(value = "/Administration", method = RequestMethod.GET)
    public String AcceuilCun2(ModelMap model) {
        List<Section> sections = SectionService.getAllSection();
        model.addAttribute("section", sections);
        return ("Accueil_Adm");
    }*/

    @RequestMapping(value = "/Administration/Listecandidat/{section}", method = RequestMethod.GET)
    public String ShowList2(@PathVariable("section") int section, ModelMap model) {
        List<Enseignant> listes = EnseignantService.getEnseignantBySection(section);
        model.addAttribute("liste", listes);
        model.addAttribute("izri", section);
        return ("Liste_Candidats_Adm");

    }


    @RequestMapping(value = "/Administration/AccueilAdministration", method = RequestMethod.GET)
    public String showAcceuil() {
        return "AccueilAdministration";

    }//--------Afficher le profil d'un enseignant
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


    @RequestMapping(value = "/Administration/Ouvrages/{ensId}", method = RequestMethod.GET)
    public String showCvEns(ModelMap model, @PathVariable("ensId") int ensId) {

        List<Ouvrage> ouvrage = OuvrageService.getOuvragebyIdEns(ensId);
        model.addAttribute("ouvrage", ouvrage);

        return "AfficherOuvrage";

    }

    @RequestMapping(value = "/Administration/Publications/{ensId}", method = RequestMethod.GET)
    public String showPub(ModelMap model, @PathVariable("ensId") int ensId) {

        List<Publication> publication = PublicationService.getPublicationbyIdEns(ensId);

        model.addAttribute("publication", publication);

        return "AffichagePublications";

    }

    @RequestMapping(value = "/Administration/Animation/{ensId}", method = RequestMethod.GET)
    public String showAnim(ModelMap model, @PathVariable("ensId") int ensId) {

        List<Animation> animation = AnimationService.getAnimationbyIdEns(ensId);

        model.addAttribute("animation", animation);

        return "AffichageAnimations";

    }

    @RequestMapping(value = "/Administration/AP/{ensId}", method = RequestMethod.GET)
    public String showAP(ModelMap model, @PathVariable("ensId") int ensId) {

        List<Activité_Pédagogique> AP = ActivitePedService.getEnseignementbyIdEns(ensId);
        System.out.println(AP.get(0).getAnnee());
        System.out.println(AP.get(0).getModule());
        System.out.println(AP.get(0).getType_grad());
        System.out.println(AP.get(0).getCycle());
        model.addAttribute("AP", AP);

        return "AffichageActivitésPed";

    }


    @RequestMapping(value = "/Administration/Projet/{ensId}", method = RequestMethod.GET)
    public String showProj(ModelMap model, @PathVariable("ensId") int ensId) {

        List<Projet> projet = ProjetService.getProjetbyIdEns(ensId);

        model.addAttribute("projet", projet);

        return "AffichageProjets";

    }

    @RequestMapping(value = "/Administration/Expertise/{ensId}", method = RequestMethod.GET)
    public String showExp(ModelMap model, @PathVariable("ensId") int ensId) {

        List<Expertise> expertise = ExpertiseService.getExpertisebyIdEns(ensId);

        model.addAttribute("expertise", expertise);

        return "AffichageExpertises";

    }

    @RequestMapping(value = "/Administration/Responsabilites/{ensId}", method = RequestMethod.GET)
    public String showResp(ModelMap model, @PathVariable("ensId") int ensId) {

        List<Responsabilité> responsabilite = ResponsabilitéService.getResponsabilitebyIdEns(ensId);

        model.addAttribute("responsabilite", responsabilite);

        return "AffichageResponsabilités";

    }


    @RequestMapping(value = "/Administration/Communications/{ensId}", method = RequestMethod.GET)
    public String showEnsCommunication(ModelMap model, @PathVariable("ensId") int ensId) {

        List<Communication> communication = CommunicationService.getCommunicationbyIdEns(ensId);
        model.addAttribute("communication", communication);

        return "AffichageCommunications";

    }


    @RequestMapping(value = "/Administration/Encadrements/{ensId}", method = RequestMethod.GET)
    public String showEnsEncadrements(ModelMap model, @PathVariable("ensId") int ensId) {

        List<Encadrement> encadrement = EncadrementService.getEncadrementbyIdEns(ensId);
        model.addAttribute("encadrement", encadrement);

        return "AffichageEncadrement";

    }


    @RequestMapping(value = "/Administration/dossierADM/{enseignant}", method = RequestMethod.GET)

    public String ShowDossierCandidat2(@PathVariable("enseignant") int enseignant, ModelMap model) throws IOException {

        Enseignant ens = EnseignantService.getEnseignantById(enseignant);
        model.addAttribute("idEns", ens.getId());
        String role = UserService.getUserRole();
        System.out.println(role);

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

    @RequestMapping(value = "/Administration/dossierPED/{enseignant}", method = RequestMethod.GET)

    public String ShowDossierCandidatPed(@PathVariable("enseignant") int enseignant, ModelMap model) throws IOException {

        Enseignant ens = EnseignantService.getEnseignantById(enseignant);
        model.addAttribute("idEns", ens.getId());
        String role = UserService.getUserRole();
        System.out.println(role);

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



        return ("ADM_Dossier_Candidat_Ped");
    }


    //-------------- Save observation
    @RequestMapping(value = "/Administration/ValidationVDA/{ensId}", method = RequestMethod.POST)
    public String saveOBS(Locale locale, ModelMap model, @RequestParam(value = "obs_Fiche_cand") String observationF, @RequestParam(value = "obs_Dossier_adm") String observationADM, @RequestParam(value = "obs_Dossier_ped") String observationPED, @RequestParam(value = "val_Fiche_cand") String validiteF, @RequestParam(value = "val_Dossier_adm") String validiteADM, @RequestParam(value = "val_Dossier_ped") String validitePED, @PathVariable("ensId") int ensId) {
        Observation o = new Observation(ensId, observationF, observationADM, observationPED, validiteF, validiteADM, validitePED);
        ObservationService.saveObservation(o);
        return "DossierEns";
    }


    @RequestMapping(value = "/Administration/TableauBord", method = RequestMethod.GET)
    public String ShowTableauBord(ModelMap model) {

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

        //Nombre de dossiers évalués
        List<Observation> obs = ObservationService.getListObservation();
        nb_evaluation = obs.size();
        model.addAttribute("nb_evaluation", nb_evaluation);

        //Nombre de dossiers en attente d'évaluation
        nb_attente = nb_ens - nb_evaluation;
        model.addAttribute("nb_attente", nb_attente);

        return ("TB_Adm");
    }


    @RequestMapping(value = "/Administration", method = RequestMethod.GET)
    public String AcceuilCun2(ModelMap model) {
        List<Section> sections = SectionService.getAllSection();
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (!(authentication instanceof AnonymousAuthenticationToken)) {

            System.out.println(UserService.getEtablissementUser());
            String etablissement = UserService.getEtablissementUser();

            model.addAttribute("etablissement", etablissement);
        }
        model.addAttribute("section", sections);

        return ("Accueil_CUN2");
    }

    @RequestMapping(value = "/Administration/Listecandidat/", method = RequestMethod.GET)
    public String ShowList2(ModelMap model) {

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (!(authentication instanceof AnonymousAuthenticationToken)) {

            String etablissement = UserService.getEtablissementUser();
            List<Enseignant> listes = EnseignantService.getAllEnsEtablissement(etablissement);
            model.addAttribute("etablissement", etablissement);
            model.addAttribute("liste", listes);
        }


        return ("Liste_Candidats2");

    }

    @RequestMapping(value = "/Administration/AffObsCUN/{ensId}", method = RequestMethod.GET)
    public String ShowObsCUN(@PathVariable("ensId") int ensId,ModelMap model )
    {

        Observation obs = ObservationService.getObservationById(ensId);
        model.addAttribute("obs", obs);

        Enseignant enseign = EnseignantService.getEnseignantById(ensId);
        model.addAttribute("enseign", enseign);

        return ("Aff_Obs_CUN");
    }


}

