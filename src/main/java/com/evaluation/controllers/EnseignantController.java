package com.evaluation.controllers;

import com.evaluation.loginValidator.EnsValidation;
import com.evaluation.models.*;
import com.evaluation.services.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;


@Controller
//@RequestMapping(value="/ens")
public class EnseignantController {


       @Autowired
       private com.evaluation.services.EnseignantService EnseignantService;

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
        private ObservationServiceImpl ObservationService;



        @Autowired
        ServletContext context;


        private Enseignant ens;




    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String showForm( ModelMap model) {
        List<Etablissement> etablissements = EtablissementService.getAllEtablissements();
        List<Section> liste = SectionService.getAllSection();
        List <String> sections = new ArrayList();
        List <Number> sections2 = new ArrayList();
        for (int i = 0; i < liste.size(); i++) {
            String sec = liste.get(i).getCode_section();
            int sec2 = liste.get(i).getId_section();


            sections.add(sec);
            sections2.add(sec2);
            System.out.println(sections.get(i));}



        model.addAttribute("etablissements", etablissements);
        //  model.addAttribute("sections", sections);
        model.addAttribute("sections", liste);
        model.addAttribute("sections2", sections2);
        model.addAttribute("enssData", new Enseignant());
        return "register";
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String saveForm(Locale locale, ModelMap model, @ModelAttribute("enssData") @Valid Enseignant ens,  BindingResult br, HttpSession session) {
        EnsValidation ensValidation = new EnsValidation();
        ensValidation.validate(ensValidation, br);
        if (br.hasErrors()) {

            br.getAllErrors();
            System.out.println(br.getAllErrors());
            return "register";
        } else {

            EnseignantService.saveEnseignant(ens);
            Grille grille = new Grille(ens);
            Dossier d = new Dossier(ens);
            EvaluationService.saveGrille(grille);
            EnseignantService.saveDossier(d);
            session.setAttribute("customer", ens);
            return "Accueil_General";
        }

    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String showFormLogin( ModelMap model, HttpSession session) {

        if (session.getAttribute("customer")==null){
            model.addAttribute("ensData", new Enseignant());
            return "login3";
        }
        else{
            return "login3";
        }

    }


    @RequestMapping(value="/logout", method = RequestMethod.GET)
    public String logoutPage (HttpServletRequest request, HttpServletResponse response) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null){
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }
        return "redirect:/login";
    }



    @RequestMapping(value = "/Enseignant/Accueil", method = RequestMethod.GET)
    public String showAccueil(ModelMap model) {
        int ensId= EnseignantService.getSessionId();
        model.addAttribute("ensId",ensId);
        String nomEns= EnseignantService.getENSName();
        String prenomEns= EnseignantService.getENSPrenom();
        model.addAttribute("nomEns", nomEns);
        model.addAttribute("prenomEns", prenomEns);
        return "Accueil2";

    }

    @RequestMapping(value = "/Enseignant/dossiers2", method = RequestMethod.GET)
    public String showDossiers(ModelMap model) {

        String nomEns= EnseignantService.getENSName();
        String prenomEns= EnseignantService.getENSPrenom();

        int ensId= EnseignantService.getSessionId();
        Dossier d = EnseignantService.getEnsDossier(ensId);
        model.addAttribute("EtatD",d.getEtat());
        model.addAttribute("ensId",ensId);
        model.addAttribute("nomEns", nomEns);
        model.addAttribute("prenomEns", prenomEns);


        return "dossiers2";

    }


    @RequestMapping(value = "/Enseignant/Dossier_pédagogique", method = RequestMethod.GET)
    public String showDossierPedagogique(ModelMap model) {
        int ensId= EnseignantService.getSessionId();
        model.addAttribute("ensId",ensId);
        String nomEns= EnseignantService.getENSName();
        String prenomEns= EnseignantService.getENSPrenom();
        model.addAttribute("nomEns", nomEns);
        model.addAttribute("prenomEns", prenomEns);
        FileBucket fileModel = new FileBucket();
        MultiFileBucket filesModel = new MultiFileBucket();
        model.addAttribute("multiFileBucket", filesModel);
        model.addAttribute("fileBucket", fileModel);
        int idEns= EnseignantService.getSessionId();
        return "Dossier_pédagogique2";

    }



    //-------------- Afficher Dossier administratif
    @RequestMapping(value = "/Enseignant/Dossier_administratif", method = RequestMethod.GET)
    public String showdossAdmin(ModelMap model) {
        int ensId= EnseignantService.getSessionId();
        model.addAttribute("ensId",ensId);
        String nomEns= EnseignantService.getENSName();
        String prenomEns= EnseignantService.getENSPrenom();
        model.addAttribute("nomEns", nomEns);
        model.addAttribute("prenomEns", prenomEns);
        FileBucket fileModel = new FileBucket();
        MultiFileBucket filesModel = new MultiFileBucket();
        model.addAttribute("multiFileBucket", filesModel);
        model.addAttribute("fileBucket", fileModel);
        int idEns= EnseignantService.getSessionId();
        model.addAttribute("idEns", idEns);
        return "Dossier_administratif2";
    }




