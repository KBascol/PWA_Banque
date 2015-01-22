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
 * Categories' entity.
 */

@Entity
@Data
public class Category {
    @Id
    String name;
}
