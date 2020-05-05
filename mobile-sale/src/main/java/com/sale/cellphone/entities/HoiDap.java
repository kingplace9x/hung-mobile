package com.sale.cellphone.entities;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Entity
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class HoiDap {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer idHoiDap;
	
	@ManyToOne
	@JoinColumn(name = "idKhachHang")
	private KhachHang khachHang;
	
	@ManyToOne
	@JoinColumn(name = "idNhanVien")
	private NhanVien nhanVien;
	
	@ManyToOne
	@JoinColumn(name = "idSanPham")
	private SanPham sanPham;
	
	@Column(columnDefinition = "nvarchar(512)")
	private String noiDung;
	
	@Column(columnDefinition = "nvarchar(512)")
	private String reply;
	
	@Column(columnDefinition = "datetime")
	private Date createAt;
}
