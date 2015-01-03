/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.parttwo;

import java.sql.Date;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 *
 * @author bascool
 */
public class Subscribed {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    
    private User user;
    private Subscription sub;
    private Date beginning;
    private Date end;
    private Boolean autoRenew;
    
}
