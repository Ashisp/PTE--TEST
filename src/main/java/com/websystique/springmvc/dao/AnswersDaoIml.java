/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.websystique.springmvc.dao;

import com.websystique.springmvc.model.Answers;
import com.websystique.springmvc.model.Questions;
import com.websystique.springmvc.model.Users;
import java.util.Collection;
import java.util.List;
import javax.annotation.Resource;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author ashis
 */
@Repository("AnswersDao")
public class AnswersDaoIml extends AbstractDao<Integer, Answers> implements AnswersDao {

    @Resource(name = "sessionFactory")
    private SessionFactory sessionFactory;

    @Autowired
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public Answers findById(int id) {
        Answers answers = getByKey(id);
        return answers;

// throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public void save(Answers answers) {

        persist(answers);
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @SuppressWarnings("unchecked")
    public Collection<Answers> findAllAnswers() {
        Criteria criteria = createEntityCriteria().addOrder(Order.asc("answerId"));
        criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);//To avoid duplicates.
        List<Answers> answers = (List<Answers>) criteria.list();

        return answers;

        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public Collection<Answers> findAllAnswersByUserId(int user_id) {

        Collection<Answers> data = null;
        try {

            Session session = sessionFactory.openSession();

            data = sessionFactory.getCurrentSession().
                    createQuery("SELECT a FROM Answers a WHERE a.userId = :userId").
                    setString("userId", String.valueOf(user_id)).
                    list();

            System.out.println("" + data);
            System.out.println("" + data);
        } catch (Exception exe) {
        }

        return data;
// throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
