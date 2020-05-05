package com.admin.mobile.sale.form;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.web.multipart.MultipartFile;

import com.admin.mobile.sale.validator.Image;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class FormSP {
	
	private Integer idSanPham;
	
	@NotNull
	private Integer idHang;
	
	@Size(min = 5, max = 255)
	private String name;

	@Image
	private MultipartFile image;
	
	private String imageUrl;
	
	@NotNull
	private Integer price;

	private String manHinh;

	private String camera;

	private String CPU;

	private String boNhoTrong;

	private String sim;

	private String congNgheManHinh;

	private String doPhanGiaiManHinh;

	@Size(min = 10, max = 500)
	private String descripsion;

	private Integer pin;

	private Integer soLuong;

	private Float kichThuocManHinh;

}
