/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.websystique.springmvc.service;

import com.websystique.springmvc.model.Users;
import java.util.Collection;

/**
 *
 * @author ashis
 */
public interface UsersService {

    Users findById(int id);

    void saveUser(Users user);

    void updateUser(Users user);
   void deleteById(int id);
    Collection<Users> findAllUsers();

}
