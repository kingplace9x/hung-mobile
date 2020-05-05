package com.sale.cellphone.entities;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.sale.cellphone.enums.CuaHang;
import com.sale.cellphone.enums.SanPhamType;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@Table(name = "SanPham")
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class SanPham {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer idSanPham;
	
	private Integer idHang; 
	
	@Column(columnDefinition = "nvarchar(55)")
	private String name;
	
	@Column(columnDefinition = "nvarchar(55)")
	private String link;
	
	@Column(columnDefinition = "nvarchar(155)")
	private String image;
	
	private Integer price;
	
	@Column(columnDefinition = "nvarchar(100)")
	private String manHinh;
	
	@Column(columnDefinition = "nvarchar(100)")
	private String camera;
	
	@Column(columnDefinition = "nvarchar(100)")
	private String CPU;
	
	@Column(columnDefinition = "nvarchar(55)")
	private String boNhoTrong;
	
	@Column(columnDefinition = "nvarchar(55)")
	private String sim;
	
	@Column(columnDefinition = "nvarchar(55)")
	private String congNgheManHinh;
	
	@Column(columnDefinition = "nvarchar(55)")
	private String doPhanGiaiManHinh;
	
	@Column(columnDefinition = "nvarchar(500)")
	private String descripsion;
	
	private Integer pin;
	
	private Integer soLuong;
	
	private Float kichThuocManHinh;
	
	@ManyToOne
	@JoinColumn(name="idNhanVien")
	private NhanVien updateBy;
	
	private Date updatedAt;
	
	private Integer view;
	
	@Column(columnDefinition = "nvarchar(20)")
	@Enumerated(EnumType.ORDINAL)
	private CuaHang cuaHang;
	
	@OneToMany(mappedBy = "sanPham", cascade = CascadeType.ALL)
	private List<HoiDap> listHoiDap;

	@Column(columnDefinition = "nvarchar(15)")
	@Enumerated(EnumType.STRING)
	private SanPhamType type;
	
	@OneToMany(mappedBy = "sanPham")
	private final List<DanhGia> listDanhGia= new ArrayList<>();
	
}
