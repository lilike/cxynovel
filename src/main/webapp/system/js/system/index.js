// 当前登录用户可以访问的菜单Map
var menuMap = [];
/*var menuMap = [[
	{id:'1',
	parentId:'0',
	name:"系统设置"},
	{id:'2',
		parentId:'0',
		name:"小说管理"},
	{id:'3',
		parentId:'0',
		name:"用户管理"},
	{id:'10',
		parentId:'1',
		name:"系统设置"},
	{id:'11',
		parentId:'1',
		name:"系统设置"},
]];*/

$(function() {
	$("#gettime").text(formatDate());
	common.ajax({
			url : $("#basePath").val() + "/menus",
			success : function(data) {
				if(data && data.length > 0) {
					menuMap.push(data);
					console.log(menuMap);
					initMenu();
				}
			}
	});
	$('a[data-toggle="tab"]').on('show.bs.tab', function (e) {
		  console.log(e.target) // 激活的标签页
		  console.log(e.relatedTarget) // 前一个激活的标签页
	})
});
/**
 * 初始化菜单
 */
function initMenu() {
	var menuList = menuMap[0];
	console.log(menuList);
	$("#main-nav").html("");
	$.each(menuList,function(i,value) {
		if(value.parentid == 0){
			$("#main-nav").append("<li><a onclick='clickMenu(this," + value.id + ")' href='#systemSetting_"+value.id+"' class='nav-header collapsed' data-toggle='collapse'><i class='glyphicon glyphicon-cog'></i>" + value.name + "<span class='pull-right glyphicon glyphicon-chevron-down'></span></i></a><ul id='systemSetting_"+value.id+"' class='nav nav-list collapse secondmenu' style='height: 0px;'></ul></li>");
		}
	});
}

/**
 * 根据父菜单ID初始化子菜单
 */
function initSubMenu(parentid) {
	var menuList = menuMap[0];
	if($('#systemSetting_'+parentid).children().size()>0){
		$("#systemSetting_"+parentid).html("");
		$("#systemSetting_"+parentid).css("height","0px");
	}else{
		$("#systemSetting_"+parentid).css("height","auto");
		$("#systemSetting_"+parentid).html("");
		$.each(menuList,function(i,value) {
			if(parentid == value.parentid){
				$("#systemSetting_"+parentid).append(" <li onclick='clickSubMenu(this," +'"'+value.name+'"'+","+'"'+ value.url+ '"' + ")'><a><i class='glyphicon glyphicon-user' style='color:green;'>"+value.name+"</i></a></li>");
			}
		});
	}
}

/**
 * 方法描述:单击菜单（页面上部菜单），初始化子菜单（即页面左部菜单）
 */
function clickMenu(element,id) {
	// 将同级节点的[选中样式]清空
	$("#menuDiv").children().attr("class","");
	// 将当前单击的节点置为[选中样式]
	$(element).attr("class","on");
	// 加载子菜单内容
	initSubMenu(id);
}

/**
 * 方法描述:单击子菜单（页面左部菜单），初始化主页面
 */
function clickSubMenu(element,name,path) {
	$("#myTab").children().attr("class","");
	$("#myTab #logintitle").hide();
	var flag = checkTabIsExists("myTab",name);
	if(flag){
		$("#myTab a[href='#"+name+"']").tab('show');
	}else{
		$("#myTab").append(" <li id='"+name+"' class='active'><a href='#"+name+"' data-toggle='tab'> "+name+" <span onclick='closeTab(this)' class='glyphicon glyphicon-remove'></span></a></li>");
		var tabList = $("#myTabContent").children();
		$.each(tabList,function(i,value) {
			$(this).attr("class","tab-pane fade");
		});
		$("#myTabContent").append("<div class='tab-pane fade in active' id='"+name+"'><iframe src='" + ($("#basePath").val()+path) + "' style='width:100%;min-height:770px;frameborder:no;border:0;marginwidth:0; marginheight:0;scrolling:yes;allowtransparency:yes; '></iframe></div>");
	}
	// 将其他有[选中样式]的节点的样式清空
	/*$("#subMenuDiv").find(".on").attr("class","");*/
	// 将当前单击的节点置为[选中样式]
//	$(element).children().attr("class","on");
	// 按指定地址加载主页面(iframe)
//	$("#myTabContent").attr("src",$("#basePath").val()+ path);
}

/**
* 打开密码修改弹出层
*/
function openAddDiv(){
	$("#mengban").css("visibility","visible");
	$(".wishlistBox").show();
	$(".wishlistBox").find(".persongRightTit").html("&nbsp;&nbsp;修改密码");
	$("#submitVal").show();
}

/**
* 关闭密码修改弹出层
*/
function closeDiv(){
	$("#mengban").css("visibility","hidden");
	$("#oldPassword").val("");
	$("#newPassword").val("");
	$("#newPasswordAgain").val("");
	$(".wishlistBox").hide();
}

/**
*	获取当前时间并格式化
*/
function formatDate(){
	return new Date().Format("yyyy年M月dd日 hh:mm:ss");
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

/**
 * 关闭标签页
 * @param button
 */
function closeTab (button) {
     
    //通过该button找到对应li标签的id
    var li_id = $(button).parent().parent().attr('id');
//    var id = li_id.replace("tab_li_","");
    var prev_id = $("li.active").prev().attr('id');
    //如果关闭的是当前激活的TAB，激活他的前一个TAB
    if ($("li.active").attr('id') == li_id) {
    	if(prev_id == "logintitle"){
    		$("#myTab #logintitle").css("display","block");
    		$("#myTabContent").children().attr("class","tab-pane fade in active ");
    	}
        $("li.active").prev().find("a").click();
        $("#"+prev_id).attr("class","tab-pane fade in active");
    }
     
    //关闭TAB
    $("#" + li_id).remove();
//    $("#tab_content_" + id).remove();
};
 
/**
 * 判断是否存在指定的标签页
 * @param tabMainName
 * @param tabName
 * @returns {Boolean}
 */
function checkTabIsExists(tabMainName, tabName){
    var tab = $("#"+tabMainName+"  #"+tabName);
    //console.log(tab.length)
    return tab.length > 0;
}