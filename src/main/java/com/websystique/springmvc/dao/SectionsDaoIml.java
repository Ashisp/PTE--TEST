/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.websystique.springmvc.dao;

import com.websystique.springmvc.model.Sections;
import com.websystique.springmvc.model.Users;
import com.websystique.springmvc.service.SectionsService;
import java.util.Collection;
import java.util.List;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
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
@Repository("SectionsDao")
public class SectionsDaoIml extends AbstractDao<Integer, Sections> implements SectionsDao {

    @Resource(name = "sessionFactory")
    private SessionFactory sessionFactory;

    @Autowired
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public Sections findById(int id) {

        Sections sections = getByKey(id);
        return sections;

// throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public void save(Sections sections) {

        persist(sections);
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @SuppressWarnings("unchecked")
    public Collection<Sections> findAllSections() {
        Criteria criteria = createEntityCriteria().addOrder(Order.asc("sectionId"));
        criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);//To avoid duplicates.
        List<Sections> sections = (List<Sections>) criteria.list();

        return sections;

//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public int findSectionIdByUrlPattern(String url_pattern) {
        List<Sections> data = null;
        try {
            Session session = sessionFactory.openSession();

            data = sessionFactory.getCurrentSession().
                    createQuery("SELECT s FROM Sections s WHERE s.urlPattern = :urlPattern").
                    setString("urlPattern", url_pattern).
                    list();
        } catch (Exception exe) {
        }
        return data.get(0).getSectionId();
//throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public String findUrlPatternByOrderSequence(int order) {
          String data = "";// NULL is bad programming :D what to write empty string (i.e "")ok 
        try {
            Session session = sessionFactory.openSession();

            List<Sections> sec = sessionFactory.getCurrentSession().
                    createQuery("SELECT s FROM Sections s WHERE s.orderSequence = :orderSequence").
                    setInteger("orderSequence", order).
                    list();
            data = sec.get(0).getUrlPattern();
        } catch (Exception exe) {
        }
        return data;
    }

}
