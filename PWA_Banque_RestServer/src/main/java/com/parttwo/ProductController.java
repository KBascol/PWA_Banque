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
 *
 * @author Kevin
 */

@RequestMapping("/products")
@RestController
public class ProductController {
    @Autowired
    ProductRepo repo;
    
    @Autowired
    SubscriptionRepo subsRepo;
    
    @Autowired
    OrderRepo ordsRepo;
    
    AutoMail mail = new AutoMail("auto.mail.projet","k.b.a.m.p");

    @RequestMapping(method = RequestMethod.GET)
    public List<Product> methodeGet() {
        return repo.findAll();
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public Product methodeGetUnElement(@PathVariable("id") String nom) {
        return repo.findOne(nom);
    }
    
    @RequestMapping(method = RequestMethod.POST)
    public void methodePost(@RequestBody @Valid Product newProd) {
        repo.save(newProd);
    }

    @RequestMapping(value = "/{id}/add", method = RequestMethod.PUT)
    public void addSub(@PathVariable("id") String nom, Subscription sub) {
        Product prod = repo.findOne(nom);
        subsRepo.save(sub);
        prod.getSubs().add(sub);
        repo.save(prod);
    }
    
    @RequestMapping(value = "/{id}/del", method = RequestMethod.PUT)   
    public void delSub(@PathVariable("id") String nom, Subscription sub) {
        Product prod = repo.findOne(nom);
        prod.getSubs().remove(sub);
        repo.save(prod);
        subsRepo.delete(sub);
    }
    
    @RequestMapping(value = "/{id}/ord", method = RequestMethod.PUT)
    public void addOrder(@PathVariable("id") String nom, Order ord) {
        ordsRepo.save(ord);
        mail.sendOrder(ord);
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<Boolean> methodeDelete(@PathVariable("id") String nom) {
        repo.delete(nom);
        return new ResponseEntity<>(Boolean.TRUE, HttpStatus.OK);
    }  
}
