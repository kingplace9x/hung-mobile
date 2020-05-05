package com.admin.mobile.sale.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.admin.mobile.sale.bean.LoginUserDetails;
import com.admin.mobile.sale.repository.HoiDapRepository;

@ControllerAdvice
public class CommonController {
	
	@Autowired
	private HoiDapRepository hoiDapRepository;
	
	@ModelAttribute
	public void initLoginUser(Model model, @AuthenticationPrincipal LoginUserDetails loginuer) {
		if(loginuer!=null) {
			model.addAttribute("loginUser", loginuer.getNhanVien());
			model.addAttribute("pageHoiDap", hoiDapRepository.findAllNoReply(PageRequest.of(0, 3)));
		}
	}
}
