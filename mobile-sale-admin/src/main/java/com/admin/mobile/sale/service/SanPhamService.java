package com.admin.mobile.sale.service;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.admin.mobile.sale.entities.SanPham;
import com.admin.mobile.sale.enums.SanPhamType;
import com.admin.mobile.sale.form.FormSP;
import com.admin.mobile.sale.repository.SanPhamRepository;

@Service
public class SanPhamService {
	
	@Autowired
	private SanPhamRepository sanPhamRepository;
	
	@Autowired
	private ImageService imageService;
	
	public FormSP initForm(Integer idSp) {
		SanPham sp = sanPhamRepository.findById(idSp).orElse(null);
		if(sp!=null) {
			return FormSP.builder().boNhoTrong(sp.getBoNhoTrong())
					.camera(sp.getCamera())
					.congNgheManHinh(sp.getCongNgheManHinh())
					.CPU(sp.getCPU())
					.descripsion(sp.getDescripsion())
					.doPhanGiaiManHinh(sp.getDoPhanGiaiManHinh())
					.idHang(sp.getIdHang())
					.idSanPham(sp.getIdSanPham())
					.kichThuocManHinh(sp.getKichThuocManHinh())
					.manHinh(sp.getManHinh())
					.name(sp.getName())
					.pin(sp.getPin())
					.price(sp.getPrice())
					.sim(sp.getSim())
					.imageUrl(sp.getImage())
					.soLuong(sp.getSoLuong())
					.boNhoTrong(sp.getBoNhoTrong())
					.build();
		}
		return null;
	}
	
	@Transactional
	public void save(FormSP form) {
		SanPham sp = sanPhamRepository.findById(form.getIdSanPham()!=null?form.getIdSanPham():0).orElse(new SanPham());
		sp.setIdSanPham(form.getIdSanPham());
		sp.setIdHang(form.getIdHang());
		sp.setPrice(form.getPrice());
		sp.setDescripsion(form.getDescripsion());
		sp.setName(form.getName());
		sp.setType(SanPhamType.DIENTHOAI);
		if(form.getImage()!=null && form.getImage().getSize()>0) {
			try {
				imageService.save(form.getImage().getOriginalFilename(), form.getImage().getBytes());
				sp.setImage(form.getImage().getOriginalFilename());
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		sanPhamRepository.save(sp);
	}
}
