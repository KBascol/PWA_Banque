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
 * Controller managing the access to the orders.
 */

@RequestMapping("/orders")
@RestController
public class OrderController {
    /**
     * Orders' JPARepository.
     */
    @Autowired
    OrderRepo repo;
    
    /**
     * Method to display all the orders in the BD.
     * @return List of Order
     */
    @RequestMapping(method = RequestMethod.GET)
    public List<Order> methodGet() {
        return repo.findAll();
    }
    
    /**
     * Method to display the Order of number "num".
     * @param num
     * @return Order
     */
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)   
    public Order getOrder(@PathVariable("id") String num) {
        return repo.findOne(Integer.parseInt(num));
    }
}
