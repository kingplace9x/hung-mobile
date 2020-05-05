$(function(){
	var date = new Date();
	$("#filterBy").html(`<option value="${date.getMonth()+1}-${date.getFullYear()}">Tháng này</option>`);
	for(var i = 0; i < 15; i++){
		$("#filterBy").append(`<option value="${date.getMonth()}-${date.getFullYear()}">Tháng ${date.getMonth()}/${date.getFullYear()}</option>`);
		date.setMonth(date.getMonth()-1);
	}
	$("#filter").change(function(){
		$("#filterBy").html('');
		if($(this).val()==="year"){
			$("#label1").text("Chọn năm")
			date = new Date();
			$("#filterBy").html(`<option value="${date.getFullYear()}">Năm nay</option>`);
			for(var i = date.getFullYear()-1; i > date.getFullYear()-20; i--){
				$("#filterBy").append(`<option value="${i}">${i}</option>`)
			}
		}else if($(this).val()==="month"){
			$("#label1").text("Chọn tháng")
			date = new Date();
			$("#filterBy").html(`<option value="${date.getMonth()+1}-${date.getFullYear()}">Tháng này</option>`);
			for(var i = 0; i < 15; i++){
				$("#filterBy").append(`<option value="${date.getMonth()}-${date.getFullYear()}">Tháng ${date.getMonth()}/${date.getFullYear()}</option>`);
				date.setMonth(date.getMonth()-1);
			}
		}
	})
	
	$("#btn-filter").click(function(){
		let val = $("#filterBy").val();
		let dt;
		if((dt=val.split("-")).length===1){//fill by year
			getYear(val);
		}else{
			getMonth(dt[0],dt[1]);
		}
	}).click();
})

let options = {
		responsive: true,
		hoverMode: 'index',
		stacked: false,
		title: {
			display: true,
		},
		scales: {
			yAxes: [{
				 min:0,
				type: 'linear', // only linear but allow scale type registration. This allows extensions to exist solely for log scale for instance
				display: true,
				position: 'left',
				id: 'y-axis-1',
				 ticks: {
		                suggestedMin: 0,    // minimum will be 0, unless there is a lower value.
		                // OR //
		                beginAtZero: true   // minimum value will be 0.
		            }
			}, {
				type: 'linear', // only linear but allow scale type registration. This allows extensions to exist solely for log scale for instance
				display: true,
				position: 'right',
				id: 'y-axis-2',
				 ticks: {
		                suggestedMin: 0,    // minimum will be 0, unless there is a lower value.
		                // OR //
		                beginAtZero: true   // minimum value will be 0.
		            },
				// grid line settings
				gridLines: {
					drawOnChartArea: false, // only want the grid lines for one axis to show up
				},
			}],
		}
	}

