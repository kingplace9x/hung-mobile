package com.sale.cellphone.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sale.cellphone.dto.CartDTO;
import com.sale.cellphone.entities.SanPham;
import com.sale.cellphone.logic.CartService;
import com.sale.cellphone.repository.SanPhamRepository;

@Controller
public class ShopController {

	@Autowired
	private CartService cartService;
	
	@Autowired
	private SanPhamRepository sanPhamRepository;

	@GetMapping({ "/home/shop","/home","/" })
	public String shop(Model model, Pageable pageable) {
		Page<SanPham> page = sanPhamRepository.findAll(PageRequest.of(pageable.getPageNumber(), 20, pageable.getSort()));
		model.addAttribute("page", page);
		return "home/home";
	}
	
	@PostMapping("/home/shop/addCart")
	public @ResponseBody ResponseEntity<List<CartDTO>> addCart(Integer productId){
		return ResponseEntity.ok(cartService.addCart(productId));
	}
	@PostMapping("/home/shop/removeCart")
	public @ResponseBody ResponseEntity<List<CartDTO>> removeCart(Integer productId){
		return ResponseEntity.ok(cartService.removeCart(productId));
	}
	@PostMapping("/home/shop/getCart")
	public @ResponseBody ResponseEntity<List<CartDTO>> getCart(){
		return ResponseEntity.ok(cartService.getCart());
	}
}
