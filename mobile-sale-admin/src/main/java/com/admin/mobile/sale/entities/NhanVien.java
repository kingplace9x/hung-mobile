package com.admin.mobile.sale.entities;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import com.admin.mobile.sale.enums.Role;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class NhanVien {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer idNhanVien;
	
	@Column(columnDefinition = "nvarchar(55)")
	private String fullName;
	
	@Column(columnDefinition = "nvarchar(15)")
	private String phone;
	
	@Column(columnDefinition = "nvarchar(55)")
	private String username;
	
	@Column(columnDefinition = "nvarchar(70)")
	private String password;
	
	@Column(columnDefinition = "nvarchar(255)")
	private String image;
	
	@Enumerated(EnumType.STRING)
	private Role role;
	
	private boolean status;
	
	@ToString.Exclude
	@OneToMany(mappedBy = "nhanVien")
	private List<HoaDon> listHoaDon;
	
	@ToString.Exclude
	@OneToMany(mappedBy = "nhanVien")
	private List<HoiDap> listHoiDap;
	
	@ToString.Exclude
	@OneToMany(mappedBy = "nhanVien")
	private List<PhieuNhap> listPhieuNhap;
}
