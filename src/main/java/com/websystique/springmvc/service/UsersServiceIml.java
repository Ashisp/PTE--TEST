/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.websystique.springmvc.service;

import com.websystique.springmvc.dao.UsersDao;
import com.websystique.springmvc.model.Users;
import java.util.Collection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author ashis
 */

@Service("UsersService")
@Transactional
public class UsersServiceIml implements UsersService{

    @Autowired
    private UsersDao dao;
    
    
    public Users findById(int id) {

return dao.findById(id);
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public void saveUser(Users user) {
dao.save(user);

//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public void updateUser(Users user) {
Users entity= dao.findById(user.getUserId());
if(entity!=null)
{

 entity.setFirstName(user.getFirstName());
 entity.setLastName(user.getLastName());
 entity.setEmail(user.getEmail());
 entity.setPassword(user.getPassword());
 entity.setDob(user.getDob());
 entity.setExamDate(user.getExamDate());
 entity.setPhoneNo(user.getPhoneNo());
 entity.setStreetAddress1(user.getStreetAddress1());
entity.setStreetAddress2(user.getStreetAddress2());
entity.setCity(user.getCity());
entity.setState(user.getState());
entity.setPostalCode(user.getPostalCode());
entity.setCountry(user.getCountry());
entity.setApproveStatus(user.getApproveStatus());

      
}

//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    public Collection<Users> findAllUsers(Integer offset,Integer maxResults) {


       return dao.findAllUsers(offset,maxResults);
        
        
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public void deleteById(int id) {
    dao.deleteById(id);
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public Long countUsers() {
return dao.countUsers();
        
//throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
