package com.admin.mobile.sale.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.admin.mobile.sale.entities.KhachHang;

public interface KhachHangRepository extends JpaRepository<KhachHang, Integer> {

	KhachHang findByEmail(String email);
	
}
