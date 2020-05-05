package com.admin.mobile.sale.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class NhaCungCap {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer idNhaCungCap;
	
	@Column(columnDefinition = "nvarchar(55)")
	private String name;
	
	@Column(columnDefinition = "nvarchar(55)")
	private String address;
	
	@Column(columnDefinition = "nvarchar(55)")
	private String email;
	
	@Column(columnDefinition = "nvarchar(15)")
	private String phone;
}
