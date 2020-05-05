package com.sale.cellphone.enums;

import lombok.Getter;

@Getter
public enum StatusOrder {
	DangXacNhan("Đang xác nhận", "badge-danger"),
	DangGiaoHang("Đang giao hàng", "badge-warning"),
	HoanThanh("Hoàn thành", "badge-success"),
	DaHuy("Đã hủy", "badge-danger");

	private final String label;
	private final String badge;
	
	StatusOrder(String string, String string2) {
		label = string;
		badge = string2;
	}

}
