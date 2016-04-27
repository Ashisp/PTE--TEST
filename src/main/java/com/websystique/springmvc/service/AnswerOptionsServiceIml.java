/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.websystique.springmvc.service;

import com.websystique.springmvc.dao.AnswerOptionsDao;
import com.websystique.springmvc.dao.UsersDao;
import com.websystique.springmvc.model.AnswerOptions;
import java.util.Collection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author ashis
 */
@Service("AnswerOptionsService")
@Transactional
public class AnswerOptionsServiceIml  implements AnswerOptionsService{

    @Autowired
	private AnswerOptionsDao dao;
    
    
    
    public AnswerOptions findById(int id) {
        
        
return dao.findById(id);       


// throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public void saveAnswerOptions(AnswerOptions answeroptions) {
        
        dao.save(answeroptions);
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public void updateAnswerOptions(AnswerOptions answeroptions) {
       AnswerOptions entity = dao.findById(answeroptions.getOptId());
		if(entity!=null){
			
			entity.setOption(answeroptions.getOption());
			entity.setQuestionId(answeroptions.getQuestionId());
		
		}
        
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public Collection<AnswerOptions> findAllAnswerOptions() {
        return dao.findAllAnswerOptions();
        
        
        
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    
}
