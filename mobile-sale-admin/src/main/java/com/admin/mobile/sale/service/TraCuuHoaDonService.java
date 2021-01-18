package com.admin.mobile.sale.service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.admin.mobile.sale.dto.CartDTO;
import com.admin.mobile.sale.dto.HoaDonDTO;
import com.admin.mobile.sale.entities.ChiTietHoaDon;
import com.admin.mobile.sale.entities.HoaDon;
import com.admin.mobile.sale.enums.StatusOrder;
import com.admin.mobile.sale.repository.HoaDonRepository;


@Service
public class TraCuuHoaDonService {
	
	@Autowired
	private HoaDonRepository hoaDonRepository;
	
	public List<HoaDonDTO> findHoaDonByUserEmailOrPhone(String email){
		return initList(hoaDonRepository.findByKhachHangEmailOrKhachHangPhone(email,email));
	}
	
	public List<HoaDonDTO> getAll(){
		return initList(hoaDonRepository.findAll());
	}
	
	public Page<HoaDonDTO> getAll(Pageable pageable){
		Page<HoaDon> page = hoaDonRepository.findAll(pageable);
		List<HoaDonDTO> list = initList(page.getContent());
		return new PageImpl<>(list, pageable, page.getTotalElements());
	}
	
	private List<HoaDonDTO> initList(List<HoaDon> listHoaDon){
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
				dto.setNguoiDat(hoaDon.getKhachHang().getName());
				dto.setDiaChi(hoaDon.getKhachHang().getAddress());
				dto.setPhone(hoaDon.getKhachHang().getPhone());
				return dto;
			}).collect(Collectors.toList());
		return null;
	}


	public Page<HoaDonDTO> getByStatusOrName(String name, String status, Pageable pageable) {
		Page<HoaDon> page = null;
		if(name != null) {
			page = hoaDonRepository.findAllByKhachHangNameLikeOrKhachHangEmailLikeOrKhachHangPhoneLike("%" + name + "%", "%" + name + "%","%" + name + "%", pageable);
		}else if(status.equals("0")) {
			page = hoaDonRepository.findAll(pageable);
		} else {
			page= hoaDonRepository.findAllByStatus(StatusOrder.valueOf(status), pageable);
		}
		List<HoaDonDTO> list = initList(page.getContent());
		return new PageImpl<>(list, pageable, page.getTotalElements());
	}
}
