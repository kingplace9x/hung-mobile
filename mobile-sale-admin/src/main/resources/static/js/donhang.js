$(function(){
	$(document).on('click', '.confirmOrder', function(){
		$("#mainModal").modal();
		let status = $(this).attr("data-status");
		let id = $(this).attr("data-id");
		$(".modal-body input[type=radio]#" + status).attr('checked','checked');
		$("#idDonHang").val(id);
	})
})