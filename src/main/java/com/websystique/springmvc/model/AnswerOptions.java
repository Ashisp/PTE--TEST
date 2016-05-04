/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.websystique.springmvc.model;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Ashis
 */
@Entity
@Table(name = "answer_options", catalog = "rendron_db", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "AnswerOptions.findAll", query = "SELECT a FROM AnswerOptions a"),
    @NamedQuery(name = "AnswerOptions.findByOptId", query = "SELECT a FROM AnswerOptions a WHERE a.optId = :optId"),
    @NamedQuery(name = "AnswerOptions.findByCorrectOption", query = "SELECT a FROM AnswerOptions a WHERE a.correctOption = :correctOption"),
    @NamedQuery(name = "AnswerOptions.findByOrderBlanks", query = "SELECT a FROM AnswerOptions a WHERE a.orderBlanks = :orderBlanks")})
public class AnswerOptions implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "opt_id", nullable = false)
    private Integer optId;
    @Basic(optional = false)
    @NotNull
    @Lob
    @Size(min = 1, max = 65535)
    @Column(name = "ans_option", nullable = false, length = 65535)
    private String ansOption;
    @Column(name = "correct_option")
    private Boolean correctOption;
    @Size(max = 20)
    @Column(name = "order_blanks", length = 20)
    private String orderBlanks;
    @JoinColumn(name = "question_id", referencedColumnName = "question_id", nullable = false)
    @ManyToOne(optional = false)
    private Questions questionId;

    public AnswerOptions() {
    }

    public AnswerOptions(Integer optId) {
        this.optId = optId;
    }

    public AnswerOptions(Integer optId, String ansOption) {
        this.optId = optId;
        this.ansOption = ansOption;
    }

    public Integer getOptId() {
        return optId;
    }

    public void setOptId(Integer optId) {
        this.optId = optId;
    }

    public String getAnsOption() {
        return ansOption;
    }

    public void setAnsOption(String ansOption) {
        this.ansOption = ansOption;
    }

    public Boolean getCorrectOption() {
        return correctOption;
    }

    public void setCorrectOption(Boolean correctOption) {
        this.correctOption = correctOption;
    }

    public String getOrderBlanks() {
        return orderBlanks;
    }

    public void setOrderBlanks(String orderBlanks) {
        this.orderBlanks = orderBlanks;
    }

    public Questions getQuestionId() {
        return questionId;
    }

    public void setQuestionId(Questions questionId) {
        this.questionId = questionId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (optId != null ? optId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof AnswerOptions)) {
            return false;
        }
        AnswerOptions other = (AnswerOptions) object;
        if ((this.optId == null && other.optId != null) || (this.optId != null && !this.optId.equals(other.optId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.websystique.springmvc.model.AnswerOptions[ optId=" + optId + " ]";
    }
    
}
