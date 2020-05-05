package com.admin.mobile.sale.service;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.admin.mobile.sale.dto.DayChartDTO;
import com.admin.mobile.sale.dto.MonthChartDTO;
import com.admin.mobile.sale.dto.ProductChartDTO;
import com.admin.mobile.sale.dto.ViewDTO;
import com.admin.mobile.sale.repository.ChartRepository;
import com.admin.mobile.sale.utils.DateUtils;

@Service
public class ChartService {
	@Autowired
	private ChartRepository chartRepository;
	
	public List<DayChartDTO> getDayChartDTOsBetween(Date from, Date to){
		Calendar cal = Calendar.getInstance();
		cal.setTime(to);
		cal.add(Calendar.DATE, 1);
		List<DayChartDTO> list = chartRepository.getDayChartDTOsBetween(from, cal.getTime());
		cal.setTime(from);
		Date index = cal.getTime();
		while(!DateUtils.isSameDay(index, to)) {
			if(!contain(list,index)) {
				list.add(new DayChartDTO(0L,0L,index));				
			}
			cal.setTime(index);
			cal.add(Calendar.DATE, 1);
			index = DateUtils.getDateWithoutTimeUsingFormat(cal.getTime());
		}
		list.sort((dto1, dto2) -> dto1.getDay().compareTo(dto2.getDay()));
		return list;
	}

	private static boolean contain(List<DayChartDTO> list, Date index) {
		for(DayChartDTO dto : list) {
			if(DateUtils.isSameDay(index, dto.getDay()))
				return true;
		}
		return false;
	}

	public List<com.admin.mobile.sale.dto.MonthChartDTO> getMonthChartDTOsYear(int year) {
		Calendar cal = Calendar.getInstance();
		cal.set(year, 1, 1);
		Date from = DateUtils.getDateWithoutTimeUsingFormat(cal.getTime());
		cal.set(year+1, 1, 1);
		Date to = DateUtils.getDateWithoutTimeUsingFormat(cal.getTime());
		List<MonthChartDTO> list =  chartRepository.getMonthChartDTOsBetween(from, to);
		for(int i = 1; i <= 12; i++) {
			if(!containMounth(list,i,year)) {
				list.add(new MonthChartDTO(0L, 0L, i, year));
			}
		}
		list.sort((dto1, dto2) -> {
			return dto1.getMonth()-dto2.getMonth();
		});
		return list;
	}

	private boolean containMounth(List<MonthChartDTO> list, int month, int year) {
		for(MonthChartDTO dto : list) {
			if(dto.getMonth()==month && dto.getYear()==year)
				return true;
		}
		return false;
	}

	public List<ProductChartDTO> topProduct() {
		return chartRepository.topProduct(PageRequest.of(0, 10)).toList();
	}
	
	public List<ProductChartDTO> topHang() {
		return chartRepository.topHang(PageRequest.of(0, 10)).toList();
	}

	public List<ViewDTO> topView() {
		return chartRepository.topView(PageRequest.of(0, 10)).toList();
	}
}
