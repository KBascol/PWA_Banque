/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.parttwo;

import java.io.Serializable;
import java.sql.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import lombok.Data;

/**
 *
 * @author Kevin
 */
@Entity
@Data
@Table(name="ProdOrder")
public class Order implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int orderNum;
    
    private String FirstName;
    private String LastName;
    private String email;
    private String iban;
    
    private String sub;
    
   /* private Date start;
    private Date end;*/
}
