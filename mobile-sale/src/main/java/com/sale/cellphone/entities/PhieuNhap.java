package com.sale.cellphone.entities;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import lombok.Data;

@Entity
@Data
public class PhieuNhap {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer idPhieuNhap;
	
	private Date ngayLap;
	
	@ManyToOne
	@JoinColumn(name="idNhanVien")
	private NhanVien nhanVien;
	
	@ManyToOne
	@JoinColumn(name="idNhaCungCap")
	private NhaCungCap nhaCungCap;
}
