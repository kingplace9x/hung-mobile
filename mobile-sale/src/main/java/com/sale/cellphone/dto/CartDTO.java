package com.sale.cellphone.dto;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CartDTO {
	private Integer idSanPham;
	private String tenSanPham;
	private Integer giaSanPham;
	private Integer soLuong;
	private String image;
	
	public static long tinhTongTien(List<CartDTO> listCart) {
		
		long tong = 0;
		for(CartDTO dto : listCart) {
			tong += dto.getGiaSanPham()*dto.getSoLuong();
		}
		
		return tong;
	}
}
