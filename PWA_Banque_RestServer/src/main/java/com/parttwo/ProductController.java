/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.parttwo;

import java.util.List;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 * Controller managing all the methods (adding, deleting, accessing) for the products and their subscriptions.
 * It manage also the subscribing.
 */

@RequestMapping("/products")
@RestController
public class ProductController {
    /**
     * Products' JPARepository.
     */
    @Autowired
    ProductRepo repo;
    
    /**
     * Subscriptions' JPARepository.
     */
    @Autowired
    SubscriptionRepo subsRepo;
    
    /**
     * Orders' JPARepository.
     */
    @Autowired
    OrderRepo ordsRepo;
    
    AutoMail mail = new AutoMail("auto.mail.projet","k.b.a.m.p");

    /**
     * Method to display all the products in the BD.
     * @return List of Product
     */
    @RequestMapping(method = RequestMethod.GET)
    public List<Product> methodGet() {
        return repo.findAll();
    }
    
    /**
     * Method to display the Product of name "name".
     * @param name
     * @return Product
     */
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public Product methodGetAnElement(@PathVariable("id") String name) {
        return repo.findOne(name);
    }
    
    /**
     * Method to add the Porduct newProd.
     * @param newProd 
     */
    @RequestMapping(method = RequestMethod.POST)
    public void methodPost(@RequestBody @Valid Product newProd) {
        repo.save(newProd);
    }

    /**
     * Method to add the Subscription sub to the Product of name "name"
     * @param name
     * @param sub 
     */
    @RequestMapping(value = "/{id}/add", method = RequestMethod.PUT)
    public void addSub(@PathVariable("id") String name, Subscription sub) {
        Product prod = repo.findOne(name);
        subsRepo.save(sub);
        prod.getSubs().add(sub);
        repo.save(prod);
    }
    
    /**
     * Method to delete the Subscription sub to the Product of name "name"
     * @param name
     * @param sub 
     */
    @RequestMapping(value = "/{id}/del", method = RequestMethod.PUT)   
    public void delSub(@PathVariable("id") String name, Subscription sub) {
        Product prod = repo.findOne(name);
        prod.getSubs().remove(sub);
        repo.save(prod);
        subsRepo.delete(sub);
    }
    
    /**
     * Method to consider the Order ord of the Product of name "name"
     * @param name
     * @param ord 
     */
    @RequestMapping(value = "/{id}/ord", method = RequestMethod.PUT)
    public void addOrder(@PathVariable("id") String name, Order ord) {
        ordsRepo.save(ord);
        mail.sendOrder(ord);
    }

    /**
     * method to delete the Product of name "name"
     * @param name
     * @return ResponseEntity
     */
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<Boolean> methodeDelete(@PathVariable("id") String name) {
        repo.delete(name);
        return new ResponseEntity<>(Boolean.TRUE, HttpStatus.OK);
    }  
}
