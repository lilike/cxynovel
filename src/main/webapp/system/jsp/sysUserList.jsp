<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE" />
<title></title>
<link href="${basePath}/system/css/sysUserList.css" rel="stylesheet" type="text/css" />
<script src="${basePath}/system/js/common/jquery-1.8.3.js"
	type="text/javascript"></script>
<script src="${basePath}/system/js/common/common.js" type="text/javascript"></script>
<script src="${basePath}/system/js/common/json.js" type="text/javascript"></script>
<link href="${basePath}/system/css/bootstrap.min.css" rel="stylesheet">
<!-- jqGrid组件基础样式包-必要 -->
<link rel="stylesheet" href="${basePath}/system/jqgrid/css/ui.jqgrid.css" />
<!-- jqGrid主题包-非必要 -->
<!-- 在jqgrid/css/css这个目录下还有其他的主题包，可以尝试更换看效果 -->
<link rel="stylesheet" href="${basePath}/system/jqgrid/css/css/redmond/jquery-ui-1.8.16.custom.css" />
<!-- jqGrid插件包-必要 -->
<script type="text/javascript" src="${basePath}/system/jqgrid/js/jquery.jqGrid.src.js"></script>
<!-- jqGrid插件的多语言包-非必要 -->
<!-- 在jqgrid/js/i18n下还有其他的多语言包，可以尝试更换看效果 -->
<script type="text/javascript" src="${basePath}/system/jqgrid/js/i18n/grid.locale-cn.js"></script>
<script src="${basePath}/system/js/system/sysUserList.js" type="text/javascript"></script>
</head>
<body>
	<table id="list" style="width:100%;"></table> 
	<div id="pager" style="width:100%;"></div>
</body>
</html>