
window.searchDTO = window.searchDTO || {};

$(function(){
	$("#searchForm").on("submit",function(evt){
		evt.preventDefault();
		searchDTO.name = $("#searchForm > input").val().trim();
		search(searchDTO,0);
	})
	
	if($("#slider-range").length)
	{
		$("#slider-range").slider(
		{
			step:100000,
			range: true,
			min: 0,
			max: 50000000,
			values: [ searchDTO.minPrice || 0, searchDTO.maxPrice || 50000000 ],
			slide: function( event, ui )
			{
				$( "#amount" ).val(formatter.format(ui.values[ 0 ]) + " - " + formatter.format(ui.values[ 1 ]));
				searchDTO.minPrice = ui.values[ 0 ];
				searchDTO.maxPrice = ui.values[ 1 ];
			},
			change: function( event, ui ) {
				search(searchDTO,0);
			}
		});
			
		$( "#amount" ).val(formatter.format($( "#slider-range" ).slider( "values", 0 )) + " - " + formatter.format($( "#slider-range" ).slider( "values", 1 )));

		$("ul.brands_list li.brand > a").click(function(){
			let idHang = $(this).attr("id-hang");
			search({idHang},0)
			searchDTO.idHang = idHang;
		})
	}
	
	$(document).on("click",".custom_list.clc > li", function(){
		searchDTO.idHang = $(this).children().attr("id-hang");
	})
	
	$("#searchForm > input").on("change", function(){
		searchDTO.name = $(this).val().trim();
	})
	
})


function search(searchDTO, page){
	$.post("/search",{page, ...searchDTO}).done(function(data){
		$(".shop_content").html(data);
	})
}