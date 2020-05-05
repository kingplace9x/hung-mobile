package com.admin.mobile.sale.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.admin.mobile.sale.dto.InfoDTO;
import com.admin.mobile.sale.entities.ChiTietHoaDon;
import com.admin.mobile.sale.entities.HoaDon;
import com.admin.mobile.sale.repository.HoaDonRepository;
import com.admin.mobile.sale.repository.HoiDapRepository;
import com.admin.mobile.sale.repository.SanPhamRepository;

@Service
public class ThongKeService {
	
	@Autowired
	private SanPhamRepository sanPhamRepository;
	@Autowired
	private HoaDonRepository hoaDonRepository;
	
	@Autowired
	private HoiDapRepository hoiDapRepository;
	
	
	public InfoDTO thongKe() {
		InfoDTO dto = new InfoDTO();
		dto.setTotalProduct(sanPhamRepository.count());
		dto.setSuccessOrder(hoaDonRepository.countSucess());
		dto.setTotalOrder( hoaDonRepository.count());
		dto.setPendingOrder(hoaDonRepository.countPending());
		dto.setTotalQuestion(hoiDapRepository.countNoReply());
		List<HoaDon> listHoaDon = hoaDonRepository.findSuccess();
		
		if(listHoaDon==null || listHoaDon.isEmpty()) {
			dto.setTotalMoney(0L);
		} else {
			long tong = 0;
			for(HoaDon hd : listHoaDon) {
				for (ChiTietHoaDon chitiet : hd.getListChiTietHoaDon()) {
					tong += chitiet.getSoLuong() * chitiet.getGiaSanPham();
				}
			}
			dto.setTotalMoney(tong);
		}
		
		return dto;
	}
	
	
}
