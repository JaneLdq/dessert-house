$(document).ready(function(){
	initSexChart(33,55);
	
	$.ajax({
		type:"get",
		url: urlPrefix + "/manage/getAges",
		success: function(data){
			console.log(data);
			initAgeChart(data);
		}
	});
});


function initAgeChart(data){
	var ageChart = echarts.init(document.getElementById('js-age'));
	option = {
		    title : {
		        text: '会员年龄分布',
		        x:'center'
		    },
		    tooltip : {
		        trigger: 'item',
		        formatter: "{a} <br/>{b} : {c} ({d}%)"
		    },
		    series : [
		        {
		            name: '会员性别比例',
		            type: 'pie',
		            radius : '55%',
		            center: ['50%', '60%'],
		            data:data,
		            itemStyle: {
		                emphasis: {
		                    shadowBlur: 10,
		                    shadowOffsetX: 0,
		                    shadowColor: 'rgba(0, 0, 0, 0.5)'
		                }
		            }
		        }
		    ]
		};
	ageChart.setOption(option);
}

function initSexChart(m,fm){
	var sexChart = echarts.init(document.getElementById('js-sex'));
	option = {
		    title : {
		        text: '会员性别比例',
		        x:'center'
		    },
		    tooltip : {
		        trigger: 'item',
		        formatter: "{a} <br/>{b} : {c} ({d}%)"
		    },
		    legend: {
		        orient: 'vertical',
		        left: 'left',
		        data: ['男','女']
		    },
		    series : [
		        {
		            name: '会员性别比例',
		            type: 'pie',
		            radius : '55%',
		            center: ['50%', '60%'],
		            data:[
		                {value:m, name:'男'},
		                {value:fm, name:'女'}
		            ],
		            itemStyle: {
		                emphasis: {
		                    shadowBlur: 10,
		                    shadowOffsetX: 0,
		                    shadowColor: 'rgba(0, 0, 0, 0.5)'
		                }
		            }
		        }
		    ]
		};
	sexChart.setOption(option);
}