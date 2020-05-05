package com.sale.cellphone.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;

import com.sale.cellphone.dto.SearchDTO;
import com.sale.cellphone.entities.SanPham;
import com.sale.cellphone.repository.SearchRepository;

@Controller
public class SearchController {
	
	@Autowired
	private SearchRepository searchRepository;
	
	@PostMapping("/search")
	public String search(Model model, SearchDTO searchDTO, Pageable pageable) {
		
		System.out.println(searchDTO);
		System.out.println(pageable);
		Page<SanPham> page = searchRepository.findBySeachDTO(searchDTO, pageable);
		
		model.addAttribute("page", page);
		model.addAttribute("searchDTO", searchDTO);
		
		return "home/search :: search-frag";
	}
	
	
}
