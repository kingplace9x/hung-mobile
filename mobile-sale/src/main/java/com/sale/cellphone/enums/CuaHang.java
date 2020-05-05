package com.sale.cellphone.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public enum CuaHang {
	ALL("Tất cả cửa hàng"),
	HN_TH("Số 50, Thái Hà, Đống Đa, Hà Nội"),
	HCM("Số 99, Nguyễn Thái Học, Quận 5, TP HCM");
	private String address;
}
