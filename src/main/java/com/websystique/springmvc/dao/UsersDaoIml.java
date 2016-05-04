/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.websystique.springmvc.dao;

import com.websystique.springmvc.model.Users;
import java.util.Collection;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

/**
 *
 * @author ashis
 */

@Repository("UserDao")
public class UsersDaoIml extends AbstractDao<Integer, Users> implements UsersDao{

    public Users findById(int id) {
       
        
        Users users = getByKey(id);
		return users;
        
//throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    

    public void save(Users user) {
      persist(user);
        
// throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
@SuppressWarnings("unchecked")
    public Collection<Users> findAllUsers(Integer offset,Integer maxResults) {
      
      Criteria criteria = createEntityCriteria().addOrder(Order.asc("firstName"));
    criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);//To avoid duplicates.
    criteria.setFirstResult(offset!=null?offset:0)
    .setMaxResults(maxResults!=null?maxResults:1);
    List<Users> users = (List<Users>) criteria.list();

    return users;

//throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
  public Long countUsers(){
            Criteria criteria = createEntityCriteria().addOrder(Order.asc("firstName"));
            
  return (Long)criteria.setProjection(Projections.rowCount()).uniqueResult();
 }
  

    public void deleteById(int id) {
        Criteria crit = createEntityCriteria();
		crit.add(Restrictions.eq("id", id));
		Users user = (Users)crit.uniqueResult();
		delete(user);
        
        
        
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

  
}
