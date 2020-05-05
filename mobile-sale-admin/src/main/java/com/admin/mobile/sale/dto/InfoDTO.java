package com.admin.mobile.sale.dto;

import lombok.Data;

@Data
public class InfoDTO {
	private Long totalMoney;
	private Long totalProduct;
	private Long successOrder;
	private Long totalOrder;
	private Long pendingOrder;
	private Long totalQuestion;
}
