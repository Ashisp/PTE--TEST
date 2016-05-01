/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.websystique.springmvc.service;

import com.websystique.springmvc.dao.SectionsDao;
import com.websystique.springmvc.model.Questions;
import com.websystique.springmvc.model.Sections;
import java.util.Collection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author ashis
 */
@Service("SectionsService")
@Transactional
public class SectionsServiceIml implements SectionsService{

    
    
    @Autowired
    private SectionsDao dao;
    public Sections findById(int id) {
return dao.findById(id);

// throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public void saveSections(Sections sections) {
dao.save(sections);
        
// throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public void updateSections(Sections sections) {
           Sections entity = dao.findById(sections.getSectionId());
        if (entity != null) {
            entity.setCatId(sections.getCatId());
            entity.setTime(sections.getTime());
            entity.setOrderSequence(sections.getOrderSequence());
            
        }
        
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public Collection<Sections> findAllSections() {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
   return dao.findAllSections();
    
    }

    public int findSectionIdByUrlPattern(String url_pattern) {
        

return dao.findSectionIdByUrlPattern(url_pattern);
//throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

   
    
}
