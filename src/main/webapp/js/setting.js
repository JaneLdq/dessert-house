var currentIndex = 0;

$(document).ready(function(){
	
	$(".panel").children(".tab-panel").hide();
	$($(".panel").children(".tab-panel").eq(0)).show();
	$(".tab-list").children("li").bind("click", function() {
		if($(this).hasClass("active") == false) {
			$(".tab-list").children("li").eq(currentIndex).removeClass("active");
	        $(this).addClass("active");
	        var newIndex = $(this).index();
	        var panels = $(".user-setting-panel").children(".tab-panel");
	        panels.eq(currentIndex).hide();
	        currentIndex = newIndex;
	        var panel = panels.eq(newIndex);
	        panel.children(0).css("opacity", 0);
	        panel.children(0).animate({opacity: "1"}, 100);
	        panel.show();
	    }
	});
	
	$('#js-setting-submit').click(function(){
		var empty = false;
		var info = $('#js-user-setting-form').serialize();
		var name = $('input[name="name"]').val();
		if(name.length == 0)
			empty = true;
		var nickname = $('input[name="nickname"]').val();
		if(nickname.length == 0)
			empty = true;
		var birth = $('input[name="birth"]').val();
		if(birth.length == 0)
			empty = true;
		if(!empty){
			$.ajax({
				type: "post",
				url: urlPrefix + "/user/setting",
				data: info,
				success: function(data){
					if(data['result']==1){
						toaster("修改成功！");
						$('.js-left-info-nickname').html(nickname);
					}else{
						toaster("保存失败，> < 请稍后再试");
					}
				},
				error: function(){
					console.log("用户设置AJAX错误！");
				}
			});
			var formData = new FormData(document.getElementById("js-avatar-form"));
			var avatar = document.getElementById('js-avatar-upload').files[0];
			$.ajax({
				type: "post",
				url: urlPrefix + "/user/uploadAvatar",
				data: formData,
				processData : false,
				contentType: false,
				success: function(data){
					if(data['result']==1){
						toaster("头像修改成功~");
						var random = parseInt(100*Math.random());
						$('.js-left-info-avatar').attr('src', data['url']+"?" + random);
					}
				},
				error: function(){
					console.log("上传头像AJAX错误！");
				}
			});
		} else {
			toaster("有<span class='highlight'>*</span>标注的表格项都不能为空哦~");
		}
	});
	
	$('#js-password-submit').click(function(){
		var psw = $('input[name="password"]').val();
		var newpwd = $('input[name="newpwd"').val();
		var confirm = $('input[name="confirm"]').val();
		if(psw.length == 0 || newpwd == 0){
			toaster("原密码和新密码不能为空~");
			return;
		} 
		if(psw == newpwd){
			toaster("密码未发生改变");
			return;
		}
		if(newpwd != confirm){
			toaster("新设置的密码与确认不一致~");
			return;
		}
		$.ajax({
			type: "post",
			url: urlPrefix + "/user/modifypassword",
			data: $('#js-user-pwd-form').serialize(),
			success: function(data){
				console.log(data);
				if(data['result']==1){
					toaster("密码修改成功，请重新登录！");
					setTimeout("reLogin()", 2000);
				} else {
					toaster("密码修改失败，请确认原始密码填写正确！");
				}
			},
			error: function(){
				console.log("修改密码AJAX错误！");
			}
		})
	});
	
	$('.js-add-address').click(function(){
		$('.js-address-add-btn').removeAttr("modify");
		$('#address-modal .js-set-default-group').show();
		$('#address-modal').modal();
	});
	
	$('body').on('click', '.js-address-add-btn', function(){
		if($(this).attr("modify")){
			modifyAddressSubmit();
		}else{
			addAddress(refreshAddressList);	
			$('.address-form')[0].reset();
		}
		$.modal.close();
	});
	
	$('#address-modal').on($.modal.AFTER_CLOSE, function(event, modal) {
		$('.address-form')[0].reset();
	});
	
});


function setDefault(element){
	var aid = $(element).attr('aid');
	$.ajax({
		type: "post",
		url: urlPrefix + "/address/setDefault",
		data: {
			aid: aid
		},
		success: function(data){
			if(data['result']){
				refreshAddressList();
			}
		}
	});
}

