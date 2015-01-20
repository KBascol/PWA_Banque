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

    private float price;
    private int duration;

    Subscription(String newSubName, Float newSubPrice, int newSubDuration) {
        this.name = newSubName;
        this.price = newSubPrice;
        this.duration = newSubDuration;
    }
}
