/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.websystique.springmvc.service;

import com.websystique.springmvc.model.Answers;
import com.websystique.springmvc.model.Categories;
import java.util.Collection;

/**
 *
 * @author ashis
 */
public interface CategoriesService {
    
     Categories findById(int id);

    void saveCategories(Categories categories);

    void updateCategories(Categories categories);

    Collection<Categories> findAllCategories();
}
