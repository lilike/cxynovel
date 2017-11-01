<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE" />
<title>YY小说后台管理</title>
<%-- <link href="${basePath}/system/css/all.css" rel="stylesheet" type="text/css" /> --%>
<%-- <link href="${basePath}/system/css/pop.css" rel="stylesheet" type="text/css" /> --%>
<link href="${basePath}/system/css/index.css" rel="stylesheet" type="text/css" />
<script src="${basePath}/system/js/common/jquery-1.8.3.js"
	type="text/javascript"></script>
<script src="${basePath}/system/js/common/common.js" type="text/javascript"></script>
<script src="${basePath}/system/js/common/json.js" type="text/javascript"></script>
<script src="${basePath}/system/js/system/index.js" type="text/javascript"></script>
<link href="http://cdn.bootcss.com/bootstrap/3.2.0/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>

	<!-- 蒙版DIV -->
	<div id="mengban" style="display: none"></div>
	<input type="hidden" id="basePath" value="${basePath}" />
	<div class="wishlistBox" style="display: none; left: 550px; top: 200px;">
		<div class="personRigTop persongBgimg" style="height: 200px; width: 480px;">
			<div class="persongRightTit" style="width: 480px;">&nbsp;&nbsp;修改密码</div>
			<div class="persongRigCon">
				<form name="redisAddOrEditForm" action="#" method="post">
					<table class="x-form-table">
						<tbody>
							<tr class="line">
								<td class="left" width="10%"><em class="required">*</em><label>原始密码：</label></td>
								<td width="90%"><input class="normal-input" name="oldPassword"
									id="oldPassword" style="width: 240px;" type="password" /></td>
							</tr>
							<tr class="line">
								<td class="left"><label><em class="required">*</em>新密码：</label></td>
								<td><input class="normal-input" name="newPassword" id="newPassword"
									style="width: 240px;" type="password" /></td>
							</tr>
							<tr class="line">
								<td class="left"><em class="required">*</em><label>确认新密码：</label></td>
								<td><input class="normal-input" name="newPasswordAgain"
									id="newPasswordAgain" style="width: 240px;" type="password" /></td>
							</tr>
							<tr>
								<td class="left"></td>
								<td class="submit"><input id="submitVal" class="tabSub" value="提交"
									onclick="checkForm('${basePath}/comment');" type="button" /> <input
									class="tabSub" value="关闭" onclick="closeDiv();" type="reset" /></td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
		</div>
	</div>
	<!-- <div class="navbar navbar-duomi navbar-static-top" role="navigation">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="/Admin/index.html" id="logo">YY小说管理系统
                </a>
            </div>
        </div>
    </div>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-2">
                <ul id="main-nav" class="nav nav-tabs nav-stacked" style="">
                    <li class="active">
                        <a href="#">
                            <i class="glyphicon glyphicon-th-large"></i>
                            首页         
                        </a>
                    </li>
                    <li>
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
                    </li>
                    <li>
                        <a href="./plans.html">
                            <i class="glyphicon glyphicon-credit-card"></i>
                            物料管理        
                        </a>
                    </li>

                    <li>
                        <a href="./grid.html">
                            <i class="glyphicon glyphicon-globe"></i>
                            分发配置
                            <span class="label label-warning pull-right">5</span>
                        </a>
                    </li>

                    <li>
                        <a href="./charts.html">
                            <i class="glyphicon glyphicon-calendar"></i>
                            图表统计
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <i class="glyphicon glyphicon-fire"></i>
                            关于系统
                        </a>
                    </li>

                </ul>
            </div>
            <div class="col-md-10">
                主窗口
            </div>
        </div> 
    </div>-->
	<form method="post" action="${basePath}/session" id="mainForm">
		<input type="hidden" name="_method" value="DELETE" />
		<div class="navbar navbar-duomi navbar-static-top" role="navigation">
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand" href="/Admin/index.html" id="logo">YY小说管理系统 </a>
					<div class="h_info">
						<span class="line"></span> 欢迎您！姓名[${USER_INFO.userName}]&nbsp; 当前时间：<span
							id="gettime">2017年03月20日</span>&nbsp;&nbsp;&nbsp;&nbsp; <a
							href="javascript:void(0);" onclick="openAddDiv();">[修改密码]</a> &nbsp; <a
							href="javascript:void(0);"
							onclick="if(confirm('您确认退出系统?')){$('#mainForm').submit();};">[退出系统]</a>
					</div>
				</div>
			</div>
		</div>
		<div class="container-fluid">
        <div class="row">
            <div class="col-md-2">
             	<ul id="main-nav" class="nav nav-tabs nav-stacked" style="">
             	</ul>
            </div>
		<%-- <div id="header">
			<div class="iheader">
				<div class="logo">
					<a href="#">
						<img src="${basePath}/system/images/companyico.jpg" alt="" height="34px" width="52px"/>
					</a>
				</div>
				<div style="height: 44px;">
					<div class="wuxianlogo">
						YY小说后台管理系统
						<!-- <img src="" alt="" height="28px" width="275px"/> -->
					</div>
					<div class="h_info">
						<span class="line"></span> 欢迎您！姓名[${USER_INFO.userName}]&nbsp; 当前时间：<span
							id="gettime">2017年03月20日</span>&nbsp;&nbsp;&nbsp;&nbsp; <a
							href="javascript:void(0);" onclick="openAddDiv();">[修改密码]</a> &nbsp; <a
							href="javascript:void(0);"
							onclick="if(confirm('您确认退出系统?')){$('#mainForm').submit();};">[退出系统]</a>
					</div>
				</div>
				<ul class="nav" id="menuDiv">
				</ul>
			</div>
		</div>
		<div id="container">
			<table style="vertical-align: top" cellspacing="0" cellpadding="0"
				bgcolor="#e1e9eb" border="0">
				<tbody>
					<tr>
						<td class="leftTd" style="vertical-align: top" width="150">
							<div class="left">
								<div class="ileft" id="subMenuDiv"></div>
							</div>
						</td>
						<td width="7">
							<div class="pointer"></div>
						</td>
						<td style="vertical-align: top" height="600px" width="100%"><br />
						<iframe id="mainPage" src="" frameborder="0" height="580px" width="100%"></iframe><br />
						</td>
					</tr>
				</tbody>
			</table>
		</div> --%>
		<div id="footer"></div>
	</form>
</body>
</html>