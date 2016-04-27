/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.websystique.springmvc.service;

import com.websystique.springmvc.model.AnswerOptions;
import com.websystique.springmvc.model.Users;
import java.util.Collection;

/**
 *
 * @author ashis
 */
public interface AnswerOptionsService {
 
   AnswerOptions findById(int id);

    void saveAnswerOptions(AnswerOptions answeroptions);

    void updateAnswerOptions(AnswerOptions answeroptions);

    Collection<AnswerOptions> findAllAnswerOptions();
    
    
    
    
}
