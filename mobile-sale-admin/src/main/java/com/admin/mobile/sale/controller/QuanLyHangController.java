package com.admin.mobile.sale.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.admin.mobile.sale.entities.Hang;
import com.admin.mobile.sale.repository.HangRepository;

@Controller
@PreAuthorize("principal.role eq T(com.admin.mobile.sale.enums.Role).ALL.toString() or principal.role eq T(com.admin.mobile.sale.enums.Role).MANAGER.toString()")
public class QuanLyHangController {
	
	@Autowired
	private HangRepository hangRepository;
	
	@GetMapping("/admin/quan-ly-hang")
	public String quanLyHang(Model model) {
		model.addAttribute("listHang", hangRepository.findAll());
		
		return "admin/quanlyhang";
	}
	
	@PostMapping("/admin/quan-ly-hang/chinh-sua")
	public String chinhSua(Hang hang) {
		
		hangRepository.save(hang);
		
		return "redirect:/admin/quan-ly-hang";
	}
	
	@PostMapping("/admin/quan-ly-hang/xoa/{id}")
	public String xoa(@PathVariable Integer id) {
		System.out.println(id);
		return "redirect:/admin/quan-ly-hang";
	}
}
