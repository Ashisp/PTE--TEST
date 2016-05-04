/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.websystique.springmvc.dao;

import com.websystique.springmvc.model.AnswerOptions;
import com.websystique.springmvc.model.Answers;
import java.util.Collection;

/**
 *
 * @author ashis
 */
public interface AnswersDao {
   
     Answers findById(int id);

    void save(Answers answers);

    Collection<Answers> findAllAnswers();
    Collection<Answers> findAllAnswersByUserId(int id);
    
}
