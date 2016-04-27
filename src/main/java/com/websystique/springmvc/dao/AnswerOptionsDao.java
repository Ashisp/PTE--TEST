/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.websystique.springmvc.dao;

import com.websystique.springmvc.model.AnswerOptions;
import com.websystique.springmvc.model.Categories;
import java.util.Collection;

public interface AnswerOptionsDao {

    AnswerOptions findById(int id);

    void save(AnswerOptions answerOptions);

    Collection<AnswerOptions> findAllAnswerOptions();
}
