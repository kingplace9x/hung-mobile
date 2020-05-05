$(function(){
	$(document).on('click', '.btn-edit', function(){
		let wrap = $($(this).parents().get(3));
		wrap.find(".form-edit").toggle("fast");
		wrap.find(".nv").toggle("fast");
	})
})