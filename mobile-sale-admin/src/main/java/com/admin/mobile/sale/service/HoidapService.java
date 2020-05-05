package com.admin.mobile.sale.service;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.admin.mobile.sale.bean.LoginUserDetails;
import com.admin.mobile.sale.entities.HoiDap;
import com.admin.mobile.sale.entities.NhanVien;
import com.admin.mobile.sale.repository.HoiDapRepository;

@Service
public class HoidapService {

	@Autowired
	private HoiDapRepository hoiDapRepository;
	
	public void reply(Integer idQuestion, String question) {
		
		HoiDap hoiDap = hoiDapRepository.findById(idQuestion).orElse(null);
		if(hoiDap==null) return;
		
		LoginUserDetails loginUserDetails = (LoginUserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		NhanVien nv = loginUserDetails.getNhanVien();
		hoiDap.setReply(question);
		hoiDap.setCreateAt(new Date());
		hoiDap.setNhanVien(nv);
		hoiDapRepository.save(hoiDap);
		
	}

	public void delete(Integer idQuestion) {
		hoiDapRepository.deleteById(idQuestion);
		
	}
	
}
