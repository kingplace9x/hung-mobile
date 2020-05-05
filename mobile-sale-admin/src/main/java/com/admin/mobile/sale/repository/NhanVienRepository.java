package com.admin.mobile.sale.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.admin.mobile.sale.entities.NhanVien;

public interface NhanVienRepository extends JpaRepository<NhanVien, Integer>{

	NhanVien findByUsername(String username);

}
