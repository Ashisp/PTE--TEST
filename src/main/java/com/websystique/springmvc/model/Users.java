/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.websystique.springmvc.model;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;
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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.UniqueConstraint;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Ashis
 */
@Entity
@Table(catalog = "rendron_db", schema = "", uniqueConstraints = {
    @UniqueConstraint(columnNames = {"email"})})
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Users.findAll", query = "SELECT u FROM Users u"),
    @NamedQuery(name = "Users.findByUserId", query = "SELECT u FROM Users u WHERE u.userId = :userId"),
    @NamedQuery(name = "Users.findByFirstName", query = "SELECT u FROM Users u WHERE u.firstName = :firstName"),
    @NamedQuery(name = "Users.findByLastName", query = "SELECT u FROM Users u WHERE u.lastName = :lastName"),
    @NamedQuery(name = "Users.findByEmail", query = "SELECT u FROM Users u WHERE u.email = :email"),
    @NamedQuery(name = "Users.findByPassword", query = "SELECT u FROM Users u WHERE u.password = :password"),
    @NamedQuery(name = "Users.findByDob", query = "SELECT u FROM Users u WHERE u.dob = :dob"),
    @NamedQuery(name = "Users.findByExamDate", query = "SELECT u FROM Users u WHERE u.examDate = :examDate"),
    @NamedQuery(name = "Users.findByPhoneNo", query = "SELECT u FROM Users u WHERE u.phoneNo = :phoneNo"),
    @NamedQuery(name = "Users.findByStreetAddress1", query = "SELECT u FROM Users u WHERE u.streetAddress1 = :streetAddress1"),
    @NamedQuery(name = "Users.findByStreetAddress2", query = "SELECT u FROM Users u WHERE u.streetAddress2 = :streetAddress2"),
    @NamedQuery(name = "Users.findByCity", query = "SELECT u FROM Users u WHERE u.city = :city"),
    @NamedQuery(name = "Users.findByState", query = "SELECT u FROM Users u WHERE u.state = :state"),
    @NamedQuery(name = "Users.findByPostalCode", query = "SELECT u FROM Users u WHERE u.postalCode = :postalCode"),
    @NamedQuery(name = "Users.findByCountry", query = "SELECT u FROM Users u WHERE u.country = :country"),
    @NamedQuery(name = "Users.findByApproveStatus", query = "SELECT u FROM Users u WHERE u.approveStatus = :approveStatus")})
public class Users implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "user_id", nullable = false)
    private Integer userId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "first_name", nullable = false, length = 50)
    private String firstName;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "last_name", nullable = false, length = 50)
    private String lastName;
    // @Pattern(regexp="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?", message="Invalid email")//if the field contains email address consider using this annotation to enforce field validation
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(nullable = false, length = 50)
    private String email;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(nullable = false, length = 50)
    private String password;
    @Basic(optional = false)
    @NotNull
    @Column(nullable = false)
    @Temporal(TemporalType.DATE)
    private Date dob;
    @Basic(optional = false)
    @NotNull
    @Column(name = "exam_date", nullable = false)
    @Temporal(TemporalType.DATE)
    private Date examDate;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "phone_no", nullable = false, length = 20)
    private String phoneNo;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "street_address1", nullable = false, length = 255)
    private String streetAddress1;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "street_address2", nullable = false, length = 255)
    private String streetAddress2;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(nullable = false, length = 50)
    private String city;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(nullable = false, length = 50)
    private String state;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "postal_code", nullable = false, length = 10)
    private String postalCode;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(nullable = false, length = 50)
    private String country;
    @Basic(optional = false)
    @NotNull
    @Column(name = "approve_status", nullable = false)
    private boolean approveStatus;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "userId")
    private Collection<Answers> answersCollection;

    public Users() {
    }

    public Users(Integer userId) {
        this.userId = userId;
    }

    public Users(Integer userId, String firstName, String lastName, String email, String password, Date dob, Date examDate, String phoneNo, String streetAddress1, String streetAddress2, String city, String state, String postalCode, String country, boolean approveStatus) {
        this.userId = userId;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.password = password;
        this.dob = dob;
        this.examDate = examDate;
        this.phoneNo = phoneNo;
        this.streetAddress1 = streetAddress1;
        this.streetAddress2 = streetAddress2;
        this.city = city;
        this.state = state;
        this.postalCode = postalCode;
        this.country = country;
        this.approveStatus = approveStatus;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public Date getExamDate() {
        return examDate;
    }

    public void setExamDate(Date examDate) {
        this.examDate = examDate;
    }

    public String getPhoneNo() {
        return phoneNo;
    }

    public void setPhoneNo(String phoneNo) {
        this.phoneNo = phoneNo;
    }

    public String getStreetAddress1() {
        return streetAddress1;
    }

    public void setStreetAddress1(String streetAddress1) {
        this.streetAddress1 = streetAddress1;
    }

    public String getStreetAddress2() {
        return streetAddress2;
    }

    public void setStreetAddress2(String streetAddress2) {
        this.streetAddress2 = streetAddress2;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getPostalCode() {
        return postalCode;
    }

    public void setPostalCode(String postalCode) {
        this.postalCode = postalCode;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public boolean getApproveStatus() {
        return approveStatus;
    }

    public void setApproveStatus(boolean approveStatus) {
        this.approveStatus = approveStatus;
    }

    @XmlTransient
    public Collection<Answers> getAnswersCollection() {
        return answersCollection;
    }

    public void setAnswersCollection(Collection<Answers> answersCollection) {
        this.answersCollection = answersCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (userId != null ? userId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Users)) {
            return false;
        }
        Users other = (Users) object;
        if ((this.userId == null && other.userId != null) || (this.userId != null && !this.userId.equals(other.userId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.websystique.springmvc.model.Users[ userId=" + userId + " ]";
    }
    
}
