package com.sale.cellphone.utils;

import java.util.List;

import org.thymeleaf.expression.Lists;

import com.sale.cellphone.entities.DanhGia;

public class DanhGiaUtils {
	public static float average(List<DanhGia> listDanhGia) {
		if(new Lists().isEmpty(listDanhGia))
			return 0;
		int sum = 0; 
		
		for(DanhGia danhGia: listDanhGia) {
			sum += danhGia.getVote();
		}
		return Math.round(100.0f*sum/listDanhGia.size())/100.0f;
	}
}
