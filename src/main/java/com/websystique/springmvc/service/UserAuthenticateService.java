/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.websystique.springmvc.service;

import com.websystique.springmvc.model.Users;
import java.util.List;
import javax.annotation.Resource;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.validator.constraints.Email;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author ashis
 */

@Component
@Transactional
public class UserAuthenticateService {
    @Resource(name="sessionFactory")
  private SessionFactory sessionFactory;
    private List list;

  public UserAuthenticateService()
{
}

    /**
     *
     * @param sessionFactory
     */
    @Autowired
  public void setSessionFactory(SessionFactory sessionFactory)
        {
            this.sessionFactory=sessionFactory;
        }
    
public List<Users> verifyLogin(String username,String password)
{
     boolean status=false;
    try {
        
        
         	Session session = sessionFactory.openSession();
                
                List users = sessionFactory.getCurrentSession()
        .createQuery( "from Users where email = :email and password = :password" )
        .setString( "email", username ).setString("password",password)
                        
        .list();
                
                System.out.println(users.size());


			if ((users != null) && (users.size() > 0)) {
status=true;	
return users;

                        }
//         
//List<User> user=(List<User>) hibernateTemplate.find("from User where email = ?1",username);
//if(user.size()!=0)
//{
//status=true;
//     
    } catch (Exception e) {
  
e.printStackTrace();    ;
    }
   

return null;
}


    
  
}
