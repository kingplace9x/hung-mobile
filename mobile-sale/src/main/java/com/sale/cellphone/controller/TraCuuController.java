package com.sale.cellphone.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.sale.cellphone.logic.TraCuuHoaDonService;

@Controller
public class TraCuuController {
	
	@Autowired
	private TraCuuHoaDonService traCuuHoaDonService;
	
	@GetMapping("/tra-cuu-don-hang")
	public String traCuu(Model model) 
	{
		return "home/tracuu";
	}
	
	@PostMapping("/tra-cuu-don-hang")
	public String traCuuPost(Model model, String email) 
	{
		model.addAttribute("listHoaDon", traCuuHoaDonService.findHoaDonByUserEmailOrPhone(email));
		
		return "home/tracuu";
	}
}
