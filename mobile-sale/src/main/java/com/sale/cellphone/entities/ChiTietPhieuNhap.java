package com.sale.cellphone.entities;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import lombok.Data;

@Entity
@Data
public class ChiTietPhieuNhap implements Serializable {

	private static final long serialVersionUID = 1260352544190813507L;

	@Id
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="idSanPham")
	private SanPham sanPham;
	
	@Id
	@ManyToOne
	@JoinColumn(name="idPhieuNhap")
	private PhieuNhap phieuNhap;
	
	private Integer giaSanPham;
	
	private Integer soLuong;
}
