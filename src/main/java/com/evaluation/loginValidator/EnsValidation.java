package com.evaluation.loginValidator;

import com.evaluation.models.Enseignant;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

public class EnsValidation implements Validator {


    public boolean supports(Class<?> arg0) {

        return Enseignant.class.equals(arg0);
    }


    public void validate(Object arg0, Errors arg1) {

    }


}
