searchDTO = {};

$(function(){
	$("#formSearch").on("submit",function(event){
		event.preventDefault();
		search(searchDTO = deSerialize($(this).serialize()),0)
	}).on("change",function(){
		search(searchDTO = deSerialize($(this).serialize()),0)
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
	$.post("/admin/quan-ly-san-pham/search",{page,...searchDTO}).done(function(data){
		$("#dataSP").html(data);
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
				        	barThickness: 50,
				        	barPercentage: 5.5,
				            categoryPercentage: 5.5,
				        }],
				    }
				}
			});
	})
}
