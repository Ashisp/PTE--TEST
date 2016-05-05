/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.websystique.springmvc.dao;

import com.websystique.springmvc.model.Questions;
import com.websystique.springmvc.model.Users;
import java.util.Collection;

/**
 *
 * @author ashis
 */
public interface QuestionsDao {

    Questions findById(int id);

    void save(Questions questions);

  
Long CountQuestions(Integer sectionId);
    Collection<Questions> findAllQuestions();
    Collection<Questions>findAllQuestionsBySectionId(Integer sectionId,Integer offset,Integer maxResults);
    
    
}
