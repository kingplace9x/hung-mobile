package com.admin.mobile.sale.entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Entity
@Table(name = "Hang")
@AllArgsConstructor
@NoArgsConstructor
public class Hang {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer idHang;
	
	@Column(columnDefinition = "nvarchar(55)")
	private String name;
	
	@Column(columnDefinition = "nvarchar(255) default '/image/hang/samsung.png'")
	private String image;
	
	@OneToMany(mappedBy = "idHang", fetch = FetchType.LAZY)
	private List<SanPham> listSanPham = new ArrayList<>();
	
	
}
