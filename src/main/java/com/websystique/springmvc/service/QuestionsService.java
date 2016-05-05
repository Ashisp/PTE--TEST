/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.websystique.springmvc.service;


import com.websystique.springmvc.model.Questions;
import java.util.Collection;

/**
 *
 * @author ashis
 */
public interface QuestionsService {
    Questions findById(int id);
    void saveQuestions(Questions questions);
    void updateQuestions(Questions questions);
    Collection<Questions> findAllQuestions();
    Collection<Questions>findAllQuestionsBySectionId(Integer section_id,Integer offset,Integer maxResults);
    Long CountALlQuestions(Integer sectionId);
}
