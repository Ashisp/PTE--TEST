/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.websystique.springmvc.service;
import com.websystique.springmvc.dao.QuestionTypesDao;
import com.websystique.springmvc.model.QuestionTypes;
import java.util.Collection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
/**
 *
 * @author ashis
 */
@Service("QuestionTypesService")
@Transactional
public class QuestionTypesServiceIml implements QuestionTypesService{

    
     @Autowired
	private QuestionTypesDao dao;
     
    public QuestionTypes findById(int id) {
       return dao.findById(id); 
        
//throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public void saveQuestionTypes(QuestionTypes questiontypes) {
       
        
        dao.save(questiontypes);
        
// throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public void updateQuestionTypes(QuestionTypes questiontypes) {
        

          QuestionTypes entity =dao.findById(questiontypes.getTypeId());
        if(entity!=null){
			entity.setTypeName(questiontypes.getTypeName());
			entity.setTypeDescription(questiontypes.getTypeDescription());
                        
		}
//throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public Collection<QuestionTypes> findAllQuestionTypes() {
       // throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
     return dao.findAllQuestionTypes();
    }
    
}