function deleteAddress(element){
	var aid = $(element).attr('aid');
	$.ajax({
		type: "post",
		url: urlPrefix + "/address/delete",
		data: {
			aid: aid
		},
		success: function(data){
			if(data['result']){
				refreshAddressList();
			}
		}
	});
}

function modifyAddress(element){
	var aid = $(element).attr("aid");
	$.ajax({
		type: "get",
		url: urlPrefix + "/address/get",
		data: {
			aid: aid
		},
		success: function(data){
			var addr = data['address'];
			$('.address-form input[name="receiver"]').val(addr.receiver);
			$('.address-form input[name="tel"]').val(addr.tel);
			$('.address-form input[name="address"]').val(addr.address);
			$('.address-form input[name="id"]').val(addr.id);
			$('.js-address-add-btn').attr("modify", true);
			$('#address-modal .js-set-default-group').hide();
			$('#address-modal').modal();
		}
	});
}

function modifyAddressSubmit(){
	var addr = {
		receiver: $('.address-form input[name="receiver"]').val(),
		tel: $('.address-form input[name="tel"]').val(),
		address: $('.address-form input[name="address"]').val(),
		aid: $('.address-form input[name="id"]').val()
	};
	$.ajax({
		type: "post",
		url: urlPrefix + "/address/edit",
		data: addr,
		success: function(data){
			if(data['result']){
				refreshAddressList();
			}
		}
	});
}


function refreshAddressList(){
	$.ajax({
		type: "get",
		url: urlPrefix + "/address/getAll",
		success: function(data){
			var list = data['addrList'];
			var defaultAddress = data['defaultAddress'];
			var html = '<li class="address-item default" aid="' + defaultAddress.id + '">'
				+ '<a class="right operation" href="javascript:void(0)" onclick="modifyAddress(this)" aid="' + defaultAddress.id
				+ '"><i class="fa fa-pencil"></i>修改</a>'
				+ '<div class="address-detail">'
					+ '<div class="address-detail-item">'
						+ '<label class="label">收货人：</label><div class="left">' + defaultAddress.receiver + '</div>'
						+ '<div class="clear-fix"></div></div>'
					+ '<div class="address-detail-item">'
						+ '<label class="label">地址：</label><div class="left">' + defaultAddress.address + '</div>'
						+ '<div class="clear-fix"></div></div>'
					+ '<div class="address-detail-item">'
						+ '<label class="label">电话：</label>	<div class="left">' + defaultAddress.tel + '</div>'
						+ '<div class="clear-fix"></div></div>'
					+ '</div><div class="default-tag">默认地址</div><div class="clear-fix"></div></li>';
			for(var i=0; i<list.length; i++){
				var addr = list[i];
				html +=  '<li class="address-item default" aid="' + addr.id + '">'
					+ '<a class="right operation" href="javascript:void(0)" onclick="deleteAddress(this)" aid="' + addr.id + '"><i class="fa fa-close"></i>删除</a>'
					+ '<a class="right operation" href="javascript:void(0)" onclick="modifyAddress(this)" aid="' + addr.id + '"><i class="fa fa-pencil"></i>修改</a>'
					+ '<a class="right operation" href="javascript:void(0)" onclick="setDefault(this)" aid="' + addr.id
					+ '"><i class="fa fa-pencil"></i>设为默认地址</a>'
					+ '<div class="address-detail">'
						+ '<div class="address-detail-item">'
							+ '<label class="label">收货人：</label><div class="left">' + addr.receiver + '</div>'
							+ '<div class="clear-fix"></div></div>'
						+ '<div class="address-detail-item">'
							+ '<label class="label">地址：</label><div class="left">' + addr.address + '</div>'
							+ '<div class="clear-fix"></div></div>'
						+ '<div class="address-detail-item">'
							+ '<label class="label">电话：</label>	<div class="left">' + addr.tel + '</div>'
							+ '<div class="clear-fix"></div></div>'
					+ '</div><div class="clear-fix"></div></li>';
			}
			$('.js-address-list').html(html);
		}
	});
}

function reLogin(){
	window.location.href= urlPrefix + '/auth';
}

function showAvatar(){
    //利用files获得被上传附件(图片)信息
    var avatar = document.getElementById('js-avatar-upload').files[0];
    //利用cover获得图像的url地址(二进制源码)
    if(avatar != null) {
        document.getElementById('js-avatar').src = window.URL.createObjectURL(avatar);
    }
}
