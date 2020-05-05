package com.admin.mobile.sale.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.admin.mobile.sale.entities.HoiDap;

public interface HoiDapRepository extends JpaRepository<HoiDap, Integer>{

	List<HoiDap> findAllBySanPhamIdSanPhamOrderByCreateAtDesc(Integer idSanPham);
	
	List<HoiDap> findAllByNhanVienIdNhanVienIsNullOrderByCreateAtDesc();
 
	@Query("SELECT COUNT(H.idHoiDap) FROM HoiDap H Where H.nhanVien is null")
	Long countNoReply();
	
	@Query("FROM HoiDap H Where H.nhanVien is null Order By H.createAt DESC")
	List<HoiDap> findAllNoReply();
	
	@Query("FROM HoiDap H Where H.nhanVien is null Order By H.createAt DESC")
	Page<HoiDap> findAllNoReply(Pageable pageable);
	
	@Query("FROM HoiDap H Where H.sanPham.idSanPham=?1 Order By H.createAt DESC")
	List<HoiDap> findByIdSanPham(Integer idSP, Sort pageable);
	
	@Query("FROM HoiDap H Where H.nhanVien is not null Order By H.createAt DESC")
	List<HoiDap> findAllReplied();
}
