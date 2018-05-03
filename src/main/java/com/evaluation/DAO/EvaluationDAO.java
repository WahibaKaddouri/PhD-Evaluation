package com.evaluation.DAO;

import com.evaluation.models.Enseignant;
import com.evaluation.models.Grille;
import com.evaluation.models.SousVariable;
import com.evaluation.models.Variable;

import java.util.List;

public  interface EvaluationDAO {

    void saveGrille(Grille grille);
    void saveVariable(Variable variable);
    void saveSousVariable(SousVariable sousVariable);
    Grille getGrilleEnseingnat(Enseignant enseignant);
    List<Variable> getVariableGrille(Grille grille);
    List<Variable> getVariableEns(Enseignant ens);
    void updateGrille(Grille grille);
    void updateVariable(Variable variable);
    int getNbrPointsTotalSV (Variable V);
    void setNbrPointsTotalSV (Variable V);
    Variable getVariableUniqueGrille(String variable, Grille grille);

}
