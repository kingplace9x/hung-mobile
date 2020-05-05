package com.sale.cellphone.service;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sale.cellphone.entities.HoiDap;
import com.sale.cellphone.entities.KhachHang;
import com.sale.cellphone.entities.SanPham;
import com.sale.cellphone.forms.UserForm;
import com.sale.cellphone.logic.DatHangService;
import com.sale.cellphone.repository.HoiDapRepository;
import com.sale.cellphone.repository.SanPhamRepository;

@Service
public class HoiDapService {
	
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private SanPhamRepository sanPhamRepository;
	
	@Autowired
	private HoiDapRepository hoiDapRepository;
	
	@Autowired
	private DatHangService datHangService; 
	
	public boolean newQuestion(Integer idSanPham, String question) {
		UserForm userForm = (UserForm) session.getAttribute("userForm");
		SanPham sp = sanPhamRepository.findById(idSanPham).orElse(null);
		if(userForm==null||sp==null) return false;
		
		
		KhachHang kh = datHangService.saveNewKhachHang(userForm);
		
		HoiDap hoiDap = new HoiDap();
		
		hoiDap.setKhachHang(kh);
		hoiDap.setNoiDung(question);
		hoiDap.setCreateAt(new Date());
		hoiDap.setSanPham(sp);
		hoiDapRepository.save(hoiDap);
		
		return true;
	}

	public List<HoiDap> findAllByIdSanpham(Integer productId) {
		return hoiDapRepository.findAllBySanPhamIdSanPhamOrderByCreateAtDesc(productId);
	}

}
