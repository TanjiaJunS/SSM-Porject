<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="utf-8">
<title>添加账号</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="format-detection" content="telephone=no">

<link rel="stylesheet" href="${ctx}/server/layui/css/layui.css"
	media="all" />
<link rel="stylesheet"
	href="${ctx}/server/font-awesome/css/font-awesome.min.css">
</head>
<body>
	<div style="margin: 15px;">
		<div class="layui-form">

			<div class="layui-form-item">
				<label class="layui-form-label">账号：</label>
				<div class="layui-input-block">
					<input type="text" name="user_id" autocomplete="off"
						class="layui-input" lay-verify="user_id" placeholder="请输入6到8位账号"
						style="width: 390px">
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">密码：</label>
				<div class="layui-input-block">
					<input type="text" name="password" id="password" autocomplete="off"
						class="layui-input" lay-verify="password" placeholder="请输入密码"
						style="width: 390px">
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">再次输入密码：</label>
				<div class="layui-input-block">
					<input type="text" name="passwords" autocomplete="off"
						class="layui-input" lay-verify="passwords" placeholder="两次密码请一致"
						style="width: 390px">
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">姓名：</label>
				<div class="layui-input-block">
					<input type="text" name="userName" autocomplete="off"
						class="layui-input" lay-verify="userName" placeholder="请输入姓名"
						style="width: 390px">
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">级别：</label>
				<div class="layui-input-block" style="width: 390px">
					<select name="level" lay-verify="level">
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
					</select>
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">地区：</label>
				<div class="layui-input-block">
					<input type="text" name="area" autocomplete="off"
						class="layui-input" lay-verify="area" placeholder="请输入地区"
						style="width: 390px">
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label"></label>
				<div class="layui-input-block">
					<button class="layui-btn" lay-submit="" lay-filter="demo1">确认</button>
					<button onclick="goBack();" class="layui-btn layui-btn-primary">返回</button>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript"
	src="${ctx}/server/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="${ctx}/server/layui/layui.js"></script>

<script type="text/javascript">

layui.use([ 'form', 'layer'],
		function() {
	 	form = layui.form, layer = layui.layer;
	 	//自定义验证规则
		form.verify({	
			user_id : function(value) {
				if (value.trim() == '') {
					return '账号不能为空';
				}
				if(value.length<6 || value.length>8){
					return '账号长度不正确';
				}
			},
			password : function(value) {
				if (value.trim() == '' ) {
					return '密码不能为空';
				}else if(value.length <6){
					return '密码过短';
				}
			},
			passwords : function(value) {
				if (value != $("#password").val()) {
					return '两次密码不一致';
				}
			},
			userName : function(value) {
				if (value.trim() == '') {
					return '姓名不能为空';
				}
			},
			level : function(value) {
				if (value>=${serverUser.level}) {
					return '权限级别只能低于自己';
				}
			},
			area : function(value) {
				if (value.trim() == '') {
					return '区域不能为空';
				}
			}
		});
	 	
		//监听提交
		form.on('submit(demo1)', function(data) {
			$.ajax({
				type : "post",
				url : "${ctx}/auditor/addAuditor",
				dataType:"json",
				data : {
					"user_id" : data.field.user_id,
					"password" : data.field.password,
					"userName" : data.field.userName,
					"level" :data.field.level,
					"area" :data.field.area
				},
				success : function(result) {
					if(result.code==0){
						layer.msg("添加成功");
						setTimeout(function () {
							 layer.closeAll("iframe");
		      				//刷新父页面
		      				 parent.location.reload();
						  }, 1000);
					} else{
						layer.msg(result.msg,{time:2000});
					}
				},error:function(){
					layer.msg("添加失败");
				}
			});
			return false;
		});
	});
	
function goBack(){
	layer.closeAll("iframe");
	//刷新父页面
	parent.location.reload();
}

</script>
</html>