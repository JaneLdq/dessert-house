$(document).ready(function(){
	
	$('.js-store-plan-btn').click(function(){
		var id = $(this).attr('sid');
		var url = "";
		if(id == 0){
			url = "/DessertHouse/plan/getPlanByStore";
		} else {
			url = "/DessertHouse/plan/getPlanByStore?sid=" + id;
		}
		$('#js-plan-table').bootstrapTable('refreshOptions', {
            url: url
        });
		$('#js-plan-table').bootstrapTable('refresh');
	})
	
});


function modifyFormatter(value, row, index) {
	if(row.state==2){
		return [
		        '<a class="modify" href="/DessertHouse/plan/modify/' + row.id +'" title="Modify">',
		        '<i class="glyphicon glyphicon-pencil"></i>',
		        '</a>  '
		    ].join('');
	}else{
	    return [
	        '<a class="modify disabled" href="javascript:void(0)" title="Modify">',
	        '<i class="glyphicon glyphicon-pencil"></i>',
	        '</a>  '
	    ].join('');
	}
}

function viewFormatter(value, row, index) {
    return [
		'<a href="/DessertHouse/plan/view/' + row.id + '" title="View">',
		'<i class="glyphicon glyphicon-eye-open"></i>',
		'</a>'
    ].join('');
    
}

function passFormatter(value, row, index) {
	var cls = "pass";
	if(row.state == 1){
		cls += " disabled";
	}
    return [
        '<a class="' + cls + '" href="javascript:void(0)" title="Pass">',
		'<i class="glyphicon glyphicon-ok"></i>',
        '</a>'
    ].join('');  
}

function rejectFormatter(value, row, index) {
	var cls = "pass";
	if(row.state == 1){
		cls += " disabled";
	}
	return [
	        '<a class="' + cls + '" href="javascript:void(0)" title="Reject">',
			'<i class="reject glyphicon glyphicon-remove"></i>',
			'</a>'
	].join('');  
}

function stateFormatter(value, row, index) {
	switch(value){
	case 0:
		return "待审核";
	case 1:
		return "已审核";
	case 2:
		return "未通过";
	default:
			return "";
	}
}

function rowStyle(row, index) {
	if(row.state == 2){
		return { classes: 'warning'};
	}
    return {};
}

window.passEvents = {
    'click .pass': function (e, value, row, index) {
        var state = row.state;
        if(state != 1){
        	passPlan(row.id, refreshTable);
        }else{
	    	toaster("该计划当前状态不可执行该操作！");
	    }
    }
};

window.rejectEvents = {
	'click .reject': function (e, value, row, index) {
	    var state = row.state;
	    if(state == 0){
	    	rejectPlan(row.id, refreshTable);
	    }else{
	    	toaster("该计划当前状态不可执行该操作！");
	    }
	}
};

function refreshTable(){
	$('#js-plan-table').bootstrapTable('refresh');
}

