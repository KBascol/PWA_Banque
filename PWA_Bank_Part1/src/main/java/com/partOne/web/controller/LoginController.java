package com.partOne.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author nicolas
 */

@Controller
public class LoginController {
	
	
	@RequestMapping(value = "/login**", method = RequestMethod.GET)
	public ModelAndView dologin() {

		ModelAndView model = new ModelAndView();
                model.addObject("message", "You need to be log in to acces to this page.");
                model.addObject("login", true);
		model.setViewName("login");
		return model;

	}
        
        @RequestMapping(value = "/login**", params="error", method = RequestMethod.GET)
	public ModelAndView doerror() {

		ModelAndView model = new ModelAndView();
                model.addObject("message", "Username or password error.");
                model.addObject("login", true);
		model.setViewName("login");
		return model;

	}
	@RequestMapping(value = "/logout**", method = RequestMethod.GET)
	public ModelAndView dologout() {

		ModelAndView model = new ModelAndView();
                model.addObject("message", "You have been logout !");
		model.setViewName("login");
		return model;

	}


}
