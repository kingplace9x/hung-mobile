package com.sale.cellphone.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.sale.cellphone.entities.Hang;
import com.sale.cellphone.repository.HangRepository;

@ControllerAdvice
public class CommonController {

	@Autowired
	private HangRepository hangRepository;

	@ModelAttribute
	public void setHeader(Model model) {
		List<Hang> listHang = hangRepository.findAll();
		model.addAttribute("listHang", listHang);
	}
}
