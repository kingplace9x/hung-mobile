package com.admin.mobile.sale.entities;

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
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Builder
public class DanhGia {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer idDanhGia;
	
	@Column(columnDefinition = "nvarchar(155)")
	private String comment;
	
	@Column(columnDefinition = "tinyint")
	private Integer vote;
	
	@ManyToOne
	@JoinColumn(name = "idSanPham")
	private SanPham sanPham;

	@ManyToOne
	@JoinColumn(name = "idKhachHang")
	private KhachHang khachHang;
}
