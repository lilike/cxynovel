<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE" />
<title>YY小说后台管理</title>
<%-- <link href="${basePath}/system/css/all.css" rel="stylesheet" type="text/css" />
<link href="${basePath}/system/css/pop.css" rel="stylesheet" type="text/css" /> --%>
<link href="${basePath}/system/css/index.css" rel="stylesheet" type="text/css" />
<script src="${basePath}/system/js/common/jquery-1.8.3.js"
	type="text/javascript"></script>
<script src="${basePath}/system/js/common/common.js" type="text/javascript"></script>
<script src="${basePath}/system/js/common/json.js" type="text/javascript"></script>
<script src="${basePath}/system/js/system/index.js" type="text/javascript"></script>
<link href="http://cdn.bootcss.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript"
	src="${basePath}/system/js/common/bootstrap-collapse.js"></script>
<script type="text/javascript"
	src="${basePath}/system/js/common/bootstrap.min.js"></script>
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
				<div style="width: 10%;float:left;">
					<div class="col-md-2">
						<ul id="main-nav" class="nav nav-tabs nav-stacked">
						</ul>
					</div>
				</div>
				<div style="width: 90%;float:left;">
					<div class="col-md-10">
						<ul id="myTab" class="nav nav-tabs" style="padding-top: 12px">
							<p id="logintitle">
								<span style="font-size: 30px; color: green;padding-left:10px;">欢迎登陆YY小说后台管理系统</span>
							</p>
							<!-- <li class="active"><a href="#home" data-toggle="tab"> 菜鸟教程 </a></li>
						<li><a href="#ios" data-toggle="tab">iOS</a></li>
						<li class="dropdown"><a href="#" id="myTabDrop1"
							class="dropdown-toggle" data-toggle="dropdown">Java <b class="caret"></b>
						</a>
							<ul class="dropdown-menu" role="menu" aria-labelledby="myTabDrop1">
								<li><a href="#jmeter" tabindex="-1" data-toggle="tab">jmeter</a></li>
								<li><a href="#ejb" tabindex="-1" data-toggle="tab">ejb</a></li>
							</ul></li> -->
						</ul>
						<div id="myTabContent" class="tab-content">
							<div class="tab-pane fade in active" style='padding:20px;font-size:20px;font-style: italic;'>
							<p>YY小说系统是三个人一起搞事的起点，为了快速学习技能，为之后创业打下坚实的基础。——学的不仅是技术，更是梦想。</p>
							<p align="center">
								<c:forEach begin="1" end="3">
									<img src="${basePath}/system/images/kouhao.jpg" style="width:32%;">
								</c:forEach>
							</p>
						</div>
						<!--
						<div class="tab-pane fade" id="区块管理">
							<p>iOS 是一个由苹果公司开发和发布的手机操作系统。最初是于 2007 年首次发布 iPhone、iPod Touch 和 Apple
								TV。iOS 派生自 OS X，它们共享 Darwin 基础。OS X 操作系统是用在苹果电脑上，iOS 是苹果的移动版本。</p>
						</div>
						<div class="tab-pane fade" id="jmeter">
							<p>jMeter 是一款开源的测试软件。它是 100% 纯 Java 应用程序，用于负载和性能测试。</p>
						</div>
						<div class="tab-pane fade" id="ejb">
							<p>Enterprise Java
								Beans（EJB）是一个创建高度可扩展性和强大企业级应用程序的开发架构，部署在兼容应用程序服务器（比如 JBOSS、Web Logic 等）的
								J2EE 上。</p>
						</div> -->
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="footer"></div>
	</form>
</body>
</html>