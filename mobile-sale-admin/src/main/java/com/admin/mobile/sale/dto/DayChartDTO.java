package com.admin.mobile.sale.dto;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class DayChartDTO extends ChartDTO {
	private Date day;
	public DayChartDTO(Long totalMoney, Long totalProduct, Date date) {
		this(date);
		this.totalMoney = totalMoney;
		this.totalProduct = totalProduct;
	}
	@Override
	public String toString() {
		SimpleDateFormat fmt = new SimpleDateFormat("dd-MM-YYYY");
		return "DayChartDTO [day=" + fmt.format(day) + ", totalMoney=" + totalMoney + ", totalProduct=" + totalProduct +"]";
	}

}
