<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>外迁子女高考资格审核系统</title>
<link rel="icon" type="image/x-icon" href="${ctx}/images/icon.png">
<link rel="stylesheet" href="${ctx}/server/layui/css/layui.css"
	media="all" />
<style>
#header {
	width: 100%;
	height: 100%;
	background-color: #eee;
}
</style>
<body class="layui-layout-body">
	<div class="layui-layout layui-layout-admin">
		<div class="layui-header">
			<div class="layui-logo">资质审核系统</div>
			<!-- 头部区域（可配合layui已有的水平导航） -->
			<ul class="layui-nav layui-layout-left">
				<li class="layui-nav-item"><a href="">统计台</a></li>
			</ul>
			<ul class="layui-nav layui-layout-right">
				<li class="layui-nav-item"><a href="javascript:;"> <img
						src="${ctx}/images/head.png" class="layui-nav-img">
						${serverUser.userName}
				</a>
					<dl class="layui-nav-child">
						<dd>
							<a href="javascript:;"
								onclick="getPage('${ctx}/auditor/goUpdatePassword',0)">修改密码</a>
						</dd>
					</dl></li>
				<li class="layui-nav-item logout"><a href="javascript:;">退出</a></li>
			</ul>
		</div>

		<div class="layui-side layui-bg-black">
			<div class="layui-side-scroll">
				<!-- 左侧导航区域（可配合layui已有的垂直导航） -->
				<ul class="layui-nav layui-nav-tree" lay-filter="test">

					<li class="layui-nav-item"><a class="" href="javascript:;">报表审核</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="#" onclick="getPage('${ctx}/student/goStudentList',0)">上传报表</a>
							</dd>
						</dl></li>

					<li class="layui-nav-item"><a class="" href="javascript:;">审核人员管理</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="#" onclick="getPage('${ctx}/auditor/goAuditorList',0)">审核人员列表</a>
							</dd>
						</dl></li>

					<li class="layui-nav-item"><a class="" href="javascript:;">系统管理</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="#" onclick="getPage('${ctx}/banner/goBannerList',4)">轮播列表</a>
							</dd>
							<dd>
								<a href="#" onclick="getPage('${ctx}/notice/goNoticeList',4)">公告列表</a>
							</dd>
							<dd>
								<a href="#" onclick="getPage('${ctx}/system/goSystemSetting',4)">系统设置</a>
							</dd>
						</dl></li>

				</ul>
			</div>
		</div>

		<div class="layui-body content-main"
			style="scrolling: no; overflow-y: hidden;">
			<!-- 内容主体区域 -->

		</div>

		<div class="layui-footer" align="center">
			<!-- 底部固定区域 -->
			&copy;2021-2022&nbsp;谭嘉俊&nbsp;版权所有&nbsp;All Rights Reserved.
		</div>
	</div>
	<script type="text/javascript"
		src="${ctx}/server/js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="${ctx}/server/layui/layui.all.js"></script>
	<script type="text/javascript">
	layui.use('element', function(){
		var element = layui.element;
	});	
	//获取页面
	function getPage(url,lv){
		if( ${serverUser.level}>=lv){
			$(".content-main").html("<iframe class=\"header\" id=\"header\" src="+url+" frameborder=\"no\" border=\"0\" marginwidth=\"0\" marginheight=\"0\" name=\"header\"></iframe>");
		}else{
			layer.msg("没有权限，只有管理员可操作");
		}
	}
	getPage('${ctx}/auditor/goConsole',0);
	//退出系统
	function quit() {
		layer.confirm('您确认退出该系统？', {
			btn : [ '确定', '取消' ]
		//按钮
		}, function() {
			$.ajax({
				url : '${ctx}/auditor/dologout',
				type : 'post',
				dataType : 'json',
				data : {},
				success : function(data) {
					if(data.code == 0){
						layer.msg("退出成功");
						setTimeout(function(){
							window.location.href = "${ctx}/auditor/goLogin";
						},1000);
					}else{
						layer.msg("退出失败");
					}
				}
			})
		}, function() {
			layer.closeAll();
			window.location.reload();
		});
	}
	$(".logout").click(function(){
		quit();
	});
	
	//禁止浏览器的后退按钮
	$(function() {
		　　if (window.history && window.history.pushState) {
		　　$(window).on('popstate', function () {
		　　window.history.pushState('forward', null, '#');
		　　window.history.forward(1);
		　　});
		　　}
		　　window.history.pushState('forward', null, '#'); //在IE中必须得有这两行
		　　window.history.forward(1);
	})
</script>
</body>

</html>