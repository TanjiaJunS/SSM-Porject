<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
<title>审核人员列表</title>
<link rel="stylesheet" href="${ctx}/server/layui2.4.5/css/layui.css"
	media="all">
</head>
<body>
	<form class="layui-form layui-form-pane" action="">
		<blockquote class="layui-elem-quote news_search">
			<div class="layui-form-item">
				<div class="layui-inline pane-select">
					<label class="layui-form-label">账号</label>
					<div class="layui-input-block ">
						<input type="text" id="user_id" name="user_id"
							lay-verify="required|number" placeholder="请输账号ID"
							autocomplete="off" class="layui-input">
					</div>
				</div>


				<div class="layui-inline pane-select">
					<label class="layui-form-label">姓名</label>
					<div class="layui-input-block ">
						<input type="text" id="userName" name="userName"
							lay-verify="required|number" placeholder="请输入姓名"
							autocomplete="off" class="layui-input">
					</div>
				</div>

				<div class="layui-inline pane-input">
					<label class="layui-form-label">级别</label>
					<div class="layui-input-block">
						<select id="level" name="level" lay-search="">
							<option value="-1">全部</option>
							<option value="3">3</option>
							<option value="2">2</option>
							<option value="1">1</option>
						</select>
					</div>
				</div>

				<div class="layui-inline pane-select">
					<label class="layui-form-label">地区</label>
					<div class="layui-input-block ">
						<input type="text" id="area" name="area"
							lay-verify="required|number" placeholder="请输入地区"
							autocomplete="off" class="layui-input">
					</div>
				</div>

				<div style="float: right;">
					<a class="layui-btn search_btn" onclick="doSearch()"> <i
						class="layui-icon">&#xe615;</i>查询
					</a>
				</div>
			</div>
		</blockquote>
	</form>


	<fieldset class="layui-elem-field site-demo-button">
		<div style="float: right;">
			<button id="addAuditor" style="margin-left: 10px;" type="button"
				class="layui-btn ">新建账号</button>
			<button id="download" style="margin-left: 10px;" type="button"
				class="layui-btn ">
				<i class="layui-icon">&#xe601;</i>导出Excel
			</button>
		</div>
	</fieldset>


	<table class="layui-table" id="forum" lay-filter="forum"
		lay-data="{id: 'forum'}"></table>

	<script type="text/html" id="toolBar">
		<a class="layui-btn layui-btn-xs" lay-event="updateAuditor" >编辑</a>
		<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="deleteAuditor" >删除</a>
	</script>

	<script type="text/javascript"
		src="${ctx}/server/js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript"
		src="${ctx}/server/layui2.4.5/layui.all.js"></script>
	<script>
		//页面预加载模块
		layui.use([ 'layer', 'table', 'laydate'], function() {
			table = layui.table;
			layer = layui.layer;
			var laydate = layui.laydate;
			//--------------方法渲染TABLE----------------
			//日期范围
			laydate.render({
				elem : '#startAndendTime',
				calendar : true,
				range : '~'
			});
			
			getlist(null,null,-1,null);
		});
		
		
		//查询
		function doSearch() {
			var user_id = $("#user_id").val();
			var userName = $("#userName").val();
			var level = $("#level").val();
			var area = $("#area").val();
			getlist(user_id,userName,level,area);
		}
		//获取学生信息列表
		function getlist(user_id,userName,level,area) {
			tableIns = table.render({
				elem : '#forum',
				id : 'forum',
				method : 'post',
				where : {
					'user_id' : user_id,
					'userName' : userName,
					'level' : level,
					'area' : area
				},
				url : '${ctx}/auditor/getAuditorList',
				cols : [ [ {
					field : 'user_id',
					title : '账号',
					width : 120,
					align : 'center',
					fixed : true,
					sort : true
				}, {
					field : 'userName',
					title : '姓名',
					width : 140,
					align : 'center'
				}, {
					field : 'level',
					title : '级别',
					width : 80,
					align : 'center',
					sort : true
				}, {
					field : 'area',
					title : '地区',
					width : 140,
					align : 'center'
				}, {
					title : '操作',
					width : 180,
					align : 'center',
					fixed : 'right',
					toolbar : '#toolBar'
				} ] ],
				page : true,
				limits : [ 10, 15, 20, 50, 100 ],
				limit : 10, //默认采用20
				width : '100%',
				height : 'auto',
				loading : true,
				even : true,
				response : {
					statusName : 'code' //数据状态的字段名称，默认：code
					,
					statusCode : 0 //成功的状态码，默认：0
					,
					countName : 'count' //数据总数的字段名称，默认：count
					,
					dataName : 'data' //数据列表的字段名称，默认：data
				},
				done : function(res, curr, count) {
					exportData=res.data;
				}
			});
			
			//excel导出
			$("#download").click(function(){
		       	table.exportFile(tableIns.config.id,exportData, 'xls');
	        })
	        
		}
		
		table.on('tool(forum)',function(obj) {
			var data = obj.data;
			if (obj.event === 'updateAuditor') {
				if(${serverUser.level}<=data.level){
					layer.msg("没有权限");
				}else{
					var index = layui.layer.open({
						title : "编辑审核人员信息",
						type : 2,
						content : "${ctx}/auditor/goUpdateAuditor?user_id="
								+ data.user_id,
						success : function(layero, index) {
							setTimeout(function() {
								layui.layer.tips('点击此处返回',
										'.layui-layer-setwin .layui-layer-close', {
											tips : 3
										});
							}, 500)
						}
					})
					layui.layer.full(index);
				}
			}else if (obj.event === 'deleteAuditor') {
				if(${serverUser.level}<=data.level){
					layer.msg("没有权限");
				}else{
					layer.confirm('确定删除该账号吗?', function(index){
				        //向服务端发送删除指令
				        $.ajax({
							type : "post",
							url : "${ctx}/auditor/deleteAuditor",
							dataType : "json",
							data : {
								"user_id" : data.user_id,
							},
							success : function(data) {
								if(data.code==0){
									layer.msg("删除成功!");
									setTimeout(function () {
					      				 window.location.reload();
									 }, 1000);
								}else{
									layer.msg("删除失败!");
								}
							}
						});
				     });
				}
			}
		});
		
		$(window).one("resize",function() {
			$("#addAuditor").click(function() {
				if(${serverUser.level}==1){
					layer.msg("没有权限");
				}else{
					var index = layui.layer.open({
						title : "新建账号",
						type : 2,
						content : "${ctx}/auditor/goAddAuditor",
						success : function(layero,index) {
							setTimeout(function() {
								layui.layer.tips('点击此处返回','.layui-layer-setwin .layui-layer-close',{
									tips : 3
								});
							}, 500)
						}
					})
					layui.layer.full(index);
				}
			})
		}).resize();
		
	</script>
</body>
</html>