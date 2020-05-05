$(function(){
	$(".hangEdit").click(function(){
		$("#exampleModalLabel").text("Chỉnh sửa");
		let tr = $(this).parent().parent();
		let hang = {};
		hang.idHang = tr.find(".idHang").text();
		hang.name = tr.find(".tenHang").text();
		hang.image = tr.find(".anhHang").attr("src");
		$("#tenHang").val(hang.name);
		$("#linkAnh").val(hang.image);
		$("#idHang").val(hang.idHang);
		$('#mainModal').modal();
	});
	
	$("#addNew").click(function(){
		$("#idHang").val(null);
		$('#mainModal').modal();
	})
	
	$("button.xoaHang").click(function(){
		let id = $(this).attr('data-id')
		if(confirm("Bạn xóa muốn xóa hãng này?")){
			$.post("/admin/quan-ly-hang/xoa/" + id)
		}
	})
})

$(function(){
	window.dataHang = [];
	$("#dataTable > tbody > tr").each(function(){
		dataHang.push({name:$(this).find('a.tenHang').text(),count:$(this).find(':nth-child(4)').text()})
	})
	let sum = 0;
	dataHang.forEach(function(item){
		sum+=Number(item.count);
	})
	dataHang.forEach(function(item){
		item.percent = Math.round(item.count/sum*10000)/100;
	})
	new Chart("cvsPercent",{
		  type: 'pie',
		  data: {
		    labels: dataHang.map(item=>item.name),
		    datasets: [{
		      data: dataHang.map(item=>item.percent),
		      backgroundColor: ['red','green','blue','orange','gray','aqua','#36a2eb',
		    	  '#ff6384','#cc65fe','#ffce56','lime','navy','menu'],
		      weight:4
		    },
],
		  },
		  options: {
		        tooltips: {

		            custom: function(tooltipModel) {
		                tooltipModel.body[0] && (tooltipModel.body[0].lines[0]+="%")
		            }
		        }
		    }
		});
})