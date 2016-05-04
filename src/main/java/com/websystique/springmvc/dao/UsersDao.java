/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.websystique.springmvc.dao;

import com.websystique.springmvc.model.Users;
import java.util.Collection;
import java.util.List;

/**
 *
 * @author ashis
 */


public interface UsersDao {

    Users findById(int id);

    void save(Users user);

 void deleteById(int id);

    Collection<Users> findAllUsers(Integer offset,Integer maxResults);
    Long countUsers();

}
