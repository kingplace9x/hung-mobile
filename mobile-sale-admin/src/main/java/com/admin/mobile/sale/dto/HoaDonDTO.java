package com.admin.mobile.sale.dto;

import java.util.Date;
import java.util.List;

import com.admin.mobile.sale.enums.StatusOrder;

import lombok.Data;

@Data
public class HoaDonDTO {
	private Integer idHoaDon;
	private List<CartDTO> listCart;
	private Integer total;
	private Date date;
	private int count;
	private StatusOrder status;
	private String nguoiDat;
	private String diaChi;
	private String phone;
}
