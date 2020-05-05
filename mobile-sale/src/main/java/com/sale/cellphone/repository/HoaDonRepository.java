package com.sale.cellphone.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.sale.cellphone.entities.HoaDon;

public interface HoaDonRepository extends JpaRepository<HoaDon, Integer>{
	
	List<HoaDon> findByKhachHangEmailOrKhachHangPhone(String email, String phone);
	
}
