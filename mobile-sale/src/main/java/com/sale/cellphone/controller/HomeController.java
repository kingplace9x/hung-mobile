package com.sale.cellphone.controller;

import java.security.Principal;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sale.cellphone.forms.UserForm;


@Controller
public class HomeController {
	
	@Autowired
	HttpSession session;
	


	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<Principal> adminPage(Principal principal) {
		return new ResponseEntity<Principal>(principal,HttpStatus.OK);
	}
	
	@RequestMapping(value = { "/signin" }, method = RequestMethod.GET)
	public String signInPage(Model model, UserForm userform) {
		model.addAttribute(userform);
		return "comon/signupPage";
	}

	
	
	
}
