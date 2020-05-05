package com.admin.mobile.sale.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.admin.mobile.sale.entities.SanPham;

@Repository
public interface SanPhamRepository extends JpaRepository<SanPham, Integer>{
	
	@Query("select count(SP.idSanPham) from SanPham SP")
	Long countAll();

	Page<SanPham> findAllByIdHang(Integer idHang, Pageable pageable);
	
	
}
