/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.websystique.springmvc.service;

import com.websystique.springmvc.dao.QuestionTypesDao;
import com.websystique.springmvc.dao.QuestionsDao;
import com.websystique.springmvc.model.QuestionTypes;
import com.websystique.springmvc.model.Questions;
import java.util.Collection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author ashis
 */
@Service("QuestionsService")
@Transactional
public class QuestionsServiceIml implements QuestionsService {

    @Autowired
    private QuestionsDao dao;

    public Questions findById(int id) {
        return dao.findById(id);

        // throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public void saveQuestions(Questions questions) {

        dao.save(questions);

    }

    public void updateQuestions(Questions questions) {
        Questions entity = dao.findById(questions.getQuestionId());
        if (entity != null) {
            entity.setCatId(questions.getCatId());
            entity.setTypeId(questions.getTypeId());
            entity.setMediaPath(questions.getMediaPath());
            entity.setPassage(questions.getQuestion());
            entity.setSectionId(questions.getSectionId());

        }

//throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public Collection<Questions> findAllQuestions() {

        return dao.findAllQuestions();
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
