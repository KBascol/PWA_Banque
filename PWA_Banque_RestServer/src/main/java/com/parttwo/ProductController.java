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

    @RequestMapping(value = "/{id}", method = RequestMethod.PUT)
    public void methodePut(@PathVariable("id") String nom, String newSubName, Float newSubPrice, int newSubDuration, Boolean del) {
        Subscription sub = new Subscription(newSubName, newSubPrice, newSubDuration);
        if(del){
            repo.findOne(nom).getSubs().remove(sub);
        }
        else{
            repo.findOne(nom).getSubs().add(sub);
        }    
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<Boolean> methodeDelete(@PathVariable("id") String nom) {
        repo.delete(nom);
        return new ResponseEntity<>(Boolean.TRUE, HttpStatus.OK);
    }  
}
