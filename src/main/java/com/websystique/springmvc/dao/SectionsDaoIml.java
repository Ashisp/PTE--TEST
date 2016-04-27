/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.websystique.springmvc.dao;

import com.websystique.springmvc.model.Sections;
import com.websystique.springmvc.model.Users;
import java.util.Collection;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.springframework.stereotype.Repository;

/**
 *
 * @author ashis
 */
@Repository("SectionsDao")
public class SectionsDaoIml extends AbstractDao<Integer, Sections> implements SectionsDao{

    public Sections findById(int id) {
       
Sections sections= getByKey(id);
return sections;

// throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public void save(Sections sections) {

        persist(sections);
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @SuppressWarnings("unchecked")
    public Collection<Sections> findAllSections() {
    Criteria criteria = createEntityCriteria().addOrder(Order.asc("section_id"));
		criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);//To avoid duplicates.
		List<Sections> sections = (List<Sections>) criteria.list();
		
		return sections;

//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    
    
    
    
}
