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
 * @author bascool
 */

@RequestMapping("/subscriptions")
@RestController
public class SubscriptionController {
    @Autowired
    SubscriptionRepo repo;

    @RequestMapping(method = RequestMethod.GET)
    public List<Subscription> methodeGet() {
        return repo.findAll();
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public Subscription methodeGetUnElement(@PathVariable("id") String nom) {
        return repo.findOne(nom);
    }

    @RequestMapping(method = RequestMethod.POST)
    public void methodePost(@RequestBody @Valid Subscription newSub) {
        repo.save(newSub);
    }

    @RequestMapping(method = RequestMethod.PUT)
    public void methodePut(@RequestBody @Valid Subscription newSub) {
        repo.save(newSub);
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<Boolean> methodeDelete(@PathVariable("id") String nom) {
        repo.delete(nom);
        return new ResponseEntity<>(Boolean.TRUE, HttpStatus.OK);
    }  
}
