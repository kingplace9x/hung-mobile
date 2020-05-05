package com.admin.mobile.sale.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.admin.mobile.sale.repository.NhanVienRepository;

import com.admin.mobile.sale.bean.LoginUserDetails;
import com.admin.mobile.sale.entities.NhanVien;

@Service
public class AccountService {
	
	@Autowired
	private NhanVienRepository nhanVienRepository;
	PasswordEncoder encoder = new BCryptPasswordEncoder();
	
	public void changePassword(String newPass) {
		LoginUserDetails loginUser = (LoginUserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String encodedPassword = encoder.encode(newPass);
		loginUser.getNhanVien().setPassword(encodedPassword);
		nhanVienRepository.save(loginUser.getNhanVien());
	}

	public Page<NhanVien> findAll(Pageable pageable) {
		return nhanVienRepository.findAll(pageable);
	}

	public boolean delete(Integer accountId) {
		LoginUserDetails loginUser = (LoginUserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (accountId == loginUser.getNhanVien().getIdNhanVien()) {
			return false;
		}
		NhanVien nv = nhanVienRepository.findById(accountId).orElse(null);
		if(nv==null) return false;
		
		nv.setStatus(false);
		nhanVienRepository.save(nv);
		
		return true;
	}

	public NhanVien findById(Integer accountId) {
		return nhanVienRepository.findById(accountId).orElse(null);
	}

	public boolean save(NhanVien nhanVien) {
		
		NhanVien nv = nhanVienRepository.findByUsername(nhanVien.getUsername());
		if(nhanVien.getIdNhanVien()==null) {
			if(nv!=null) return false;
			nhanVien.setPassword(encoder.encode("123"));
			nhanVien.setStatus(true);
			nhanVienRepository.save(nhanVien);
		}else {
			nv.setFullName(nhanVien.getFullName());
			nv.setImage(nhanVien.getImage());
			nv.setPhone(nhanVien.getPhone());
			nv.setRole(nhanVien.getRole());
			nhanVienRepository.save(nv);
		}
		
		return true;
	}
}
