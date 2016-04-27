/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.websystique.springmvc.service;


import com.websystique.springmvc.dao.AnswersDao;
import com.websystique.springmvc.model.AnswerOptions;
import com.websystique.springmvc.model.Answers;
import java.util.Collection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author ashis
 */
@Service("AnswersService")
@Transactional
public class AnswersServiceIml implements AnswersService{

    
    @Autowired
	private AnswersDao dao;
    
    
    
    public Answers findById(int id) {
        
    return dao.findById(id);
        
//throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.



    
    }

    public void saveAnswers(Answers answers) {

        
         dao.save(answers);
        
// throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public void updateAnswers(Answers answers) {

   Answers entity = dao.findById(answers.getAnswerId());
		if(entity!=null){
                    
			entity.setAnswer(answers.getAnswer());
			entity.setQuestionId(answers.getQuestionId());
                        entity.setUserId(answers.getUserId());
                        
		
		}
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public Collection<Answers> findAllAnswers() {
 return dao.findAllAnswers();
        
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
