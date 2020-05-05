package com.sale.cellphone.entities;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Table(uniqueConstraints={
    @UniqueConstraint(columnNames = {"idSanPham", "idHoaDon"})
})
public class ChiTietHoaDon {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer idChiTietHoaDon;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="idSanPham")
	private SanPham sanPham;
	
	@ManyToOne
	@JoinColumn(name="idHoaDon")
	private HoaDon hoaDon;
	
	private Integer giaSanPham;
	
	private Integer soLuong;
	
}