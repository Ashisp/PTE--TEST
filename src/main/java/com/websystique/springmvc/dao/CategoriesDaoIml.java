/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.websystique.springmvc.dao;

import com.websystique.springmvc.model.Categories;
import com.websystique.springmvc.model.Sections;
import com.websystique.springmvc.model.Users;
import java.util.Collection;
import java.util.List;
import javax.annotation.Resource;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author ashis
 */

@Repository("CategoriesDao")
public class CategoriesDaoIml extends AbstractDao<Integer, Categories> implements CategoriesDao{

        @Resource(name = "sessionFactory")
    private SessionFactory sessionFactory;

    @Autowired
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public Categories findById(int id) {
      Categories categories= getByKey(id);
return categories;
    }

    public void save(Categories categories) {
     
        persist(categories);
// throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public Collection<Categories> findAllCategories() {
      
        
          Criteria criteria = createEntityCriteria().addOrder(Order.asc("catId"));
		criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);//To avoid duplicates.
		List<Categories> categories = (List<Categories>) criteria.list();
		
		return categories;
        
//throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public Integer findCatIdByOrderSquence(Integer seq_id) {
        Integer cat_id;
           Session session = sessionFactory.openSession();

              List<Sections> categories = sessionFactory.getCurrentSession().
                    createQuery("SELECT c FROM Categories s WHERE s.order_sequence= :seq_id").
                    setInteger("seq_id", seq_id).
                    list();
              
            cat_id = categories.get(0).getCatId();
            return cat_id;
//throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    
    
    
    
    
    
    
    
}
