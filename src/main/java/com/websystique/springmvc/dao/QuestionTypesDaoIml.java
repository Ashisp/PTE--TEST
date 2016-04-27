/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.websystique.springmvc.dao;

import com.websystique.springmvc.model.QuestionTypes;
import com.websystique.springmvc.model.Sections;
import com.websystique.springmvc.model.Users;
import java.util.Collection;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.springframework.stereotype.Repository;

/**
 *
 * @author ashis
 */
@Repository("QuestionTypes")
public class QuestionTypesDaoIml extends AbstractDao<Integer, QuestionTypes> implements QuestionTypesDao {

    public QuestionTypes findById(int id) {

        QuestionTypes questionTypes = getByKey(id);
        return questionTypes;
//throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public void save(QuestionTypes questionTypes) {

        persist(questionTypes);
// throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @SuppressWarnings("unchecked")
    public Collection<QuestionTypes> findAllQuestionTypes() {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.

        Criteria criteria = createEntityCriteria().addOrder(Order.asc("type_id"));
        criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);//To avoid duplicates.
        List<QuestionTypes> questionTypes = (List<QuestionTypes>) criteria.list();

        return questionTypes;

    }

}
