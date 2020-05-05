package com.sale.cellphone.dto;

import java.util.Date;
import java.util.List;

import com.sale.cellphone.enums.StatusOrder;

import lombok.Data;

@Data
public class HoaDonDTO {
	private Integer idHoaDon;
	private List<CartDTO> listCart;
	private Integer total;
	private Date date;
	private int count;
	private StatusOrder status;
}
