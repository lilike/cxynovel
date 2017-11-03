$(function(){
	//页面加载完成之后执行
	pageInit();
	$("#list").setGridHeight($(window).height()-90);  
    $("#list").setGridWidth($(window).width()-4);  
});
$(window).resize(function(){  
//    $(window).unbind("onresize");  
    $("#list").setGridHeight($(window).height() - 90);  
    $("#list").setGridWidth($(window).width()-4);  
//    $(window).bind("onresize", this);  
}); 
function pageInit(){
	//创建jqGrid组件
	jQuery("#list").jqGrid(
			{
				url :  "/system/getList",//组件创建完成之后请求数据的url
				datatype : "json",//请求数据返回的类型。可选json,xml,txt
				colNames : [ '编号', '用户名', '密码', '登陆时间', '退出时间' ],//jqGrid的列显示名字
				/*styleUI: 'Bootstrap',*/
				colModel : [ //jqGrid每一列的配置信息。包括名字，索引，宽度,对齐方式.....
							{ name: 'userId', index: 'userId', width: 60, key: true, hidden: true }, 
				             {name : 'userName',index : 'userName',width : '20%',align : "center"}, 
				             {name : 'password',index : 'password',width : '20%',align : "center"}, 
				             {name : 'loginDate',index : 'loginDate',width : '20%',align : "center",formatter:formatTime}, 
				             {name : 'logoutDate',index : 'logoutDate',width :' 20%',sortable : false,align : "center",formatter:formatTime} 
				           ],
				rowNum : 10,//一页显示多少条
				rowList : [ 10, 20, 30 ],//可供用户选择一页显示多少条
				pager : '#pager',//表格页脚的占位符(一般是div)的id
				sortname : 'id',//初始化的时候排序的字段
				sortorder : "desc",//排序方式,可选desc,asc
				mtype : "post",//向后台请求数据的ajax的类型。可选post,get
				viewrecords : true,
	            multiselect: true,  
	            rownumbers: true,  
	            autowidth: true,  
	            rownumbers: true, // 显示行号  
	            rownumWidth: 35,
				caption : "系统用户列表"//表格的标题名字
			});
	/*创建jqGrid的操作按钮容器*/
	/*可以控制界面上增删改查的按钮是否显示*/
	jQuery("#list").navGrid('#pager',{edit:false,add:false,del:false,search:false}).navButtonAdd('#pager',{  
			caption:"添加",   
			buttonicon:"ui-icon-add",   
			onClickButton: function(){   
			alert("Adding Row");  },   
			position:"last"  
	}).navButtonAdd('#pager',{  
			caption:"删除",   
			buttonicon:"ui-icon-del",   
			onClickButton: function(){   
				alert("Deleting Row");  
			},   
			position:"last"  
	});
}

/**
*	获取当前时间并格式化
*/
function formatDate(){
	return new Date().Format("yyyy年M月dd日 hh:mm:ss");
}

function formatTime(cellvalue, options, rowObject){
	var time = new Date(cellvalue);
	return time.Format("yyyy年M月dd日 hh:mm:ss");
}


Date.prototype.Format = function(fmt)   
{ //author: meizz   
  var o = {   
    "M+" : this.getMonth()+1,                 //月份   
    "d+" : this.getDate(),                    //日   
    "h+" : this.getHours(),                   //小时   
    "m+" : this.getMinutes(),                 //分   
    "s+" : this.getSeconds(),                 //秒   
    "q+" : Math.floor((this.getMonth()+3)/3), //季度   
    "S"  : this.getMilliseconds()             //毫秒   
  };   
  if(/(y+)/.test(fmt))   
    fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));   
  for(var k in o)   
    if(new RegExp("("+ k +")").test(fmt))   
  fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));   
  return fmt;   
}  