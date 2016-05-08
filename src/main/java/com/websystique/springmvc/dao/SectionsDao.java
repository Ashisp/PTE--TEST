/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.websystique.springmvc.dao;

import com.websystique.springmvc.model.Questions;
import com.websystique.springmvc.model.Sections;
import java.util.Collection;

/**
 *
 * @author ashis
 */
public interface SectionsDao {
    
      Sections findById(int id);
    void save(Sections sections);

    Collection<Sections> findAllSections();
            int findSectionIdByUrlPattern(String url_pattern);
            String findUrlPatternByOrderSequence(int order);
            Integer findCatIdBySectionId(Integer sec_id);
   
    
    
}
