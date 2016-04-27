/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.websystique.springmvc.service;

import com.websystique.springmvc.model.Categories;
import com.websystique.springmvc.model.QuestionTypes;
import java.util.Collection;

/**
 *
 * @author ashis
 */
public interface QuestionTypesService {
    QuestionTypes findById(int id);

    void saveQuestionTypes(QuestionTypes questiontypes);

    void updateQuestionTypes(QuestionTypes questiontypes);

    Collection<QuestionTypes> findAllQuestionTypes();
    
}
