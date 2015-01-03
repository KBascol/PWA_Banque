/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.parttwo;

import javax.persistence.Entity;
import javax.persistence.Id;
import lombok.Data;


/**
 *
 * @author bascool
 */

@Entity
@Data
public class Subscription {
    @Id
    private String name;
    
    private String category;
    private float price;
    private int duration;
}
