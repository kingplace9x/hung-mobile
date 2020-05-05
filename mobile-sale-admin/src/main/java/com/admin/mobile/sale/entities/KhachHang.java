package com.admin.mobile.sale.entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class KhachHang {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer idKhachHang;
	
	@Column(columnDefinition = "nvarchar(55)")
	private String name;
	
	@Column(columnDefinition = "nvarchar(15)")
	private String phone;
	
	@Column(columnDefinition = "nvarchar(55)")
	private String address;
	
	@Column(columnDefinition = "nvarchar(55)")
	private String email;
	
	@OneToMany(mappedBy = "khachHang")
	private final List<HoiDap> listHoiDap = new ArrayList<>();
	
}
