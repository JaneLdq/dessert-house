function toaster(msg){
	$('.toaster').html(msg);
	$('.toaster').fadeIn();
	setTimeout("$('.toaster').fadeOut()", 2000);
}

var urlPrefix = "/Tian";

function passPlan(id, func){
	$.ajax({
		type: "post",
		url: urlPrefix + "/manage/pass",
		data: {
			id: id
		},
		success: function(data){
			console.log(data);
			if(data['result']==1){
				toaster("已批准该产品计划！");
				func();
			}else{
				toaster("操作出错了，请重新提交！");
			}
		}
	})
}

function rejectPlan(id, func){
	$.ajax({
		type: "post",
		url: urlPrefix + "/manage/reject",
		data: {
			id: id
		},
		success: function(data){
			console.log(data);
			if(data['result']==1){
				toaster("已否决该产品计划！");
				func();
			}else{
				toaster("操作出错了，请重新提交！");
			}
		}
	})
}

function showRealTime(){
	var today = new Date();
	$('.real-time').html(today.getFullYear() + "-" + (today.getMonth()+1) + "-" 
			+ today.getDate() + "  " + today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds()); //显示时间
}