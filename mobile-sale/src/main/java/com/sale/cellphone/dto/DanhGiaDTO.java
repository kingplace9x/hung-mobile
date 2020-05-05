package com.sale.cellphone.dto;

import lombok.Data;

@Data
public class DanhGiaDTO {
	private Integer idSanPham;
	private Integer vote;
	private String comment;
	private String email;
}
