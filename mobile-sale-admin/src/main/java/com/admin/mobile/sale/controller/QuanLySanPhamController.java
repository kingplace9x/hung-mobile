package com.admin.mobile.sale.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.context.request.WebRequest;
import com.admin.mobile.sale.dto.SearchDTO;
import com.admin.mobile.sale.entities.SanPham;
import com.admin.mobile.sale.form.FormSP;
import com.admin.mobile.sale.repository.HangRepository;
import com.admin.mobile.sale.repository.SanPhamRepository;
import com.admin.mobile.sale.repository.SearchRepository;
import com.admin.mobile.sale.service.SanPhamService;

@Controller
@PreAuthorize("principal.role eq T(com.admin.mobile.sale.enums.Role).ALL.toString() or principal.role eq T(com.admin.mobile.sale.enums.Role).MANAGER.toString()")
public class QuanLySanPhamController {
	
	@Autowired
	private SanPhamRepository sanPhamRepository;
	
	@Autowired
	private SearchRepository searchRepository;
	
	@Autowired
	private HangRepository hangRepository;
	
	@Autowired
	private SanPhamService sanPhamService;
	
	@GetMapping("/admin/quan-ly-san-pham")
	public String quanLySP(Model model, String grid, Pageable pageable) {
		if(grid!=null) {
			System.out.println("grid=" +grid);
			model.addAttribute("page", sanPhamRepository.findAll(PageRequest.of(pageable.getPageNumber(),15)));	
		} else {
			model.addAttribute("page", sanPhamRepository.findAll(PageRequest.of(pageable.getPageNumber(),10)));			
		}
		model.addAttribute("listHang", hangRepository.findAll());
		return "admin/quanlysanpham";
	}
	
	@GetMapping("/admin/quan-ly-san-pham/them")
	public String themSP(Model model) {
		model.addAttribute("isNew", true);
		model.addAttribute("listHang", hangRepository.findAll());
		model.addAttribute("sp", new FormSP());
		return "admin/editsp";
	}
	@PostMapping("/admin/quan-ly-san-pham/them")
	public String themSPSubmit(Model model, @Valid FormSP sp, BindingResult errors ) {
		if(errors.hasErrors()) {
			model.addAttribute("sp", sp);
			model.addAttribute("listHang", hangRepository.findAll());
			System.out.println(errors);
			model.addAttribute("isNew", true);
			return "admin/editsp";
		}
		sanPhamService.save(sp);
		return "redirect:/admin/quan-ly-san-pham";
	}
	@GetMapping("/admin/quan-ly-san-pham/edit/{idSanPham}")
	public String editSanPham(Model model, @PathVariable Integer idSanPham) {
		model.addAttribute("sp", sanPhamService.initForm(idSanPham));
		model.addAttribute("listHang", hangRepository.findAll());
		return "admin/editsp";
	}

	@PostMapping("/admin/quan-ly-san-pham/edit")
	public String editSanPhamPOST(Model model, @Valid FormSP sp, BindingResult errors) {
		if(errors.hasErrors()) {
			model.addAttribute("sp", sp);
			model.addAttribute("listHang", hangRepository.findAll());
			System.out.println(errors);
			return "admin/editsp";
		}
		sanPhamService.save(sp);
		return "redirect:/admin/quan-ly-san-pham";
	}
	
	@PostMapping("/admin/quan-ly-san-pham/xoa/{idSanPham}")
	public String delete(@PathVariable Integer idSanPham) {
		sanPhamRepository.deleteById(idSanPham);
		System.out.println("deleted " + idSanPham);
		return "redirect:/admin/quan-ly-san-pham";
	}
	
	@PostMapping("/admin/quan-ly-san-pham/search")
	public String timkiemsp(Model model, WebRequest req, SearchDTO searchDTO, Pageable pageable) {
		String grid = req.getParameter("grid");
		Page<SanPham> page = null;
		if("ok".equals(grid)) {
			page = searchRepository.findBySeachDTO(searchDTO, PageRequest.of(pageable.getPageNumber(), 15));
			System.out.println("okkkkkkkkkkkk");
		} else {
			page = searchRepository.findBySeachDTO(searchDTO, PageRequest.of(pageable.getPageNumber(), 10));
			
		}
		model.addAttribute("page", page);

		return "admin/quanlysanpham :: search-fragment";
	}
}
