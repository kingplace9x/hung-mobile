serialize = function(obj, prefix) {
  var str = [],
    p;
  for (p in obj) {
    if (obj.hasOwnProperty(p)) {
      var k = prefix ? prefix + "[" + p + "]" : p,
        v = obj[p];
      str.push((v !== null && typeof v === "object") ?
        serialize(v, k) :
        encodeURIComponent(k) + "=" + encodeURIComponent(v));
    }
  }
  return str.join("&");
}
deSerialize = function(search){ if(search===""){ return{}} else return JSON.parse('{"' + search.replace(/\?/g,'').replace(/&/g, '","').replace(/=/g,'":"') + '"}', function(key, value) { return key===""?value:decodeURIComponent(value) })}
var formatter = new Intl.NumberFormat('vi-VN', {
	  style: 'currency',
	  currency: 'VND',
	});
$(function(){
	getCart();
})
function renderCart(data){
	if(Boolean(data) && data.length>0){
		let total = data.reduce((a,b)=>a + b.giaSanPham*b.soLuong,0);
		let html = '';
		data.forEach(pro=>{
			html+=`<tr>
						<td><a href="/product?id=${pro.idSanPham}">${pro.tenSanPham}</a></td>
						<td>${formatter.format(pro.giaSanPham)}</td>
						<td><button class="btn btn-sm" onclick="removeCart(${pro.idSanPham})">-</button> ${pro.soLuong} <button class="btn btn-sm" onclick="addCart(${pro.idSanPham})">+</button></td>
					</tr>`;
		})
		let template = `<table class="table">
						<thead>
							<tr>
								<th>Tên sản phẩm</th>
								<th>Giá tiền</th>
								<th>Số lượng</th>
							</tr>
						</thead>
						<tbody>
							${html}
							
						</tbody>
						<tfoot>
						<tr>
							<td colspan="2">
								<h5>Tổng tiền: <font color="red">${formatter.format(total)}</font></h5>						
							</td>
							<td>
								<button type="button" class="btn btn-danger" onclick="location.href='/dat-hang'">
									Đặt hàng ngay
								</button>
							</td>
						</tr>
						</tfoot>
					</table>`;
			$("#myModal .modal-body").html(template);
			let num = data.reduce((a,b)=>a + b.soLuong, 0);
			$(".cart_count > span").text(num);
			$(".cart_price").text(formatter.format(total));
	} else {
		$("#myModal .modal-body").html("Giỏi hàng của bạn đang trống");
		$(".cart_count > span").text("0");
		$(".cart_price").text("0 VNĐ");
	}
}

async function getCart(){
	return new Promise((resolve, reject)=>{
		$.post("/home/shop/getCart").done(function(data){
			resolve(data);
			renderCart(data)
		}).fail(function(err){
			reject(err);
		})
	})
}
async function addCart(id){
	return new Promise((resolve, reject)=>{
		$.post("/home/shop/addCart",{productId:id}).done(function(data){
			resolve(data);
			renderCart(data)
		}).fail(function(err){
			reject(err);
		})
	})
}
async function removeCart(id){
	return new Promise((resolve, reject)=>{
		$.post("/home/shop/removeCart",{productId:id}).done(function(data){
			resolve(data);
			renderCart(data)
		}).fail(function(err){
			reject(err);
		})
	})
}

function toLink(searchable){
	location.href = "/home?" + serialize(searchable)
}

$(function(){
	$('ul.page_nav > li').click(function(){
		let page = $(this).children().text() - 1;
		let search = deSerialize(location.search);
		search.page=page;
		toLink(search);
	})
	$('.page_prev').click(function(){
		$('ul.page_nav > li.active').prev().click();
	})
	$('.page_next').click(function(){
		$('ul.page_nav > li.active').next().click();
	})
	if(window.location.search.includes('page=')){
		var body = $("html, body");
		body.stop().animate({scrollTop:175}, 500, 'swing', function() { 
		});
	}
	let search = deSerialize(location.search);
	if(search.sort){
		$("#sort").val(search.sort);
	}
	$("#sort").change(function(){
		let search = deSerialize(location.search);
		search.page = 0;
		if(this.value){
			search.sort = this.value;
			
		}else{
			delete search.sort;
		}
		toLink(search);
	})
	$(document).scroll(function(evt){
		if($(document).scrollTop()>75){
			$("#scrollCart").show(400);
		}else{
			$("#scrollCart").hide(400);
		}
	})
})