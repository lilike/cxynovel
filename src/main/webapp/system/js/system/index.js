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
});
/*<li>
<a href="#systemSetting" class="nav-header collapsed" data-toggle="collapse">
    <i class="glyphicon glyphicon-cog"></i>
    系统管理
       <span class="pull-right glyphicon glyphicon-chevron-down"></span>
</a>
<ul id="systemSetting" class="nav nav-list collapse secondmenu" style="height: 0px;">
    <li><a href="#"><i class="glyphicon glyphicon-user"></i>用户管理</a></li>
    <li><a href="#"><i class="glyphicon glyphicon-th-list"></i>菜单管理</a></li>
    <li><a href="#"><i class="glyphicon glyphicon-asterisk"></i>角色管理</a></li>
    <li><a href="#"><i class="glyphicon glyphicon-edit"></i>修改密码</a></li>
    <li><a href="#"><i class="glyphicon glyphicon-eye-open"></i>日志查看</a></li>
</ul>
</li>*/
/**
 * 初始化菜单
 */
function initMenu() {
	var menuList = menuMap[0];
	console.log(menuList);
	$("#main-nav").html("");
	$.each(menuList,function(i,value) {
		if(value.parentid == 0){
			$("#main-nav").append("<li onclick='clickMenu(this," + value.id + ")'><a href='#systemSetting' class='nav-header collapsed' data-toggle='collapse'><i class='glyphicon glyphicon-cog'></i>" + value.name + "<span class='pull-right glyphicon glyphicon-chevron-down'></span></i></a></li>");
		}
	});
}

/**
 * 根据父菜单ID初始化子菜单
 */
function initSubMenu(parentid) {
	var menuList = menuMap[0];
	$("#subMenuDiv").html("");
	$.each(menuList,function(i,value) {
		if(parentid == value.parentid){
			$("#subMenuDiv").append("<h3 onclick=\"clickSubMenu(this,'" + value.url + "')\"><a>" + value.name + "</a></h3>");
		}
	});
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
function clickSubMenu(element,path) {
	// 将其他有[选中样式]的节点的样式清空
	$("#subMenuDiv").find(".on").attr("class","");
	// 将当前单击的节点置为[选中样式]
	$(element).children().attr("class","on");
	// 按指定地址加载主页面(iframe)
	$("#mainPage").attr("src",$("#basePath").val()+ path);
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