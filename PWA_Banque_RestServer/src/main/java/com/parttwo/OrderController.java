/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.parttwo;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author Kevin
 */

@RequestMapping("/orders")
@RestController
public class OrderController {
    
    @Autowired
    OrderRepo repo;
    
    @RequestMapping(method = RequestMethod.GET)
    public List<Order> methodeGet() {
        return repo.findAll();
    }
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)   
    public void getOrder(@PathVariable("id") String nom) {
        repo.findOne(nom);
    }
}
