package com.sale.cellphone.logic;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sale.cellphone.dto.CartDTO;
import com.sale.cellphone.entities.ChiTietHoaDon;
import com.sale.cellphone.entities.HoaDon;
import com.sale.cellphone.entities.KhachHang;
import com.sale.cellphone.entities.SanPham;
import com.sale.cellphone.enums.StatusOrder;
import com.sale.cellphone.forms.UserForm;
import com.sale.cellphone.repository.ChiTietHoaDonRepository;
import com.sale.cellphone.repository.HoaDonRepository;
import com.sale.cellphone.repository.KhachHangRepository;
import com.sale.cellphone.repository.SanPhamRepository;

@Service
public class DatHangService {
	
	@Autowired
	private KhachHangRepository khachHangRepository;
	
	@Autowired
	private HoaDonRepository hoaDonRepository;
	
	@Autowired
	private SanPhamRepository sanPhamRepository;
	
	@Autowired
	private ChiTietHoaDonRepository chiTietHoaDonRepository;
	
	
	public KhachHang saveNewKhachHang(UserForm userForm) {
		KhachHang kh = khachHangRepository.findByEmail(userForm.getEmail());
		if(kh==null) {
			kh = KhachHang.builder()
					.address(userForm.getAdrress())
					.email(userForm.getEmail())
					.name(userForm.getName())
					.phone(userForm.getPhone())
					.build();
		} else {
			kh.setEmail(userForm.getEmail());
			kh.setAddress(userForm.getAdrress());
			kh.setPhone(userForm.getPhone());
			kh.setName(userForm.getName());
		}
		
		khachHangRepository.save(kh);
		
		return kh;
	}

	public void saveDonHang(List<CartDTO> listCart, UserForm userForm) {
		KhachHang kh = khachHangRepository.findByEmail(userForm.getEmail());
		
		HoaDon hd = new HoaDon();
		hd.setKhachHang(kh);
		hd.setNgayLap(new Date());
		hd.setStatus(StatusOrder.DangXacNhan);
		hoaDonRepository.save(hd);
		
		listCart.forEach(dto->{
			SanPham sp = sanPhamRepository.findById(dto.getIdSanPham()).orElse(null); 
			ChiTietHoaDon chiTiet = new ChiTietHoaDon();
			chiTiet.setGiaSanPham(dto.getGiaSanPham());
			chiTiet.setSoLuong(dto.getSoLuong());
			chiTiet.setHoaDon(hd);
			chiTiet.setSanPham(sp);
			chiTietHoaDonRepository.save(chiTiet);
		});
		
	}
}
