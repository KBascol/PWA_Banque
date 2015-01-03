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

@RequestMapping("/categories")
@RestController
public class CategoryController {
    @Autowired
    CategoryRepo repo;

    @RequestMapping(method = RequestMethod.GET)
    public List<Category> methodeGet() {
        return repo.findAll();
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public Category methodeGetUnElement(@PathVariable("id") String nom) {
        return repo.findOne(nom);
    }

    @RequestMapping(method = RequestMethod.POST)
    public void methodePost(@RequestBody @Valid Category newCat) {
        repo.save(newCat);
    }

    @RequestMapping(method = RequestMethod.PUT)
    public void methodePut(@RequestBody @Valid Category newCat) {
        repo.save(newCat);
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<Boolean> methodeDelete(@PathVariable("id") String nom) {
        repo.delete(nom);
        return new ResponseEntity<>(Boolean.TRUE, HttpStatus.OK);
    }  
}
