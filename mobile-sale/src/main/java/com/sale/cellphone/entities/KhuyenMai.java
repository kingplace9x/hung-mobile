package com.sale.cellphone.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class KhuyenMai {
	
	@Id
	@GeneratedValue(strategy =GenerationType.IDENTITY)
	private Integer idKhuyenMai;
	
	@Column(columnDefinition = "nvarchar(255)")
	private String chiTiet;
	
	private Integer phanTram;
	
}
