searchDTO = {};

$(function(){
	
	if(location.search.indexOf('grid')!=-1){
		searchDTO.grid = 'ok';
		$("#switchList").attr("href",'quan-ly-san-pham').html(`<i class="fas fa-list-ul"></i>`);
	} else {
		delete searchDTO.grid;
		$("#switchList").attr("href",'quan-ly-san-pham?grid').html(`<i class="fas fa-border-all"></i>`);
	}
	
	$("#formSearch").on("submit",function(event){
		event.preventDefault();
		search(searchDTO = deSerialize($(this).serialize()),0)
	}).on("change",function(){
		search(searchDTO = deSerialize($(this).serialize()),0)
	});
	$("#tensp").keyup(function(){
		searchDTO = deSerialize($(this).serialize());
		search(searchDTO,0)
	})
	$(document).on('click', '.pagination .previous', function(){
		if(!$(this).hasClass("disabled")){
			$(".pagination .active").prev().click();
			
		}
	})
	$(document).on('click', '.pagination .next', function(){
		if(!$(this).hasClass("disabled")){
			$(".pagination .active").next().click();
		}
	})
	topView();

})


function danhGia(idSP){
	$.get("/admin/danhgia/search/"+idSP).done(function(data){
		$("#modalDanhGia").modal().html(data);
	})
}

function search(searchDTO, page){
	if(location.search.indexOf('grid')!=-1){
		searchDTO.grid = 'ok';
	} else{
		delete searchDTO.grid;
	}
	$.post("/admin/quan-ly-san-pham/search",{page,...searchDTO}).done(function(data){
		$("#dataSP").html(data);
		initChart();
	})
}
function deSerialize(search){ if(search===""){ return{}} else return JSON.parse('{"' + search.replace(/\?/g,'').replace(/&/g, '","').replace(/=/g,'":"') + '"}', function(key, value) { return key===""?value:decodeURIComponent(value) })}

function topView(){
	$.get("/chart/topView",function(data){
		new Chart("topView",{
			  type: 'horizontalBar',
			  height:320,
			  data: {
			    labels: data.map(i=>i.name),
			    datasets: [
			    	{
			    		backgroundColor: "#36b9cc",
			    		data: data.map(i=>i.view),
			    		label:"Lượt xem",
			    		hoverBackgroundColor: "#e74a3b"
			    	}
			    ],
			  },
			  options: {
				    scales: {
				        yAxes: [{
				        	maxBarThickness: 80,
				        	barThickness: 25,
				        	barPercentage: 5.5,
				            categoryPercentage: 5.5,
				        }],
				    }
				}
			});
	})
}
