package com.admin.mobile.sale.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.admin.mobile.sale.bean.LoginUserDetails;
import com.admin.mobile.sale.entities.NhanVien;
import com.admin.mobile.sale.repository.NhanVienRepository;

@Service
public class UserDetailsServiceImpl implements UserDetailsService{

	@Autowired
	private NhanVienRepository nhanVienRepository;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		NhanVien nv = nhanVienRepository.findByUsername(username);
		
		if(nv==null) {
			System.out.println("error");
			throw new UsernameNotFoundException("Not found!");
		}
		
		return new LoginUserDetails(nv);
	}

}
