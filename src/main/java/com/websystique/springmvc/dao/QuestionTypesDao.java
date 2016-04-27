/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.websystique.springmvc.dao;

import com.websystique.springmvc.model.QuestionTypes;
import java.util.Collection;

/**
 *
 * @author ashis
 */
public interface QuestionTypesDao {
     QuestionTypes findById(int id);

    void save(QuestionTypes questionTypes);

    

    Collection<QuestionTypes> findAllQuestionTypes();
}
