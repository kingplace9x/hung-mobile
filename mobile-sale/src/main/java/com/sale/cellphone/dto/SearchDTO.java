package com.sale.cellphone.dto;

import lombok.Data;

@Data
public class SearchDTO {
	private String name;
	private Integer idHang;
	private Integer minPrice;
	private Integer maxPrice;
}
