package com.sale.cellphone.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.sale.cellphone.entities.KhachHang;

public interface KhachHangRepository extends JpaRepository<KhachHang, Integer> {

	KhachHang findByEmail(String email);
	
}
