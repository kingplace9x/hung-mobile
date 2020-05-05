package com.admin.mobile.sale.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.admin.mobile.sale.entities.HoaDon;
import com.admin.mobile.sale.enums.StatusOrder;
import com.admin.mobile.sale.repository.HoaDonRepository;
import com.admin.mobile.sale.service.TraCuuHoaDonService;

@Controller
@PreAuthorize("principal.role eq T(com.admin.mobile.sale.enums.Role).ALL.toString() or principal.role eq T(com.admin.mobile.sale.enums.Role).ORDER.toString()")
public class QuanLyDonHangController {

	@Autowired
	private TraCuuHoaDonService traCuuHoaDonService;
	@Autowired
	private HoaDonRepository hoaDonRepository;

	@GetMapping("/admin/don-hang")
	public String pageDonHang(Model model, String status, String name, Pageable pageable) {
		if (name != null) {
			model.addAttribute("page", traCuuHoaDonService.getByStatusOrName(name, status, PageRequest.of(pageable.getPageNumber(), 10,Sort.by("ngayLap").descending())));
		} else {
			model.addAttribute("page", traCuuHoaDonService.getAll(PageRequest.of(pageable.getPageNumber(), 10, Sort.by("ngayLap").descending())));

		}
		return "admin/quanlydonhang";
	}

	@PostMapping("/admin/don-hang/xac-nhan")
	public String xacNhanDonHang(StatusOrder status, Integer idDonHang) {
		HoaDon hd = hoaDonRepository.findById(idDonHang).orElse(null);
		if (hd != null || !status.equals(StatusOrder.DaHuy) || !status.equals(StatusOrder.HoanThanh)) {
			hd.setStatus(status);
			hoaDonRepository.save(hd);
		}
		return "redirect:/admin/don-hang";
	}

}
