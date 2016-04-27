/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.websystique.springmvc.model;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Ashis
 */
@Entity
@Table(catalog = "rendron_db", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Sections.findAll", query = "SELECT s FROM Sections s"),
    @NamedQuery(name = "Sections.findBySectionId", query = "SELECT s FROM Sections s WHERE s.sectionId = :sectionId"),
    @NamedQuery(name = "Sections.findByCatId", query = "SELECT s FROM Sections s WHERE s.catId = :catId"),
    @NamedQuery(name = "Sections.findByTime", query = "SELECT s FROM Sections s WHERE s.time = :time"),
    @NamedQuery(name = "Sections.findByOrderSequence", query = "SELECT s FROM Sections s WHERE s.orderSequence = :orderSequence")})
public class Sections implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "section_id", nullable = false)
    private Integer sectionId;
    @Basic(optional = false)
    @NotNull
    @Column(name = "cat_id", nullable = false)
    private int catId;
    @Basic(optional = false)
    @NotNull
    @Column(nullable = false)
    private int time;
    @Basic(optional = false)
    @NotNull
    @Column(name = "order_sequence", nullable = false)
    private int orderSequence;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "sectionId")
    private Collection<Questions> questionsCollection;

    public Sections() {
    }

    public Sections(Integer sectionId) {
        this.sectionId = sectionId;
    }

    public Sections(Integer sectionId, int catId, int time, int orderSequence) {
        this.sectionId = sectionId;
        this.catId = catId;
        this.time = time;
        this.orderSequence = orderSequence;
    }

    public Integer getSectionId() {
        return sectionId;
    }

    public void setSectionId(Integer sectionId) {
        this.sectionId = sectionId;
    }

    public int getCatId() {
        return catId;
    }

    public void setCatId(int catId) {
        this.catId = catId;
    }

    public int getTime() {
        return time;
    }

    public void setTime(int time) {
        this.time = time;
    }

    public int getOrderSequence() {
        return orderSequence;
    }

    public void setOrderSequence(int orderSequence) {
        this.orderSequence = orderSequence;
    }

    @XmlTransient
    public Collection<Questions> getQuestionsCollection() {
        return questionsCollection;
    }

    public void setQuestionsCollection(Collection<Questions> questionsCollection) {
        this.questionsCollection = questionsCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (sectionId != null ? sectionId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Sections)) {
            return false;
        }
        Sections other = (Sections) object;
        if ((this.sectionId == null && other.sectionId != null) || (this.sectionId != null && !this.sectionId.equals(other.sectionId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.websystique.springmvc.model.Sections[ sectionId=" + sectionId + " ]";
    }
    
}
