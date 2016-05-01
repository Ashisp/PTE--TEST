/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.websystique.springmvc.dao;

import com.websystique.springmvc.model.AnswerOptions;
import com.websystique.springmvc.model.Users;
import java.util.Collection;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.springframework.stereotype.Repository;

@Repository("AnswerOptionsDao")
public class AnswerOptionsDaoIml extends AbstractDao<Integer, AnswerOptions> implements AnswerOptionsDao {

    public AnswerOptions findById(int id) {
        AnswerOptions answerOptions = findById(id);
        return answerOptions;
//  throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public void save(AnswerOptions answerOptions) {

        persist(answerOptions);

//  throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public Collection<AnswerOptions> findAllAnswerOptions() {

        Criteria criteria = createEntityCriteria().addOrder(Order.asc("optId"));
        criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);//To avoid duplicates.
        List<AnswerOptions> answerOptions = (List<AnswerOptions>) criteria.list();

        return answerOptions;
//  throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
