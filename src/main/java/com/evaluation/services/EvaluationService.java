package com.evaluation.services;

import com.evaluation.models.Enseignant;
import com.evaluation.models.Grille;
import com.evaluation.models.SousVariable;
import com.evaluation.models.Variable;

import java.util.List;

public interface EvaluationService {
    void saveGrille(Grille grille);
    void saveVariable(Variable variable);
    void saveSousVariable(SousVariable sousVariable);
    Grille getGrilleEnseingnat(Enseignant enseignant);
    List<Variable> getVariableGrille(Grille grille);
    List<Variable> getVariableEns(Enseignant ens);
    void updateGrille(Grille grille);
    void updateVariable(Variable variable);
    public int getNbrPointsTotalSV (Variable V);
    public void setNbrPointsTotalSV (Variable V);
    public Variable getVariableUniqueGrille(String variable, Grille grille);
    void setNbrPointsObservationGrille(Grille grille);
    void updateGrilleObservation(Grille grille, String Observation);
    public  List<Enseignant> getEnsAcceptes(String observation, int section);


}
