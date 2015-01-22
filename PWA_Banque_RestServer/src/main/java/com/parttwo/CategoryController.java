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
 * Controller managing all the methods (adding, deleting, accessing) for the categories.
 */

@RequestMapping("/categories")
@RestController
public class CategoryController {
    /**
     * Categories' JPARepository.
     */
    @Autowired
    CategoryRepo repo;

    /**
     * Method to display all the categories in the BD.
     * @return List of Category
     */
    @RequestMapping(method = RequestMethod.GET)
    public List<Category> methodGet() {
        return repo.findAll();
    }

    /**
     * Method to display the category of name "name".
     * @param name
     * @return Category
     */
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public Category methodGetAnElement(@PathVariable("id") String name) {
        return repo.findOne(name);
    }

    /**
     * Method to add a Category newCat.
     * @param newCat 
     */
    @RequestMapping(method = RequestMethod.POST)
    public void methodPost(@RequestBody @Valid Category newCat) {
        repo.save(newCat);
    }

    /**
     * Method to add a Category newCat.
     * @param newCat 
     */
    @RequestMapping(method = RequestMethod.PUT)
    public void methodPut(@RequestBody @Valid Category newCat) {
        repo.save(newCat);
    }

    /**
     * Method to delete the Category of name "name"
     * @param name
     * @return ResponseEntity
     */
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<Boolean> methodDelete(@PathVariable("id") String name) {
        repo.delete(name);
        return new ResponseEntity<>(Boolean.TRUE, HttpStatus.OK);
    }  
}
