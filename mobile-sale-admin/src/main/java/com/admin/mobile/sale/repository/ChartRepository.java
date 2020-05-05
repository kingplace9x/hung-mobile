package com.admin.mobile.sale.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import com.admin.mobile.sale.dto.DayChartDTO;
import com.admin.mobile.sale.dto.MonthChartDTO;
import com.admin.mobile.sale.dto.ProductChartDTO;
import com.admin.mobile.sale.dto.ViewDTO;
import com.admin.mobile.sale.entities.HoaDon;


public interface ChartRepository extends CrudRepository<HoaDon, Integer> {
	
	@Query("select new com.admin.mobile.sale.dto.DayChartDTO(sum(ct.giaSanPham*ct.soLuong),"
			+ "sum(ct.soLuong),date(hd.ngayLap))"
			+ " from HoaDon hd inner join ChiTietHoaDon ct"
			+ " on hd = ct.hoaDon "
			+ " where hd.ngayLap between ?1 and ?2 "
			+ " and hd.status = com.admin.mobile.sale.enums.StatusOrder.HoanThanh"
			+ " group by date(hd.ngayLap)"
			+ " order by hd.ngayLap")
	List<DayChartDTO> getDayChartDTOsBetween(Date from, Date to);
	
	@Query("select new com.admin.mobile.sale.dto.MonthChartDTO(sum(ct.giaSanPham*ct.soLuong),"
			+ "sum(ct.soLuong),month(hd.ngayLap),year(hd.ngayLap))"
			+ " from HoaDon hd inner join ChiTietHoaDon ct"
			+ " on hd = ct.hoaDon "
			+ " where hd.ngayLap between ?1 and ?2"
			+ " and hd.status = com.admin.mobile.sale.enums.StatusOrder.HoanThanh"
			+ " group by year(hd.ngayLap), month(hd.ngayLap)"
			+ " order by hd.ngayLap")
	List<MonthChartDTO> getMonthChartDTOsBetween(Date from, Date to);
	
	@Query("select new com.admin.mobile.sale.dto.ProductChartDTO(sp.name, sum(ct.soLuong * ct.giaSanPham),sum(ct.soLuong))"
			+ " from ChiTietHoaDon ct inner join SanPham sp on ct.sanPham = sp"
			+ " inner join HoaDon hd on hd = ct.hoaDon"
			+ " where hd.status = com.admin.mobile.sale.enums.StatusOrder.HoanThanh"
			+ " group by ct.sanPham " + 
			" order by sum(ct.soLuong) desc")
	Page<ProductChartDTO> topProduct(Pageable pageable);
	
	@Query("select new com.admin.mobile.sale.dto.ProductChartDTO(h.name, sum(ct.soLuong * ct.giaSanPham),sum(ct.soLuong))"
			+ " from ChiTietHoaDon ct inner join SanPham sp on ct.sanPham = sp"
			+ " inner join HoaDon hd on hd = ct.hoaDon inner join Hang h on h.idHang = sp.idHang"
			+ " where hd.status = com.admin.mobile.sale.enums.StatusOrder.HoanThanh"
			+ " group by h.name " + 
			" order by sum(ct.soLuong) desc")
	Page<ProductChartDTO> topHang(Pageable pageable);

	@Query("select new com.admin.mobile.sale.dto.ViewDTO(sp.name,sp.view) "
			+ " from SanPham sp "
			+ " order by sp.view desc")
	Page<ViewDTO> topView(Pageable pageable);
}
