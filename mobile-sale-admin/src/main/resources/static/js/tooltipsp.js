$(function(){
	initChart();
})
var options = {
			legend: {
	            labels: {
	                fontColor: "black",
	                fontSize: 10
	            }
	        },
	        scales: {
	            yAxes: [{
	                ticks: {
	                    fontColor: "black",
	                },
	                gridLines: {
	                	color: "#777"
	                 },
	            }],
	            xAxes: [{
	                ticks: {
	                    fontColor: "black",
	                },
	                gridLines: {
	                	color: "#777"
	                 },
	            }]
	        }
		};

function initChart(){
	
	$('div.viewRate').tooltipster({
		animation: 'grow',
		theme: 'tooltipster-shadow',
		delay: 250,
		contentAsHTML: true,
		functionBefore: function(instance, helper) {
	        instance.content('Loading...');
	        var $origin = $(helper.origin);
	        var id = $origin.attr("data-id-sp");
	        if ($origin.data('loaded') !== true) {
	        	$.get('/chart/viewRate?id=' + id).done(function(data){
	        		instance.content(`<canvas width='200px' height='175px' id='chartView${id}'></canvas>`)
	        		new Chart("chartView" + id,{
	        			type: 'line',
	        			data:{
	        				labels: data.map(i=>i.name),
	        			    datasets: [
	        			    	{
	        			    		borderColor: "#ff4736",
	        			    		data: data.map(i=>i.view),
	        			    		label:"Lượt xem",
	        			    		backgroundColor: "#ff473620",
	        			    		lineTension: 0.2, 
	        			    	}]
	        			},
	        			options:options
	        		})
	        	})
	        }
	    }
	});
	
	$('h6.priceView').tooltipster({
		animation: 'grow',
		theme: 'tooltipster-shadow',
		delay: 250,
		contentAsHTML: true,
		functionBefore: function(instance, helper) {
	        instance.content('Loading...');
	        var $origin = $(helper.origin);
	        var id = $origin.attr("data-id-sp");
	        if ($origin.data('loaded') !== true) {
	        	$.get('/chart/priceChange?id=' + id).done(function(data){
	        		instance.content(`<canvas width='300px' height='250px' id='chartView${id}'></canvas>`)
	        		new Chart("chartView" + id,{
	        			type: 'line',
	        			data:{
	        				labels: data.map(i=>i.name),
	        			    datasets: [
	        			    	{
	        			    		borderColor: "#ff4736",
	        			    		data: data.map(i=>i.view),
	        			    		label:"Biến động giá 5 lần gần nhất",
	        			    		backgroundColor: "#ff473620",
	        			    		lineTension: 0.2
	        			    	}]
	        			},
	        			options:options
	        		})
	        	})
	        }
		}
	})
}