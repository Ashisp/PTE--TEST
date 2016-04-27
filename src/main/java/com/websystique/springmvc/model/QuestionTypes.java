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
import javax.persistence.Lob;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Ashis
 */
@Entity
@Table(name = "question_types", catalog = "rendron_db", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "QuestionTypes.findAll", query = "SELECT q FROM QuestionTypes q"),
    @NamedQuery(name = "QuestionTypes.findByTypeId", query = "SELECT q FROM QuestionTypes q WHERE q.typeId = :typeId"),
    @NamedQuery(name = "QuestionTypes.findByTypeName", query = "SELECT q FROM QuestionTypes q WHERE q.typeName = :typeName")})
public class QuestionTypes implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "type_id", nullable = false)
    private Integer typeId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "type_name", nullable = false, length = 100)
    private String typeName;
    @Basic(optional = false)
    @NotNull
    @Lob
    @Size(min = 1, max = 65535)
    @Column(name = "type_description", nullable = false, length = 65535)
    private String typeDescription;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "typeId")
    private Collection<Questions> questionsCollection;

    public QuestionTypes() {
    }

    public QuestionTypes(Integer typeId) {
        this.typeId = typeId;
    }

    public QuestionTypes(Integer typeId, String typeName, String typeDescription) {
        this.typeId = typeId;
        this.typeName = typeName;
        this.typeDescription = typeDescription;
    }

    public Integer getTypeId() {
        return typeId;
    }

    public void setTypeId(Integer typeId) {
        this.typeId = typeId;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public String getTypeDescription() {
        return typeDescription;
    }

    public void setTypeDescription(String typeDescription) {
        this.typeDescription = typeDescription;
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
        hash += (typeId != null ? typeId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof QuestionTypes)) {
            return false;
        }
        QuestionTypes other = (QuestionTypes) object;
        if ((this.typeId == null && other.typeId != null) || (this.typeId != null && !this.typeId.equals(other.typeId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.websystique.springmvc.model.QuestionTypes[ typeId=" + typeId + " ]";
    }
    
}
