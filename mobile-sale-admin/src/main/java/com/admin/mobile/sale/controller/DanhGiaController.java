package com.admin.mobile.sale.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.admin.mobile.sale.repository.SanPhamRepository;

@Controller
public class DanhGiaController {
	
	@Autowired
	private SanPhamRepository sanPhamRepository;
	
	@GetMapping("/admin/danhgia/search/{idSP}")
	public String searchDanhGia(@PathVariable Integer idSP, Model model) {
		model.addAttribute("sanpham", sanPhamRepository.findById(idSP).get());
		return "admin/quanlysanpham :: danh-gia";
	}
}
