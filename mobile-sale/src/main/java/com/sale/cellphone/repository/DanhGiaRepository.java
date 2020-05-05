package com.sale.cellphone.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.sale.cellphone.entities.DanhGia;
import com.sale.cellphone.entities.KhachHang;

public interface DanhGiaRepository extends JpaRepository<DanhGia, Integer>{

	DanhGia findFirstByKhachHang(KhachHang khachHang);

}
