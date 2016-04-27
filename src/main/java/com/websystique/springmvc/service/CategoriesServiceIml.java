/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.websystique.springmvc.service;

import com.websystique.springmvc.dao.AnswerOptionsDao;
import com.websystique.springmvc.dao.CategoriesDao;
import com.websystique.springmvc.model.Categories;
import java.util.Collection;
import javax.persistence.Entity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author ashis
 */
@Service("CategoriesService")
@Transactional

public class CategoriesServiceIml implements CategoriesService{

    
      @Autowired
	private CategoriesDao dao;
    public Categories findById(int id) {
       return dao.findById(id);     

// throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public void saveCategories(Categories categories) {


        dao.save(categories);
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public void updateCategories(Categories categories) {

        Categories entity =dao.findById(categories.getCatId());
        if(entity!=null){
			entity.setCatName(categories.getCatName());
			//entity.setQuestions(categories.getQuestions());
                        
		}
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public Collection<Categories> findAllCategories() {

        
        
          return dao.findAllCategories();
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
