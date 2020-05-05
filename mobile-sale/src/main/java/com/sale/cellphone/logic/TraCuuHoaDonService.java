package com.sale.cellphone.logic;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sale.cellphone.dto.CartDTO;
import com.sale.cellphone.dto.HoaDonDTO;
import com.sale.cellphone.entities.ChiTietHoaDon;
import com.sale.cellphone.entities.HoaDon;
import com.sale.cellphone.repository.HoaDonRepository;

@Service
public class TraCuuHoaDonService {
	
	@Autowired
	private HoaDonRepository hoaDonRepository;
	
	public List<HoaDonDTO> findHoaDonByUserEmailOrPhone(String email){
		List<HoaDon> listHoaDon = hoaDonRepository.findByKhachHangEmailOrKhachHangPhone(email,email);
		if(listHoaDon!=null)
			return listHoaDon.stream().map(hoaDon -> {
				
				List<ChiTietHoaDon> listChiTiet = hoaDon.getListChiTietHoaDon();
				int sl = 0;
				int total = 0;
				List<CartDTO> listCart = new ArrayList<>();
				
				for(ChiTietHoaDon ct : listChiTiet) {
					CartDTO cart = new CartDTO();
					sl+=ct.getSoLuong();
					total += ct.getSoLuong()*ct.getGiaSanPham();
					cart.setGiaSanPham(ct.getGiaSanPham());
					cart.setIdSanPham(ct.getSanPham().getIdSanPham());
					cart.setImage(ct.getSanPham().getImage());
					cart.setTenSanPham(ct.getSanPham().getName());
					cart.setSoLuong(ct.getSoLuong());
					listCart.add(cart);
				}
				
				HoaDonDTO dto = new HoaDonDTO();
				dto.setCount(sl);
				dto.setDate(hoaDon.getNgayLap());
				dto.setIdHoaDon(hoaDon.getIdHoaDon());
				dto.setTotal(total);
				dto.setListCart(listCart);
				dto.setStatus(hoaDon.getStatus());
				return dto;
			}).collect(Collectors.toList());
		return null;	
	}
}
