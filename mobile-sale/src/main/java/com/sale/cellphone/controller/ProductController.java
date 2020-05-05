package com.sale.cellphone.controller;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sale.cellphone.dto.DanhGiaDTO;
import com.sale.cellphone.entities.HoiDap;
import com.sale.cellphone.forms.UserForm;
import com.sale.cellphone.logic.DatHangService;
import com.sale.cellphone.repository.SanPhamRepository;
import com.sale.cellphone.service.HoiDapService;
import com.sale.cellphone.service.ProductService;

@Controller
public class ProductController {
	
	@Autowired
	private SanPhamRepository sanPhamRepository;
	
	@Autowired
	private HoiDapService hoiDapService;
	
	@Autowired
	private DatHangService datHangService;
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private ProductService productService;
	
	@GetMapping("/product")
	public String showProduct(Model model, @RequestParam("id") Integer productId) {
		
		productService.upView(productId);
		Long qty = sanPhamRepository.countAll();
	    int idx = (int)(Math.random() * (qty -10));
	    
	    List<HoiDap> listHoiDap = hoiDapService.findAllByIdSanpham(productId);
	    model.addAttribute("listHoiDap", listHoiDap);
		model.addAttribute("product", sanPhamRepository.findById(productId).orElse(null));
		model.addAttribute("listSp", sanPhamRepository.findAll(PageRequest.of(idx/10, 10)));
		return "home/detail";
	}
	
	@PostMapping("/userData")
	@ResponseBody
	public ResponseEntity<?> saveUser(UserForm data){
		datHangService.saveNewKhachHang(data);
		session.setAttribute("userForm", data);
		return ResponseEntity.ok("OK");
	}
	
	@PostMapping(value="/product/rating",
			consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE,
			produces = {MediaType.APPLICATION_ATOM_XML_VALUE, MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<?> rate(DanhGiaDTO danhGiaDTO){
		UserForm user = (UserForm) session.getAttribute("userForm");
		danhGiaDTO.setEmail(user.getEmail());
		productService.saveRating(danhGiaDTO);
		return ResponseEntity.ok("OK");
	}
}