    //-------------- Afficher CV
    @RequestMapping(value = "/Enseignant/CV", method = RequestMethod.GET)
    public String showCV(ModelMap model, HttpSession session) {
        int ensId= EnseignantService.getSessionId();
        model.addAttribute("ensId",ensId);
        String nomEns= EnseignantService.getENSName();
        String prenomEns= EnseignantService.getENSPrenom();
        model.addAttribute("nomEns", nomEns);
        model.addAttribute("prenomEns", prenomEns);
        model.addAttribute("ensId",EnseignantService.getSessionId());

        return "CV2";
    }

    //-------------- Afficher demande
    @RequestMapping(value = "/Enseignant/Demande", method = RequestMethod.GET)
    public String showDemande(ModelMap model, HttpSession session) {
        model.addAttribute("infoDem", new Demande());
        return "Demande2";
    }

    //-------------- Save activité pédagogique
//-------------- Save activité pédagogique
    @RequestMapping(value = "/Enseignant/CV/AP", method = RequestMethod.POST)
    public String saveCV(Locale locale, ModelMap model, @RequestParam(value="type_grad") String type_grad, @RequestParam(value="module") String module, @RequestParam(value="annee") String annee, @RequestParam(value="cycle") String cycle, HttpSession session) {
        Activité_Pédagogique p=new Activité_Pédagogique(EnseignantService.getSessionId(),annee,module,type_grad,cycle);
        ActivitePedService.saveActivitePed(p);
        return  "redirect:http://localhost:8080/Enseignant/CV";
    }


    //-------------- Save Ouvrage
    @RequestMapping(value = "/Enseignant/CV/OP", method = RequestMethod.POST)
    public String saveOP(Locale locale, ModelMap model, @RequestParam(value="titre") String titre, @RequestParam(value="type") String type, @RequestParam(value="auteurs") String auteurs, @RequestParam(value="anneeE") int anneeE, @RequestParam(value="nb_pages") int nb_pages, @RequestParam(value="maison") String maison, HttpSession session) {
        Ouvrage o=new Ouvrage(EnseignantService.getSessionId(),type,titre,auteurs,maison,anneeE,nb_pages);
        OuvrageService.saveOuvrage(o);
        return  "redirect:http://localhost:8080/Enseignant/CV";
    }

    //-------------- Save Encadrement
    @RequestMapping(value = "/Enseignant/CV/EP", method = RequestMethod.POST)
    public String saveEP(Locale locale, ModelMap model, @RequestParam(value="type") String type, @RequestParam(value="candidat") String candidat, @RequestParam(value="titre") String titre, @RequestParam(value="date_soutenance") String date_soutenance, HttpSession session) {
        Encadrement e=new Encadrement(EnseignantService.getSessionId(),type,candidat,titre,date_soutenance);
        EncadrementService.saveEncadrement(e);
        return  "redirect:http://localhost:8080/Enseignant/CV";
    }

    //-------------- Save publication
    @RequestMapping(value = "/Enseignant/CV/PS", method = RequestMethod.POST)
    public String savePS(Locale locale, ModelMap model, @RequestParam(value="type") String type, @RequestParam(value="titre_article") String titre_article, @RequestParam(value="position_auteur") String position_auteur, @RequestParam(value="titre_revue") String titre_revue, @RequestParam(value="annee") int annee, @RequestParam(value="url") String url, HttpSession session) {
        Publication p=new Publication(EnseignantService.getSessionId(),type,titre_article,position_auteur,titre_revue,annee,url);
        PublicationService.savePublication(p);
        return  "redirect:http://localhost:8080/Enseignant/CV";
    }

    //-------------- Save communication
    @RequestMapping(value = "/Enseignant/CV/CS", method = RequestMethod.POST)
    public String saveCS(Locale locale, ModelMap model, @RequestParam(value="type") String type, @RequestParam(value="titre_com") String titre_com, @RequestParam(value="position_auteur") String position_auteur, @RequestParam(value="titre_manif") String titre_manif, @RequestParam(value="annee") int annee, @RequestParam(value="url") String url, HttpSession session) {
        Communication c=new Communication(EnseignantService.getSessionId(),type,titre_com,position_auteur,titre_manif,annee,url);
        CommunicationService.saveCommunication(c);
        return  "redirect:http://localhost:8080/Enseignant/CV";
    }

    //-------------- Save projet
    @RequestMapping(value = "/Enseignant/CV/PR", method = RequestMethod.POST)
    public String savePR(Locale locale, ModelMap model, @RequestParam(value="type") String type, @RequestParam(value="qualite") String qualite, @RequestParam(value="titre") String titre, @RequestParam(value="annee") int annee, HttpSession session) {
        Projet p=new Projet(EnseignantService.getSessionId(),type,qualite,titre,annee);
        ProjetService.saveProjet(p);
        return  "redirect:http://localhost:8080/Enseignant/CV";
    }

    //-------------- Save Animation
    @RequestMapping(value = "/Enseignant/CV/AS", method = RequestMethod.POST)
    public String saveAS(Locale locale, ModelMap model, @RequestParam(value="type") String type, @RequestParam(value="lieu") String lieu, @RequestParam(value="date") String date, @RequestParam(value="qualite") String qualite, HttpSession session) {
        Animation a=new Animation(EnseignantService.getSessionId(),type,lieu,date,qualite);
        AnimationService.saveAnimation(a);
        return  "redirect:http://localhost:8080/Enseignant/CV";
    }

