package com.sale.cellphone.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sale.cellphone.dto.CartDTO;
import com.sale.cellphone.forms.UserForm;
import com.sale.cellphone.forms.validator.UserFormValidator;
import com.sale.cellphone.logic.DatHangService;

@Controller
public class DatHangController {
	
	@Autowired
	private UserFormValidator userFormValidator;
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private DatHangService datHangService;
	
	@SuppressWarnings("unchecked")
	@GetMapping("/dat-hang")
	public String datHang(Model model) {
		
		List<CartDTO> listCart = (List<CartDTO>) session.getAttribute("cart");
		
		UserForm userForm = (UserForm) session.getAttribute("userForm");
		
		if(listCart==null || listCart.isEmpty()) {
			return "redirect:/";
		}
		if(userForm==null) {
			model.addAttribute("userForm", new UserForm());
		}else{
			model.addAttribute("userForm", userForm);
		}
		
		return "home/dathang";
	}
	
	@RequestMapping(value = "/dat-hang",method=RequestMethod.POST)
	public String register(Model model,UserForm userform, BindingResult rs) {
		userFormValidator.validate(userform, rs);
		if(rs.hasErrors()) {
			model.addAttribute(userform);
			return "home/dathang";
		}
		datHangService.saveNewKhachHang(userform);
		session.setAttribute("userForm",userform);
		return "redirect:/xac-nhan-dat-hang";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/xac-nhan-dat-hang",method=RequestMethod.GET)
	public String xacNhan(Model model) {
		
		List<CartDTO> listCart = (List<CartDTO>) session.getAttribute("cart");
		UserForm userForm = (UserForm) session.getAttribute("userForm");
		
		if(listCart==null || listCart.isEmpty()) {
			return "redirect:/";
		}
		if(userForm==null) {
			return "redirect:/dat-hang";
		}else{
			model.addAttribute("userForm", userForm);
			model.addAttribute("listCart", listCart);
		}
		return "home/xacnhandathang";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/xac-nhan-dat-hang",method=RequestMethod.POST)
	public String xacNhanDatHang(Model model) {
		
		List<CartDTO> listCart = (List<CartDTO>) session.getAttribute("cart");
		UserForm userForm = (UserForm) session.getAttribute("userForm");
		
		if(listCart==null || listCart.isEmpty()) {
			return "redirect:/";
		}
		if(userForm==null) {
			return "redirect:/dat-hang";
		}else{
			datHangService.saveDonHang(listCart,userForm);
			model.addAttribute("userForm", userForm);
			model.addAttribute("listCart", listCart);
			model.addAttribute("OK", true);
			session.setAttribute("cart", null);
		}
		return "home/xacnhandathang";
	}
}
