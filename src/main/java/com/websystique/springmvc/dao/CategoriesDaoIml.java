/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.websystique.springmvc.dao;

import com.websystique.springmvc.model.Categories;
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

@Repository("CategoriesDao")
public class CategoriesDaoIml extends AbstractDao<Integer, Categories> implements CategoriesDao{

    public Categories findById(int id) {
      Categories categories= getByKey(id);
return categories;
    }

    public void save(Categories categories) {
     
        persist(categories);
// throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public Collection<Categories> findAllCategories() {
      
        
          Criteria criteria = createEntityCriteria().addOrder(Order.asc("cat_id"));
		criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);//To avoid duplicates.
		List<Categories> categories = (List<Categories>) criteria.list();
		
		return categories;
        
//throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    
    
    
    
    
    
    
    
}
