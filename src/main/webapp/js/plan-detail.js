$(document).ready(function(){
	
	$('#js-pass-plan').click(function(){
		var pid = $('#js-id').html();
		passPlan(pid, reloadPlan);
	});
	
	$('#js-reject-plan').click(function(){
		var pid = $('#js-id').html();
		rejectPlan(pid, reloadPlan);
	});
})

function reloadPlan(){
	setTimeout("window.location.reload(true)",1000);
}