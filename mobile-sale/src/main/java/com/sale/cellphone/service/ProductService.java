package com.sale.cellphone.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sale.cellphone.dto.DanhGiaDTO;
import com.sale.cellphone.entities.DanhGia;
import com.sale.cellphone.entities.KhachHang;
import com.sale.cellphone.entities.SanPham;
import com.sale.cellphone.repository.DanhGiaRepository;
import com.sale.cellphone.repository.KhachHangRepository;
import com.sale.cellphone.repository.SanPhamRepository;

@Service
public class ProductService {

	@Autowired
	private DanhGiaRepository danhGiaRepository;
	
	@Autowired
	private KhachHangRepository khachHangRepository;
	
	@Autowired
	private SanPhamRepository sanPhamRepository;
	
	@Transactional
	public void saveRating(DanhGiaDTO danhGiaDTO) {
		KhachHang khachHang = khachHangRepository.findByEmail(danhGiaDTO.getEmail());
		SanPham sanPham = sanPhamRepository.getOne(danhGiaDTO.getIdSanPham());
		DanhGia danhGia = danhGiaRepository.findFirstByKhachHang(khachHang);
		if(danhGia==null) danhGia = new DanhGia();
		danhGia.setVote(danhGiaDTO.getVote());
		danhGia.setComment(danhGiaDTO.getComment());
		danhGia.setKhachHang(khachHang);
		danhGia.setSanPham(sanPham);
		danhGiaRepository.save(danhGia);		
	}

	public void upView(Integer productId) {
		SanPham sp = sanPhamRepository.getOne(productId);
		sp.setView(sp.getView()+1);
		sanPhamRepository.save(sp);
	}

}
