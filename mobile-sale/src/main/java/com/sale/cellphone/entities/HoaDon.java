package com.sale.cellphone.entities;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import com.sale.cellphone.enums.StatusOrder;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class HoaDon {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer idHoaDon;
	
	@Column(columnDefinition = "nvarchar(20)")
	@Enumerated(EnumType.STRING)
	private StatusOrder status;
	
	private Date ngayLap;
	
	@ManyToOne
	@JoinColumn(name="idKhachHang")
	private KhachHang khachHang;
	
	@ManyToOne
	@JoinColumn(name="idNhanVien")
	private NhanVien nhanVien;
	
	@OneToMany(mappedBy = "hoaDon", fetch = FetchType.EAGER, cascade = CascadeType.ALL,orphanRemoval = true)
	private List<ChiTietHoaDon> listChiTietHoaDon;
	
}
