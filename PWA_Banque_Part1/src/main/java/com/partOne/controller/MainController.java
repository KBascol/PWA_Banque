package com.partOne.controller;

import java.util.Map;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
 
@Controller
public class MainController {
 
	@RequestMapping(value = "/Accueil", method=RequestMethod.GET)
	public String defaultPage() {
	  return "mainPage";
	}
 
	@RequestMapping(value = {"/", "/Connexion"}, method = RequestMethod.GET)
	public String login(Map<String, Object> viewModel, @RequestParam(value = "error", required = false) String error,
		@RequestParam(value = "logout", required = false) String logout) {
 
	 if (error != null) {
		viewModel.put("error", "Invalid username and password!");
	  }
 
	  if (logout != null) {
		viewModel.put("msg", "You've been logged out successfully.");
	  }
 
	  return "test";
 
	}
 
	//for 403 access denied page
	@RequestMapping(value = "/403", method = RequestMethod.GET)
	public String accesssDenied(Map<String, Object> viewModel) {
 
	  //check if user is login
	  Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	  if (!(auth instanceof AnonymousAuthenticationToken)) {
		UserDetails userDetail = (UserDetails) auth.getPrincipal();	
		viewModel.put("username", userDetail.getUsername());
	  }
          
	  return "403"; 
	}
 
}
