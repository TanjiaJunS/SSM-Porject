<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="utf-8">
<title>编辑学生信息</title>
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
				<label class="layui-form-label">姓名：</label>
				<div class="layui-input-block">
					<input type="text" name="name" value="${student.name}"
						autocomplete="off" class="layui-input" Readonly="true"
						style="width: 390px">
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">性别：</label>
				<div class="layui-input-block">
					<input type="text" name="gender" value="${student.gender}"
						autocomplete="off" class="layui-input" Readonly="true"
						style="width: 390px">
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">考生号：</label>
				<div class="layui-input-block">
					<input type="text" name="student_id" value="${student.student_id}"
						autocomplete="off" class="layui-input" Readonly="true"
						style="width: 390px">
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">身份证前六位：</label>
				<div class="layui-input-block">
					<input type="text" name="card_id" value="${student.card_id}"
						autocomplete="off" class="layui-input" Readonly="true"
						style="width: 390px">
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">加分：</label>
				<div class="layui-input-block" style="width: 390px">
					<select name="point_add" lay-verify="required">
						<option value="-1">${student.point_add}</option>
						<option value="0">0</option>
						<option value="10">10</option>
					</select>
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">省市：</label>
				<div class="layui-input-block">
					<input type="text" name="city" value="${student.city}"
						autocomplete="off" class="layui-input" Readonly="true"
						style="width: 390px">
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">县区：</label>
				<div class="layui-input-block">
					<input type="text" name="county" value="${student.county}"
						autocomplete="off" class="layui-input" Readonly="true"
						style="width: 390px">
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">备注：</label>
				<div class="layui-input-block">
					<textarea placeholder="请输入备注" class="layui-textarea" name="note"
						lay-verify="note" style="width: 390px">${student.note}</textarea>
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
		//监听提交
		form.on('submit(demo1)', function(data) {
			$.ajax({
				type : "post",
				url : "${ctx}/student/updateStudent",
				dataType:"json",
				data : {
					"student_id":'${student.student_id}',
					"point_add":data.field.point_add,
					"note":data.field.note
				},
				success : function(result) {
					if(result.code==0){
						layer.msg("编辑成功");
						setTimeout(function () {
							 layer.closeAll("iframe");
		      				//刷新父页面
		      				 parent.location.reload();
						  }, 1000);
					} else{
						layer.msg(result.msg,{time:2000});
					}
				},error:function(){
					layer.msg("编辑失败");
				}
			});
			return false;
		});
	});

function goBack(){
	layer.closeAll("iframe");
	parent.location.reload();
}
</script>
</html>