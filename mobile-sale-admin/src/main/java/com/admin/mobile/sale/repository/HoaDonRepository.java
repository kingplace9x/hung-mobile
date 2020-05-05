package com.admin.mobile.sale.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.admin.mobile.sale.entities.HoaDon;
import com.admin.mobile.sale.enums.StatusOrder;

public interface HoaDonRepository extends JpaRepository<HoaDon, Integer>{
	
	List<HoaDon> findByKhachHangEmailOrKhachHangPhone(String email, String phone);

	Page<HoaDon> findAllByKhachHangNameLikeOrKhachHangEmailLike(String name, String email, Pageable pageable);

	Page<HoaDon> findAllByStatus(StatusOrder status, Pageable pageable);

	Page<HoaDon> findAllByKhachHangNameLikeOrKhachHangEmailLikeOrKhachHangPhoneLike(String string, String string2,
			String string3, Pageable pageable);

	@Query("SELECT COUNT(HD.idHoaDon) FROM HoaDon HD WHERE HD.status = com.admin.mobile.sale.enums.StatusOrder.HoanThanh")
	Long countSucess();

	@Query("SELECT COUNT(HD.idHoaDon) FROM HoaDon HD WHERE HD.status IN (com.admin.mobile.sale.enums.StatusOrder.DangXacNhan,"
			+ "com.admin.mobile.sale.enums.StatusOrder.DaXacNhan,com.admin.mobile.sale.enums.StatusOrder.DangGiaoHang)")
	Long countPending();
	
	@Query("FROM HoaDon HD WHERE HD.status = com.admin.mobile.sale.enums.StatusOrder.HoanThanh")
	List<HoaDon> findSuccess();
	
}
