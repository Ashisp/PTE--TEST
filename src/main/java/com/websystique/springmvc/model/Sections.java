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
import javax.validation.constraints.Size;
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
    @NamedQuery(name = "Sections.findBySectionName", query = "SELECT s FROM Sections s WHERE s.sectionName = :sectionName"),
    @NamedQuery(name = "Sections.findByCatId", query = "SELECT s FROM Sections s WHERE s.catId = :catId"),
    @NamedQuery(name = "Sections.findByTime", query = "SELECT s FROM Sections s WHERE s.time = :time"),
    @NamedQuery(name = "Sections.findByInstructions", query = "SELECT s FROM Sections s WHERE s.instructions = :instructions"),
    @NamedQuery(name = "Sections.findByOrderSequence", query = "SELECT s FROM Sections s WHERE s.orderSequence = :orderSequence"),
    @NamedQuery(name = "Sections.findByAudioPlayAfter", query = "SELECT s FROM Sections s WHERE s.audioPlayAfter = :audioPlayAfter"),
    @NamedQuery(name = "Sections.findByStartRecordAfter", query = "SELECT s FROM Sections s WHERE s.startRecordAfter = :startRecordAfter"),
    @NamedQuery(name = "Sections.findByMaxRecordingTime", query = "SELECT s FROM Sections s WHERE s.maxRecordingTime = :maxRecordingTime"),
    @NamedQuery(name = "Sections.findByUrlPattern", query = "SELECT s FROM Sections s WHERE s.urlPattern = :urlPattern")})
public class Sections implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "section_id", nullable = false)
    private Integer sectionId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 1000)
    @Column(name = "section_name", nullable = false, length = 1000)
    private String sectionName;
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
    @Size(min = 1, max = 500)
    @Column(nullable = false, length = 500)
    private String instructions;
    @Basic(optional = false)
    @NotNull
    @Column(name = "order_sequence", nullable = false)
    private int orderSequence;
    @Size(max = 30)
    @Column(name = "audio_play_after", length = 30)
    private String audioPlayAfter;
    @Size(max = 30)
    @Column(name = "start_record_after", length = 30)
    private String startRecordAfter;
    @Size(max = 30)
    @Column(name = "max_recording_time", length = 30)
    private String maxRecordingTime;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "url_pattern", nullable = false, length = 255)
    private String urlPattern;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "sectionId")
    private Collection<Answers> answersCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "sectionId")
    private Collection<Questions> questionsCollection;

    public Sections() {
    }

    public Sections(Integer sectionId) {
        this.sectionId = sectionId;
    }

    public Sections(Integer sectionId, String sectionName, int catId, int time, String instructions, int orderSequence, String urlPattern) {
        this.sectionId = sectionId;
        this.sectionName = sectionName;
        this.catId = catId;
        this.time = time;
        this.instructions = instructions;
        this.orderSequence = orderSequence;
        this.urlPattern = urlPattern;
    }

    public Integer getSectionId() {
        return sectionId;
    }

    public void setSectionId(Integer sectionId) {
        this.sectionId = sectionId;
    }

    public String getSectionName() {
        return sectionName;
    }

    public void setSectionName(String sectionName) {
        this.sectionName = sectionName;
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

    public String getInstructions() {
        return instructions;
    }

    public void setInstructions(String instructions) {
        this.instructions = instructions;
    }

    public int getOrderSequence() {
        return orderSequence;
    }

    public void setOrderSequence(int orderSequence) {
        this.orderSequence = orderSequence;
    }

    public String getAudioPlayAfter() {
        return audioPlayAfter;
    }

    public void setAudioPlayAfter(String audioPlayAfter) {
        this.audioPlayAfter = audioPlayAfter;
    }

    public String getStartRecordAfter() {
        return startRecordAfter;
    }

    public void setStartRecordAfter(String startRecordAfter) {
        this.startRecordAfter = startRecordAfter;
    }

    public String getMaxRecordingTime() {
        return maxRecordingTime;
    }

    public void setMaxRecordingTime(String maxRecordingTime) {
        this.maxRecordingTime = maxRecordingTime;
    }

    public String getUrlPattern() {
        return urlPattern;
    }

    public void setUrlPattern(String urlPattern) {
        this.urlPattern = urlPattern;
    }

    @XmlTransient
    public Collection<Answers> getAnswersCollection() {
        return answersCollection;
    }

    public void setAnswersCollection(Collection<Answers> answersCollection) {
        this.answersCollection = answersCollection;
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