let xOptions = {
	responsive: true,
	hoverMode: 'index',
	stacked: false,
	title: {
		display: true,
	},
	scales: {
		xAxes: [{
			 min:0,
			type: 'linear', // only linear but allow scale type registration. This allows extensions to exist solely for log scale for instance
			display: true,
			position: 'bottom',
			id: 'x-axis-1',
			 ticks: {
	                suggestedMin: 0,    // minimum will be 0, unless there is a lower value.
	                // OR //
	                beginAtZero: true   // minimum value will be 0.
	            }
		}, {
			type: 'linear', // only linear but allow scale type registration. This allows extensions to exist solely for log scale for instance
			display: true,
			position: 'top',
			id: 'x-axis-2',
			 ticks: {
	                suggestedMin: 0,    // minimum will be 0, unless there is a lower value.
	                // OR //
	                beginAtZero: true   // minimum value will be 0.
	            },
			// grid line settings
			gridLines: {
				drawOnChartArea: false, // only want the grid lines for one axis to show up
			},
		}],
	}
}
function getYear(year){
	$("#cvsMonth").hide();
	$("#cvsYear").show();
	$.get("/chart/yearChart?year=" + year).done(function(data){
		$("#totalMoney").text(sum(...data.map(i=>i.totalMoney))+ " VNĐ")
		$("#totalProduct").text(sum(...data.map(i=>i.totalProduct))+ " sản phẩm")
		new Chart("cvsYear",{
			  type: 'bar',
			  data: {
			    labels: data.map(i=>i.month + "/" + i.year),
			    datasets: [{
			    	fill:false,
			      label: "Tống doanh thu",
			      borderColor: "#F7362D",
			      data: data.map(i=>i.totalMoney),
			      yAxisID: 'y-axis-1',
			      type:'line'
			    },
			    {
			      label: "Tống sản phẩm bán được",
			      backgroundColor: "#4e73df",
			      data: data.map(i=>i.totalProduct),
			      yAxisID: 'y-axis-2',
			     
			      fill:false,
			    }],
			  },
			  options: options
			});
	})
}
function getMonth(month,year){
	$("#cvsMonth").show();
	$("#cvsYear").hide();
	var from = new Date(year+"-"+month);
	var to = new Date(year+"-"+month);
	to.setMonth(to.getMonth()+1);
	$.get("/chart/dayChart?from=" + from.toDateString() + "&to=" +  to.toDateString())
	.done(function(data){
		$("#totalMoney").text(sum(...data.map(i=>i.totalMoney))+ " VNĐ")
		$("#totalProduct").text(sum(...data.map(i=>i.totalProduct))+ " sản phẩm")
		new Chart("cvsMonth",{
			  type: 'bar',
			  data: {
			    labels: data.map(i=>new Date(i.day).toLocaleDateString()),
			    datasets: [{
			    	fill:false,
			      label: "Tống doanh thu",
			      borderColor: "#F7362D",
			      data: data.map(i=>i.totalMoney),
			      yAxisID: 'y-axis-1',
			      type:'line'
			    },
			    {
			      label: "Tống sản phẩm bán được",
			      backgroundColor: "#4e73df",
			      data: data.map(i=>i.totalProduct),
			      yAxisID: 'y-axis-2',
			      fill:false,
			    }],
			  },
			  options: options
			});
	});
}

function sum(...args){
	let total = 0;
	for(var i = 0; i < args.length; i++){
		total += Number(args[i]);
	}
	return total;
}

$(function(){
	$(function(){
		reanderTopProduct();
		$("#renderChart").change(function(){
			if(this.value==='top-sp'){
				reanderTopProduct();
			} else if(this.value==='top-hang'){
				reanderTopHang();
			}
		})
	})
})
var topChart;
function reanderTopProduct(){
	$.get("/chart/topProduct").done(function(data){
		topChart && topChart.destroy();
		topChart = new Chart("topProduct",{
			  type: 'horizontalBar',
			  data: {
			    labels: data.map(i=>i.name),
			    datasets: [
			    	{
					      label: "Tống sản phẩm bán được",
					      backgroundColor: "#4e73df",
					      data: data.map(i=>i.totalCount),
					      xAxisID: 'x-axis-2',
					     
					      fill:false,
					    },
			    	
			    	{
			    	fill:false,
			      label: "Tống doanh thu",
			      backgroundColor: "#F73620",
			      data: data.map(i=>i.totalMoney),
			      xAxisID: 'x-axis-1',
			      type:'horizontalBar'
			    },
			    ],
			  },
			  options: xOptions
			});
	})
}
function reanderTopHang(){
	$.get("/chart/topHang").done(function(data){
		topChart && topChart.destroy();
		topChart = new Chart("topProduct",{
			  type: 'horizontalBar',
			  data: {
			    labels: data.map(i=>i.name),
			    datasets: [
			    	{
					      label: "Tống sản phẩm bán được",
					      backgroundColor: "#4e73df",
					      data: data.map(i=>i.totalCount),
					      xAxisID: 'x-axis-2',
					     
					      fill:false,
					    },
			    	
			    	{
			    	fill:false,
			      label: "Tống doanh thu",
			      backgroundColor: "#F73620",
			      data: data.map(i=>i.totalMoney),
			      xAxisID: 'x-axis-1',
			      type:'horizontalBar'
			    },
			    ],
			  },
			  options: xOptions
			});
	})
}