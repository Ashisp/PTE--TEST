/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.websystique.springmvc.service;

import com.websystique.springmvc.model.Answers;
import com.websystique.springmvc.model.Users;
import java.util.Collection;

/**
 *
 * @author ashis
 */
public interface AnswersService {

    Answers findById(int id);

    void saveAnswers(Answers answers);

    void updateAnswers(Answers answers);

    Collection<Answers> findAllAnswers();
    Collection<Answers> findAllAnswersByUserId(int ids);

}
