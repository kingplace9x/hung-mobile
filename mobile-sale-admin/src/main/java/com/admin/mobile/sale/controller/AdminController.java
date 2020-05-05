package com.admin.mobile.sale.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.admin.mobile.sale.service.ThongKeService;

@Controller
public class AdminController {
	
	@Autowired
	private ThongKeService thongKeService;

	@GetMapping("/admin")
	public String admin(Model model) {
		model.addAttribute("dto", thongKeService.thongKe());
		return "admin/admin";
	}

	@GetMapping("/")
	public String home() {
		return "redirect:/admin";
	}
}
