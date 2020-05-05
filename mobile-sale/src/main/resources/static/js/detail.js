$(function(){
	$("#userData").on('submit', function(evt){
		evt.preventDefault();
		let data = deSerialize($(this).serialize());
		$.post("/userData",data).done(function(){
			location.reload();
		})
	})
	$("#questionForm").on('submit', function(evt){
		evt.preventDefault()
		let data = deSerialize($(this).serialize());
		$.post("/question",data).done(function(){
			location.reload();
		}).fail(function(){
			alert("có lỗi xảy ra");
		})
	})
	$("input.rating").rating({
		 start: 1,
		 stop: 5
	}).change(function(){
		let ratingStatus = ['Rất tệ', 'Tệ', 'Tạm được', 'Tốt', 'Rất tốt'];
		$("#ratingStatus").text(ratingStatus[Number(this.value)-1])
	})
	
	$("#ratingForm").submit(function(evt){
		evt.preventDefault();
		$.ajax({
			method:'post',
			data: $(this).serialize(),
			url: "/product/rating",
			success:function(){
				location.reload();
			}
		})
		location.reload();
	})
})