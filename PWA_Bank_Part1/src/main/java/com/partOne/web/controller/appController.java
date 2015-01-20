package com.partOne.web.controller;

import com.partOne.resources.Transaction;
import com.partOne.TransactionDao.TransactionDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
/**
 *
 * @author kaldoran
 */

@Controller
public class appController {
    
    @Autowired
    TransactionDao transRepo;
                 
    @RequestMapping(value = { "/", "/welcome**" }, method = RequestMethod.GET)
	public ModelAndView welcomePage() {
 
		ModelAndView model = new ModelAndView();
		model.addObject("title", "Spring Security Hello World");
		model.addObject("message", "This is welcome page!");
		model.setViewName("index");
		return model;
 
	}
 
	@RequestMapping(value = "/admin**", method = RequestMethod.GET)
	public ModelAndView adminPage() {
 
		ModelAndView model = new ModelAndView();
		model.addObject("title", "Spring Security Hello World");
		model.addObject("message", "This is protected page - Admin Page!");
		model.setViewName("admin");
 
		return model;
 
	} 
        
        @RequestMapping(value="/List")
        public String listPage() {
             
            ModelAndView model = new ModelAndView();
            model.addObject("transactions", transRepo.findAll());
            return "listTrans";
        }
        
        @RequestMapping(value="/Research", method = RequestMethod.GET)
        public String searchPage() {
            return "research";
        }
        
}
