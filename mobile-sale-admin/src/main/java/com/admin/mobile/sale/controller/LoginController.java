package com.admin.mobile.sale.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {
	
	@GetMapping("/login")
	public String login(HttpServletRequest request){
		String referrer = request.getHeader("Referer");
	    request.getSession().setAttribute("url_prior_login", referrer);
		return "common/login";
	}
}
