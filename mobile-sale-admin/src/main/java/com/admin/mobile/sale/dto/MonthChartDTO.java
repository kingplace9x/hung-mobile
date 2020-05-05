package com.admin.mobile.sale.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class MonthChartDTO extends ChartDTO{
	private int month;
	private int year;
	public MonthChartDTO(Long totalMoney, Long totalProduct, int month,int year) {
		this(month,year);
		this.totalMoney = totalMoney;
		this.totalProduct = totalProduct;
	}
	@Override
	public String toString() {
		return "MonthChartDTO [month=" + month + ", year=" + year +", totalMoney=" + totalMoney +", totalProduct=" + totalProduct + "]";
	}
	
	
}
