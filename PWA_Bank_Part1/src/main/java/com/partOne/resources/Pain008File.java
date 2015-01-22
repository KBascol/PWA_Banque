/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.partOne.resources;

import java.io.Serializable;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author nicolas
 */
@Entity
@Table(name="Pain008File")
public class Pain008File implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;

    @OneToMany(mappedBy = "file", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private List<Transaction> transaction;

    private String msgId;

    private String nameHeader;

    private String streetHeader;

    private String townHeader;

    private String country;

    private String email;

    public long getId() {
        return id;
    }

    public List<Transaction> getTransaction() {
        return transaction;
    }

    public String getMsgId() {
        return msgId;
    }

    public String getNameHeader() {
        return nameHeader;
    }

    public String getStreetHeader() {
        return streetHeader;
    }
    
    public String getTownHeader() {
        return townHeader;
    }

    public String getCountry() {
        return country;
    }

    public String getEmail() {
        return email;
    }
}
