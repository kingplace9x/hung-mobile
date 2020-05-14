package com.admin.mobile.sale.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.admin.mobile.sale.dto.DayChartDTO;
import com.admin.mobile.sale.dto.MonthChartDTO;
import com.admin.mobile.sale.dto.ProductChartDTO;
import com.admin.mobile.sale.dto.ViewDTO;
import com.admin.mobile.sale.service.ChartService;

@RestController
@RequestMapping("/chart")
public class ChartController {
	
	@Autowired
	private ChartService chartService;
	
	@GetMapping("/dayChart")
	public List<DayChartDTO> dayChart(Date from, Date to){
		return chartService.getDayChartDTOsBetween(from, to);
	}
	
	@GetMapping("/yearChart")
	public List<MonthChartDTO> yearChart(int year){
		return chartService.getMonthChartDTOsYear(year);
	}
	
	@GetMapping("/topProduct")
	public List<ProductChartDTO> topProduct(){
		return chartService.topProduct();
	}
	
	@GetMapping("/topHang")
	public List<ProductChartDTO> topHang(){
		return chartService.topHang();
	}
	
	@GetMapping("/topView")
	public List<ViewDTO> topView(){
		return chartService.topView();
	}
	
	@GetMapping("/viewRate")
	public List<ViewDTO> getView(Integer id) throws InterruptedException{
		Thread.sleep(200);
		return chartService.getView(id);
	}
	
	@GetMapping("/priceChange")
	public List<ViewDTO> priceChange(Integer id) throws InterruptedException{
		Thread.sleep(200);
		return chartService.getPriceChange(id);
	}
}
