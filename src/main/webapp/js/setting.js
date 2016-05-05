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
		var address = $('input[name="address"]').val();
		if(address.length == 0)
			empty = true;
		if(!empty){
			$.ajax({
				type: "post",
				url: urlPrefix + "/user/setting",
				data: info,
				success: function(data){
					console.log("修改成功！");
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
		} else {
			toaster("有<span class='highlight'>*</span>标注的表格项都不能为空哦~");
		}
	});
	
	$('#js-avatar-submit').click(function(){
		var formData = new FormData(document.getElementById("js-avatar-form"));
		var avatar = document.getElementById('js-avatar-upload').files[0];
	    console.log(avatar);
		$.ajax({
			type: "post",
			url: urlPrefix + "/user/uploadAvatar",
			data: formData,
			processData : false,
			contentType: false,
			success: function(data){
				console.log(data);
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
	
});


function reLogin(){
	window.location.href= urlPrefix + '/auth';
}

function showAvatar(){
    //利用files获得被上传附件(图片)信息
    var avatar = document.getElementById('js-avatar-upload').files[0];
    console.log(avatar);
    //利用cover获得图像的url地址(二进制源码)
    if(avatar != null) {
        document.getElementById('js-avatar').src = window.URL.createObjectURL(avatar);
    }
}
