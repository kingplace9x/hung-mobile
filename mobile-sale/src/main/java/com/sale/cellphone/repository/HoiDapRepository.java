package com.sale.cellphone.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.sale.cellphone.entities.HoiDap;

public interface HoiDapRepository extends JpaRepository<HoiDap, Integer>{

	List<HoiDap> findAllBySanPhamIdSanPhamOrderByCreateAtDesc(Integer idSanPham);

}
