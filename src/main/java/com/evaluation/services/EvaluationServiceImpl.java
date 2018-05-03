package com.evaluation.services;

import com.evaluation.DAO.EvaluationDAO;
import com.evaluation.DAO.EvaluationDAOImpl;
import com.evaluation.models.Enseignant;
import com.evaluation.models.Grille;
import com.evaluation.models.SousVariable;
import com.evaluation.models.Variable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EvaluationServiceImpl implements EvaluationService{
    @Autowired
    EvaluationDAO EvalDAO;
    public void setEvalDAO(EvaluationDAO EvalDAO){
        this.EvalDAO=EvalDAO;
    }
    public void saveGrille(Grille grille){
        EvalDAO.saveGrille(grille);
    }
    public void saveVariable(Variable variable) {EvalDAO.saveVariable(variable);}
    public void saveSousVariable(SousVariable sousVariable){ EvalDAO.saveSousVariable(sousVariable);}
    public Grille getGrilleEnseingnat(Enseignant enseignant){
        return EvalDAO.getGrilleEnseingnat(enseignant);
    }
    public List<Variable> getVariableGrille(Grille grille){ return EvalDAO.getVariableGrille(grille);}
    public List<Variable> getVariableEns(Enseignant ens){return EvalDAO.getVariableEns(ens);}
    public void updateGrille(Grille grille){
        EvalDAO.updateGrille(grille);
    }
    public void updateVariable(Variable variable){
        EvalDAO.updateVariable(variable);
    }
    public int getNbrPointsTotalSV (Variable V){return EvalDAO.getNbrPointsTotalSV(V);}
    public void setNbrPointsTotalSV (Variable V) {EvalDAO.setNbrPointsTotalSV(V);}
    public Variable getVariableUniqueGrille(String variable, Grille grille){return EvalDAO.getVariableUniqueGrille(variable,grille);}
}
