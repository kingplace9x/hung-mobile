package com.admin.mobile.sale.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class ProductChartDTO {
	private String name;
	private Long totalMoney;
	private Long totalCount;
}