    //-------------- Save expertise
    @RequestMapping(value = "/Enseignant/CV/EXP", method = RequestMethod.POST)
    public String saveAS(Locale locale, ModelMap model, @RequestParam(value="contexte") String contexte, @RequestParam(value="organisme") String organisme, @RequestParam(value="annee") int annee, HttpSession session) {
        Expertise e=new Expertise(EnseignantService.getSessionId(),contexte,organisme,annee);
        ExpertiseService.saveExpertise(e);
        return  "redirect:http://localhost:8080/Enseignant/CV";
    }

    //-------------- Save reponsabilité
    @RequestMapping(value = "/Enseignant/CV/RAS", method = RequestMethod.POST)
    public String saveRAS(Locale locale, ModelMap model, @RequestParam(value="type") String type, @RequestParam(value="annee_deb") int annee_deb, @RequestParam(value="annee_fin") int annee_fin, @RequestParam(value="structure") String structure, HttpSession session) {
        Responsabilité r=new Responsabilité(EnseignantService.getSessionId(),type,annee_deb,annee_fin,structure);
        ResponsabilitéService.saveResponsabilité(r);
        return  "redirect:http://localhost:8080/Enseignant/CV";
    }


    //-------------- Save Demande
    @RequestMapping(value = "/Enseignant/Demande", method = RequestMethod.POST)
    public String saveDemande(Locale locale, ModelMap model, @ModelAttribute("infoDem") Demande d, BindingResult br, HttpSession session) {
        ens= (Enseignant) session.getAttribute("customer");
        d.setCode_ens(EnseignantService.getSessionId());
        DemandeService.saveDemande(d);
        return "Demande2";
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
            int ensId= EnseignantService.getSessionId();
            model.addAttribute("idEns", ensId);
            return "Dossier_administratif2";
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
            return "Dossier_pédagogique2";
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
            int ensId= EnseignantService.getSessionId();
            System.out.println(ensId);
            model.addAttribute("ensId",ensId);

        }
        return "redirect:http://localhost:8080/Enseignant/Dossier_pédagogique";
    }

    @RequestMapping(value="/Enseignant/Dossier_pedegogique/Depot", method = RequestMethod.GET)
    public String singleFileUploadPedagogiqueGet(@Valid FileBucket fileBucket, BindingResult result, ModelMap model) throws IOException {
        int ensId= EnseignantService.getSessionId();
        model.addAttribute("ensId",ensId);
        String nomEns= EnseignantService.getENSName();
        String prenomEns= EnseignantService.getENSPrenom();
        model.addAttribute("nomEns", nomEns);
        model.addAttribute("prenomEns", prenomEns);
        FileBucket fileModel = new FileBucket();
        MultiFileBucket filesModel = new MultiFileBucket();
        model.addAttribute("multiFileBucket", filesModel);
        model.addAttribute("fileBucket", fileModel);
        int idEns= EnseignantService.getSessionId();
        return "Dossier_pédagogique2";
    }

    //-------------- Afficher fichiers administratifs
    @RequestMapping(value = "/Enseignant/Fichiers_pedagogiques/{idEns}", method = RequestMethod.GET)
    public String ShowFichiersPed(@PathVariable("idEns") int idEns, ModelMap model, HttpServletRequest request, HttpServletResponse response){

        String downloadFolder = context.getRealPath("/resources/files/Pédagogiques/");
        File folder=new File(downloadFolder+EnseignantService.getSessionId()+"/");
        System.out.println(folder);
        File[] fList = folder.listFiles();
        List<String> names=  new ArrayList();
        for (File file : fList){
            if (file.isFile()){
                System.out.println(file.getName());
                names.add(file.getName());

            }
            else{
                System.out.println("Folder : "+file.getName());
            }
        }

        int ensId= EnseignantService.getSessionId();
        model.addAttribute("ensId",ensId);

        String nomEns= EnseignantService.getENSName();
        String prenomEns= EnseignantService.getENSPrenom();
        model.addAttribute("nomEns", nomEns);
        model.addAttribute("prenomEns", prenomEns);
        model.addAttribute("fichiers",names);
        model.addAttribute("idEns", idEns);
        return ("Fichiers_Pédagogiques2");

    }

    //-------------- Afficher fichiers administratifs
    @RequestMapping(value = "/Enseignant/Fichiers_administratifs/{idEns}", method = RequestMethod.GET)
    public String ShowFichiersAdmin(@PathVariable("idEns") int idEns, ModelMap model, HttpServletRequest request, HttpServletResponse response){

        String downloadFolder = context.getRealPath("/resources/files/Administratifs/");
        File folder=new File(downloadFolder+EnseignantService.getSessionId()+"/");
        System.out.println(folder);
        File[] fList = folder.listFiles();
        List<String> names=  new ArrayList();

        for (File file : fList){
            if (file.isFile()){
                System.out.println(file.getName());
                names.add(file.getName());

            }
            else{
                System.out.println("Folder : "+file.getName());
            }
        }

        int ensId= EnseignantService.getSessionId();
        model.addAttribute("ensId",ensId);
        String nomEns= EnseignantService.getENSName();
        String prenomEns= EnseignantService.getENSPrenom();
        model.addAttribute("nomEns", nomEns);
        model.addAttribute("prenomEns", prenomEns);
        model.addAttribute("fichiers",names);
        model.addAttribute("idEns", idEns);
        return ("Fichiers_Administratifs2");

    }



    @RequestMapping(value = "/Enseignant/File/Supp/{idEns}/{file}", method = RequestMethod.GET)
    public String deleteFichiersAdmin(@PathVariable("file") Fichier file, @PathVariable("idEns") Fichier idEns, ModelMap model, HttpServletRequest request, HttpServletResponse response){
        String downloadFolder = context.getRealPath("/resources/files/Administratifs/");
        File folder=new File(downloadFolder+EnseignantService.getSessionId()+"/"+file);
        System.out.println(downloadFolder+EnseignantService.getSessionId()+"/"+file);
        if(folder.delete())
        {
            System.out.println("File deleted successfully");
        }
        else
        {
            System.out.println("Failed to delete the file");
        }

        int ensId= EnseignantService.getSessionId();
        model.addAttribute("ensId",ensId);
        String nomEns= EnseignantService.getENSName();
        String prenomEns= EnseignantService.getENSPrenom();
        model.addAttribute("nomEns", nomEns);
        model.addAttribute("prenomEns", prenomEns);
        return ("Fichiers_Administratifs2");

    }





    ///////////////////Les enseignements ///////////////////////////////////////
    @RequestMapping(value = "/Enseignant/Enseignements/{ensId}", method = RequestMethod.GET)
    public String showEnsEns(ModelMap model, @PathVariable("ensId") int ensId) {

        List<Activité_Pédagogique> ap = ActivitePedService.getEnseignementbyIdEns(ensId);
        model.addAttribute("ensId",ensId);
        String nomEns= EnseignantService.getENSName();
        String prenomEns= EnseignantService.getENSPrenom();
        model.addAttribute("nomEns", nomEns);
        model.addAttribute("prenomEns", prenomEns);
        model.addAttribute("ap", ap);

        return  "EnsEnseignements";

    }

    @RequestMapping(value = "/Enseignant/Enseignements/Supp/{ensId}/{id_actP}", method = RequestMethod.GET)
    public String deleteEns(ModelMap model, @PathVariable("id_actP") int id_actP, @PathVariable("ensId") int ensId) {

        ActivitePedService.supprActivite(id_actP);
        model.addAttribute("ensId",ensId);
        String nomEns= EnseignantService.getENSName();
        String prenomEns= EnseignantService.getENSPrenom();
        model.addAttribute("nomEns", nomEns);
        model.addAttribute("prenomEns", prenomEns);
        return  "redirect:http://localhost:8080/Enseignant/Enseignements/{ensId}";

    }

    @RequestMapping(value = "/Enseignant/Enseignement/Update/{ensId}/{id_actP}", method = RequestMethod.POST)
    public String UpdateEns(Locale locale, @PathVariable("id_actP") int id_actP,@PathVariable("ensId") int ensId, ModelMap model, @RequestParam(value="type_grad") String type_grad, @RequestParam(value="module") String module, @RequestParam(value="annee") String annee, @RequestParam(value="cycle") String cycle, HttpSession session) {
        System.out.println(id_actP);
        Activité_Pédagogique p=new Activité_Pédagogique(id_actP,EnseignantService.getSessionId(),annee,module,type_grad,cycle);
        ActivitePedService.updateActivitePed(p);
        model.addAttribute("ensId",ensId);
        String nomEns= EnseignantService.getENSName();
        String prenomEns= EnseignantService.getENSPrenom();
        model.addAttribute("nomEns", nomEns);
        model.addAttribute("prenomEns", prenomEns);
        return  "redirect:http://localhost:8080/Enseignant/Enseignements/{ensId}";
    }

    //////////////////Les communications //////////////////////////////////////
    @RequestMapping(value = "/Enseignant/Communications/{ensId}", method = RequestMethod.GET)
    public String showEnsCom(ModelMap model, @PathVariable("ensId") int ensId) {

        List<Communication> communication = CommunicationService.getCommunicationbyIdEns(ensId);

        model.addAttribute("communication", communication);
        model.addAttribute("ensId",ensId);
        String nomEns= EnseignantService.getENSName();
        String prenomEns= EnseignantService.getENSPrenom();
        model.addAttribute("nomEns", nomEns);
        model.addAttribute("prenomEns", prenomEns);
        return "EnsCommunication";

    }

    @RequestMapping(value = "/Enseignant/Communications/Supp/{ensId}/{id_com}", method = RequestMethod.GET)
    public String deleteCom(ModelMap model, @PathVariable("id_com") int id_com, @PathVariable("ensId") int ensId) {

        CommunicationService.supprCommunication(id_com);
        model.addAttribute("ensId",ensId);
        String nomEns= EnseignantService.getENSName();
        String prenomEns= EnseignantService.getENSPrenom();
        model.addAttribute("nomEns", nomEns);
        model.addAttribute("prenomEns", prenomEns);
        return  "redirect:http://localhost:8080/Enseignant/Communications/{ensId}";

    }

    @RequestMapping(value = "/Enseignant/Communication/Update/{ensId}/{id_com}", method = RequestMethod.POST)
    public String UpdateCS(Locale locale, @PathVariable("id_com") int id_com, @PathVariable("ensId") int ensId, ModelMap model, @RequestParam(value="type") String type, @RequestParam(value="titre_com") String titre_com, @RequestParam(value="position_auteur") String position_auteur, @RequestParam(value="titre_manif") String titre_manif, @RequestParam(value="annee") int annee, @RequestParam(value="url") String url, HttpSession session) {
        Communication c=new Communication(id_com,EnseignantService.getSessionId(),type,titre_com,position_auteur,titre_manif,annee,url);
        CommunicationService.UpdateCommunication(c);
        model.addAttribute("ensId",ensId);
        String nomEns= EnseignantService.getENSName();
        String prenomEns= EnseignantService.getENSPrenom();
        model.addAttribute("nomEns", nomEns);
        model.addAttribute("prenomEns", prenomEns);
        return  "redirect:http://localhost:8080/Enseignant/Communications/{ensId}";
    }


    //////////////////Les Encadrements //////////////////////////////////////
    @RequestMapping(value = "/Enseignant/Encadrements/{ensId}", method = RequestMethod.GET)
    public String showEnsEnc(ModelMap model, @PathVariable("ensId") int ensId) {

        List<Encadrement> encadrement = EncadrementService.getEncadrementbyIdEns(ensId);

        model.addAttribute("encadrement", encadrement);
        model.addAttribute("ensId",ensId);
        String nomEns= EnseignantService.getENSName();
        String prenomEns= EnseignantService.getENSPrenom();
        model.addAttribute("nomEns", nomEns);
        model.addAttribute("prenomEns", prenomEns);
        return "EnsEncadrement";

    }

    @RequestMapping(value = "/Enseignant/Encadrements/Supp/{ensId}/{id_enc}", method = RequestMethod.GET)
    public String deleteEnc(ModelMap model, @PathVariable("id_enc") int id_enc, @PathVariable("ensId") int ensId) {

        EncadrementService.supprEncadrement(id_enc);
        String nomEns= EnseignantService.getENSName();
        String prenomEns= EnseignantService.getENSPrenom();
        model.addAttribute("ensId",ensId);
        model.addAttribute("nomEns", nomEns);
        model.addAttribute("prenomEns", prenomEns);
        return  "redirect:http://localhost:8080/Enseignant/Encadrements/{ensId}";

    }

    @RequestMapping(value = "/Enseignant/Encadrement/Update/{ensId}/{id_enc}", method = RequestMethod.POST)
    public String saveEP(Locale locale, @PathVariable("id_enc") int id_enc, @PathVariable("ensId") int ensId, ModelMap model, @RequestParam(value="type") String type, @RequestParam(value="candidat") String candidat, @RequestParam(value="titre") String titre, @RequestParam(value="date_soutenance") String date_soutenance, HttpSession session) {
        Encadrement e=new Encadrement(id_enc, EnseignantService.getSessionId(),type,candidat,titre,date_soutenance);
        EncadrementService.UpdateEncadrement(e);
        String nomEns= EnseignantService.getENSName();
        String prenomEns= EnseignantService.getENSPrenom();
        model.addAttribute("nomEns", nomEns);
        model.addAttribute("ensId",ensId);
        model.addAttribute("prenomEns", prenomEns);
        return  "redirect:http://localhost:8080/Enseignant/Encadrements/{ensId}";
    }


    //////////////////Les Animations //////////////////////////////////////
    @RequestMapping(value = "/Enseignant/Animation/{ensId}", method = RequestMethod.GET)
    public String showEnsAnim(ModelMap model, @PathVariable("ensId") int ensId) {

        List<Animation> animation = AnimationService.getAnimationbyIdEns(ensId);
        model.addAttribute("ensId",ensId);
        model.addAttribute("animation", animation);
        String nomEns= EnseignantService.getENSName();
        String prenomEns= EnseignantService.getENSPrenom();
        model.addAttribute("nomEns", nomEns);
        model.addAttribute("prenomEns", prenomEns);
        return "EnsAnimation";

    }

    @RequestMapping(value = "/Enseignant/Animation/Supp/{ensId}/{id_anim}", method = RequestMethod.GET)
    public String deleteAnim(ModelMap model, @PathVariable("id_anim") int id_anim, @PathVariable("ensId") int ensId) {

        AnimationService.supprAnimation(id_anim);
        model.addAttribute("ensId",ensId);
        String nomEns= EnseignantService.getENSName();
        String prenomEns= EnseignantService.getENSPrenom();
        model.addAttribute("nomEns", nomEns);
        model.addAttribute("prenomEns", prenomEns);
        return  "redirect:http://localhost:8080/Enseignant/Animation/{ensId}";

    }


    @RequestMapping(value = "/Enseignant/Animation/Update/{ensId}/{id_anim}", method = RequestMethod.POST)
    public String saveAS(Locale locale, @PathVariable("id_anim") int id_anim, @PathVariable("ensId") int ensId, ModelMap model, @RequestParam(value="type") String type, @RequestParam(value="lieu") String lieu, @RequestParam(value="date") String date, @RequestParam(value="qualite") String qualite, HttpSession session) {
        Animation a=new Animation(id_anim, EnseignantService.getSessionId(),type,lieu,date,qualite);
        AnimationService.UpdateAnimation(a);
        model.addAttribute("ensId",ensId);
        String nomEns= EnseignantService.getENSName();
        String prenomEns= EnseignantService.getENSPrenom();
        model.addAttribute("nomEns", nomEns);
        model.addAttribute("prenomEns", prenomEns);
        return  "redirect:http://localhost:8080/Enseignant/Animation/{ensId}";
    }

    //////////////////Les Projets //////////////////////////////////////
    @RequestMapping(value = "/Enseignant/Projet/{ensId}", method = RequestMethod.GET)
    public String showEnsPro(ModelMap model, @PathVariable("ensId") int ensId) {

        List<Projet> projet = ProjetService.getProjetbyIdEns(ensId);

        model.addAttribute("projet", projet);
        model.addAttribute("ensId",ensId);
        String nomEns= EnseignantService.getENSName();
        String prenomEns= EnseignantService.getENSPrenom();
        model.addAttribute("nomEns", nomEns);
        model.addAttribute("prenomEns", prenomEns);
        return "EnsProjet";

    }

    @RequestMapping(value = "/Enseignant/Projet/Supp/{ensId}/{id_pro}", method = RequestMethod.GET)
    public String deletePro(ModelMap model, @PathVariable("id_pro") int id_pro,  @PathVariable("ensId") int ensId) {

        ProjetService.supprProjet(id_pro);
        model.addAttribute("ensId",ensId);
        String nomEns= EnseignantService.getENSName();
        String prenomEns= EnseignantService.getENSPrenom();
        model.addAttribute("nomEns", nomEns);
        model.addAttribute("prenomEns", prenomEns);
        return  "redirect:http://localhost:8080/Enseignant/Projet/{ensId}";
    }

    @RequestMapping(value = "/Enseignant/Projet/Update/{ensId}/{id_pro}", method = RequestMethod.POST)
    public String updatePR(Locale locale, @PathVariable("id_pro") int id_pro,@PathVariable("ensId") int ensId, ModelMap model, @RequestParam(value="type") String type, @RequestParam(value="qualite") String qualite, @RequestParam(value="titre") String titre, @RequestParam(value="annee") int annee, HttpSession session) {
        Projet p=new Projet(id_pro,EnseignantService.getSessionId(),type,qualite,titre,annee);
        ProjetService.UpdateProjet(p);
        model.addAttribute("ensId",ensId);
        String nomEns= EnseignantService.getENSName();
        String prenomEns= EnseignantService.getENSPrenom();
        model.addAttribute("nomEns", nomEns);
        model.addAttribute("prenomEns", prenomEns);
        return  "redirect:http://localhost:8080/Enseignant/Projet/{ensId}";
    }


    //////////////////Les Expertises//////////////////////////////////////
    @RequestMapping(value = "/Enseignant/Expertise/{ensId}", method = RequestMethod.GET)
    public String showEnsExp(ModelMap model, @PathVariable("ensId") int ensId) {

        List<Expertise> expertise = ExpertiseService.getExpertisebyIdEns(ensId);
        model.addAttribute("expertise", expertise);
        model.addAttribute("ensId",ensId);
        String nomEns= EnseignantService.getENSName();
        String prenomEns= EnseignantService.getENSPrenom();
        model.addAttribute("nomEns", nomEns);
        model.addAttribute("prenomEns", prenomEns);
        return "EnsExpertise";

    }

    @RequestMapping(value = "/Enseignant/Expertise/Supp/{ensId}/{id_exp}", method = RequestMethod.GET)
    public String deleteExp(ModelMap model, @PathVariable("id_exp") int id_exp, @PathVariable("ensId") int ensId) {
        ExpertiseService.supprExpertise(id_exp);
        model.addAttribute("ensId",ensId);
        String nomEns= EnseignantService.getENSName();
        String prenomEns= EnseignantService.getENSPrenom();
        model.addAttribute("nomEns", nomEns);
        model.addAttribute("prenomEns", prenomEns);
        return  "redirect:http://localhost:8080/Enseignant/Expertise/{ensId}";
    }

    @RequestMapping(value = "/Enseignant/Expertise/Update/{ensId}/{id_exp}", method = RequestMethod.POST)
    public String updateExp(Locale locale, @PathVariable("id_exp") int id_exp, @PathVariable("ensId") int ensId, ModelMap model, @RequestParam(value="contexte") String contexte, @RequestParam(value="organisme") String organisme, @RequestParam(value="annee") int annee, HttpSession session) {
        Expertise e=new Expertise(id_exp, EnseignantService.getSessionId(),contexte,organisme,annee);
        ExpertiseService.UpdateExpertise(e);
        model.addAttribute("ensId",ensId);
        String nomEns= EnseignantService.getENSName();
        String prenomEns= EnseignantService.getENSPrenom();
        model.addAttribute("nomEns", nomEns);
        model.addAttribute("prenomEns", prenomEns);
        return  "redirect:http://localhost:8080/Enseignant/Expertise/{ensId}";
    }


    //////////////////Les Responsabilités//////////////////////////////////////
    @RequestMapping(value = "/Enseignant/Responsabilite/{ensId}", method = RequestMethod.GET)
    public String showEnsResp(ModelMap model, @PathVariable("ensId") int ensId) {

        List<Responsabilité> responsabilite = ResponsabilitéService.getResponsabilitebyIdEns(ensId);

        model.addAttribute("responsabilite", responsabilite);
        model.addAttribute("ensId",ensId);
        String nomEns= EnseignantService.getENSName();
        String prenomEns= EnseignantService.getENSPrenom();
        model.addAttribute("nomEns", nomEns);
        model.addAttribute("prenomEns", prenomEns);
        return "EnsResponsabilité";

    }

    @RequestMapping(value = "/Enseignant/Responsabilite/Supp/{ensId}/{id_resp}", method = RequestMethod.GET)
    public String deleteResp(ModelMap model, @PathVariable("id_resp") int id_resp,@PathVariable("ensId") int ensId) {

        ResponsabilitéService.supprResponsabilité(id_resp);
        model.addAttribute("ensId",ensId);
        String nomEns= EnseignantService.getENSName();
        String prenomEns= EnseignantService.getENSPrenom();
        model.addAttribute("nomEns", nomEns);
        model.addAttribute("prenomEns", prenomEns);
        return  "redirect:http://localhost:8080/Enseignant/Responsabilite/{ensId}";
    }

    @RequestMapping(value = "/Enseignant/Responsabilite/Update/{ensId}/{id_resp}", method = RequestMethod.POST)
    public String UpdateRAS(Locale locale, @PathVariable("id_resp") int id_resp, @PathVariable("ensId") int ensId, ModelMap model, @RequestParam(value="type") String type, @RequestParam(value="annee_deb") int annee_deb, @RequestParam(value="annee_fin") int annee_fin, @RequestParam(value="structure") String structure, HttpSession session) {
        Responsabilité r=new Responsabilité(id_resp,EnseignantService.getSessionId(),type,annee_deb,annee_fin,structure);
        ResponsabilitéService.UpdateResponsabilité(r);
        model.addAttribute("ensId",ensId);
        String nomEns= EnseignantService.getENSName();
        String prenomEns= EnseignantService.getENSPrenom();
        model.addAttribute("nomEns", nomEns);
        model.addAttribute("prenomEns", prenomEns);
        return  "redirect:http://localhost:8080/Enseignant/Responsabilite/{ensId}";
    }

    //////////////////Les Ouvrages //////////////////////////////////////
    @RequestMapping(value = "/Enseignant/Ouvrage/{ensId}", method = RequestMethod.GET)
    public String showEnsOuv(ModelMap model, @PathVariable("ensId") int ensId) {

        List<Ouvrage> ouvrage = OuvrageService.getOuvragebyIdEns(ensId);

        model.addAttribute("ouvrage", ouvrage);

        model.addAttribute("ensId",ensId);
        String nomEns= EnseignantService.getENSName();
        String prenomEns= EnseignantService.getENSPrenom();
        model.addAttribute("nomEns", nomEns);
        model.addAttribute("prenomEns", prenomEns);
        return "EnsOuvrage";

    }

    @RequestMapping(value = "/Enseignant/Ouvrage/Supp/{ensId}/{id_ouv}", method = RequestMethod.GET)
    public String deleteOuv(ModelMap model, @PathVariable("id_ouv") int id_ouv,@PathVariable("ensId") int ensId) {

        OuvrageService.supprOuvrage(id_ouv);
        model.addAttribute("ensId",ensId);
        String nomEns= EnseignantService.getENSName();
        String prenomEns= EnseignantService.getENSPrenom();
        model.addAttribute("nomEns", nomEns);
        model.addAttribute("prenomEns", prenomEns);
        return  "redirect:http://localhost:8080/Enseignant/Ouvrage/{ensId}";
    }

    @RequestMapping(value = "/Enseignant/Ouvrage/Update/{ensId}/{id_ouv}", method = RequestMethod.POST)
    public String saveOP(Locale locale, @PathVariable("id_ouv") int id_ouv,@PathVariable("ensId") int ensId, ModelMap model, @RequestParam(value="titre") String titre, @RequestParam(value="type") String type, @RequestParam(value="auteurs") String auteurs, @RequestParam(value="anneeE") int anneeE, @RequestParam(value="nb_pages") int nb_pages, @RequestParam(value="maison") String maison, HttpSession session) {
        Ouvrage o=new Ouvrage(id_ouv,EnseignantService.getSessionId(),type,titre,auteurs,maison,anneeE,nb_pages);
        OuvrageService.UpdateOuvrage(o);
        model.addAttribute("ensId",ensId);
        String nomEns= EnseignantService.getENSName();
        String prenomEns= EnseignantService.getENSPrenom();
        model.addAttribute("nomEns", nomEns);
        model.addAttribute("prenomEns", prenomEns);
        return  "redirect:http://localhost:8080/Enseignant/Ouvrage/{ensId}";
    }
    //////////////////Les Responsabilités//////////////////////////////////////
    @RequestMapping(value = "/Enseignant/Publication/{ensId}", method = RequestMethod.GET)
    public String showEnsPub(ModelMap model, @PathVariable("ensId") int ensId) {

        List<Publication> publication = PublicationService.getPublicationbyIdEns(ensId);

        model.addAttribute("publication", publication);
        model.addAttribute("ensId",ensId);
        String nomEns= EnseignantService.getENSName();
        String prenomEns= EnseignantService.getENSPrenom();
        model.addAttribute("nomEns", nomEns);
        model.addAttribute("prenomEns", prenomEns);
        return "EnsPublication";

    }

    @RequestMapping(value = "/Enseignant/Publication/Supp/{ensId}/{id_pub}", method = RequestMethod.GET)
    public String deletePub(ModelMap model, @PathVariable("id_pub") int id_pub,@PathVariable("ensId") int ensId) {
        PublicationService.supprPublication(id_pub);
        model.addAttribute("ensId",ensId);
        String nomEns= EnseignantService.getENSName();
        String prenomEns= EnseignantService.getENSPrenom();
        model.addAttribute("nomEns", nomEns);
        model.addAttribute("prenomEns", prenomEns);
        return  "redirect:http://localhost:8080/Enseignant/Publication/{ensId}";
    }
    @RequestMapping(value = "/Enseignant/Publication/Update/{ensId}/{id_pub}", method = RequestMethod.POST)
    public String savePS(Locale locale, @PathVariable("id_pub") int id_pub, @PathVariable("ensId") int ensId, ModelMap model, @RequestParam(value="type") String type, @RequestParam(value="titre_article") String titre_article, @RequestParam(value="position_auteur") String position_auteur, @RequestParam(value="titre_revue") String titre_revue, @RequestParam(value="annee") int annee, @RequestParam(value="url") String url, HttpSession session) {
        Publication p=new Publication(id_pub,EnseignantService.getSessionId(),type,titre_article,position_auteur,titre_revue,annee,url);
        PublicationService.UpdatePublication(p);
        model.addAttribute("ensId",ensId);
        String nomEns= EnseignantService.getENSName();
        String prenomEns= EnseignantService.getENSPrenom();
        model.addAttribute("nomEns", nomEns);
        model.addAttribute("prenomEns", prenomEns);
        return  "redirect:http://localhost:8080/Enseignant/Publication/{ensId}";
    }


    ////////////// Afficher SoumetreDossier
    @RequestMapping(value = "/Enseignant/SoumettreDossier", method = RequestMethod.GET)
    public String showSoum(ModelMap model) {

        int ensId= EnseignantService.getSessionId();
        model.addAttribute("ensId",ensId);
        String nomEns= EnseignantService.getENSName();
        String prenomEns= EnseignantService.getENSPrenom();
        model.addAttribute("nomEns", nomEns);
        model.addAttribute("prenomEns", prenomEns);
        return "SoumettreDossier";

    }


    @RequestMapping(value = "/Enseignant/SoumettreDossier/Soumission", method = RequestMethod.GET)
    public String effectuerSoum(ModelMap model) {

        int ensId= EnseignantService.getSessionId();
        model.addAttribute("ensId",ensId);
        String nomEns= EnseignantService.getENSName();
        String prenomEns= EnseignantService.getENSPrenom();
        Dossier dossier = EnseignantService.getEnsDossier(ensId);
        System.out.println(dossier.getId());
        EnseignantService.updateDossier(dossier);
        model.addAttribute("nomEns", nomEns);
        model.addAttribute("prenomEns", prenomEns);

        return "SoumettreDossier";

    }

    ////////////// Afficher SoumetreDossier
    @RequestMapping(value = "/Enseignant/EtatDossier", method = RequestMethod.GET)
    public String showEtat(ModelMap model) {

        int ensId= EnseignantService.getSessionId();
        Dossier d = EnseignantService.getEnsDossier(ensId);
        model.addAttribute("EtatD",d.getEtat());
        System.out.println(d.getEtat());
        model.addAttribute("ensId",ensId);
        String nomEns= EnseignantService.getENSName();
        String prenomEns= EnseignantService.getENSPrenom();
        model.addAttribute("nomEns", nomEns);
        model.addAttribute("prenomEns", prenomEns);
        return "EtatDossier";

    }


    @RequestMapping(value = "/Enseignant/Profil/{ensId}", method = RequestMethod.GET)
    public String showProfil(ModelMap model, @PathVariable("ensId") int ensId) {
        Enseignant enseign = EnseignantService.getEnseignantById(ensId);
        System.out.println(enseign.getNom());
        model.addAttribute("enseign", enseign);
        model.addAttribute("ensId",ensId);
        String nomEns= EnseignantService.getENSName();
        String prenomEns= EnseignantService.getENSPrenom();
        model.addAttribute("nomEns", nomEns);
        model.addAttribute("prenomEns", prenomEns);
        return "ProfilEnseignant";

    }
}


