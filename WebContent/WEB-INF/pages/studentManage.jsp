<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
<title>学生列表</title>
<link rel="stylesheet" href="${ctx}/server/layui2.4.5/css/layui.css" media="all">
</head>
<body>
	<form class="layui-form layui-form-pane" action="">
		<blockquote class="layui-elem-quote news_search">
			<div class="layui-form-item" >
				<div class="layui-inline pane-select">
					<label class="layui-form-label">姓名</label>
					<div class="layui-input-block ">
						<input type="text" id="name" name="name"
							lay-verify="required|number" placeholder="请输入学生姓名"
							autocomplete="off" class="layui-input">
					</div>
				</div>
			
				
				<div class="layui-inline pane-input">
					<label class="layui-form-label">性别</label>
					<div class="layui-input-block">
						<select id="gender" name="gender" lay-search="">
							<option value="">全部</option>
							<option value="男">男</option>
							<option value="女">女</option>
						</select>
					</div>
				</div>
				
				
				<div class="layui-inline pane-select">
					<label class="layui-form-label">考生号</label>
					<div class="layui-input-block ">
						<input type="text" id="student_id" name="student_id"
							lay-verify="required|number" placeholder="请输入考生号"
							autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-inline pane-select">
					<label class="layui-form-label">身份证</label>
					<div class="layui-input-block ">
						<input type="text" id="card_id" name="card_id"
							lay-verify="required|number" placeholder="请输入前六位身份证"
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
		<blockquote class="layui-elem-quote news_search">
			<div class="layui-form-item">
				<div class="layui-inline pane-input">
					<label class="layui-form-label">加分</label>
					<div class="layui-input-block">
						<select id="point_add" name="point_add" lay-search="">
							<option value="-1">全部</option>
							<option value="0">0</option>
							<option value="10">10</option>
						</select>
					</div>
				</div>
			</div>
		</blockquote>
	</form>
	

	 <fieldset class="layui-elem-field site-demo-button">
		<div style="float: right;">
			<button id="addStudent"  style="margin-left:10px;" type="button"  class="layui-btn ">添加学生</button>
			<button id="upLoadExcel" style="margin-left:10px;" type="button"  class="layui-btn " lay-submit="" lay-filter="upLoadExcel" ><i class="layui-icon">&#xe62f;</i>上传Excel</button>
			<button id="download"    style="margin-left:10px;" type="button"  class="layui-btn " ><i class="layui-icon">&#xe601;</i>导出Excel</button>
		</div>
	</fieldset>


	<table class="layui-table" id="forum" lay-filter="forum" lay-data="{id: 'forum'}"></table>
	
	<script type="text/html" id="toolBar">
		<a class="layui-btn layui-btn-xs" lay-event="updateStudent" >编辑</a>
		<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="deleteStudent" >删除</a>
	</script>

	<script type="text/javascript" src="${ctx}/server/js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="${ctx}/server/layui2.4.5/layui.all.js"></script>
	<script>
		//页面预加载模块
		layui.use([ 'layer', 'table', 'laydate','upload' ], function() {
			table = layui.table;
			layer = layui.layer;
			var laydate = layui.laydate;
			var upload = layui.upload;
			//--------------方法渲染TABLE----------------
			//日期范围
			laydate.render({
				elem : '#startAndendTime',
				calendar : true,
				range : '~'
			});
			
			//文件上传
			upload.render({
		           elem: '#upLoadExcel',
		           url: '${ctx}/student/upLoadExcel',
		           auto: true,
		           method : 'post',
		           accept: 'file',       //普通文件
		           done: function(res){
		               console.log(res)	               
		               if(res.code==0){
		                   return layer.msg("导入成功",{icon:6,time:1000});
		               }
		               return layer.msg("导入失败",{icon:5,time:1000});
		           }
		       });
			
			getlist(null,null,null,null,-1);
		});
		
		
		//查询
		function doSearch() {
			var name = $("#name").val();
			var gender = $("#gender").val();
			var student_id = $("#student_id").val();
			var card_id = $("#card_id").val();
			var point_add = $("#point_add").val();
			getlist(name,gender,student_id,card_id,point_add);
		}
		//获取学生信息列表
		function getlist(name,gender,student_id,card_id,point_add) {
			tableIns = table.render({
				elem : '#forum',
				id : 'forum',
				method : 'post',
				where : {
					'name' : name,
					'gender' : gender,
					'student_id' : student_id,
					'card_id' : card_id,
					'point_add' : point_add
				},
				url : '${ctx}/student/getStudentList',
				cols : [ [ {
					field : 'id',
					title : '编号',
					width : 130,
					align : 'center',
					fixed : true,
					sort : true
				}, {
					field : 'name',
					title : '姓名',
					width : 150,
					align : 'center'
				}, {
					field : 'gender',
					title : '性别',
					width : 90,
					align : 'center'
				}, {
					field : 'student_id',
					title : '考生号',
					width : 210,
					align : 'center',
					sort : true
				}, {
					field : 'card_id',
					title : '前六位身份证号',
					width : 210,
					align : 'center',
					sort : true
				},{
					field : 'point_add',
					title : '加分',
					width : 120,
					align : 'center',
					sort : true
				},{
					field : 'city',
					title : '省市',
					width : 150,
					align : 'center'
				},{
					field : 'county',
					title : '县区',
					width : 150,
					align : 'center'
				},{
					field : 'note',
					title : '备注',
					width : 210,
					align : 'center'
				},{
					title : '操作',
					width : 200,
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
			
			$("#download").click(function(){
		       	table.exportFile(tableIns.config.id,exportData, 'xls');
	        })
	        
		}
		
		table.on('tool(forum)',function(obj) {
			var data = obj.data;
			if (obj.event === 'updateStudent') {
				var index = layui.layer.open({
					title : "编辑学生信息",
					type : 2,
					content : "${ctx}/student/goUpdateStudent?student_id="
							+ data.student_id,
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
			}else if (obj.event === 'deleteStudent') {
				layer.confirm('确定删除该学生吗?', function(index){
			        //向服务端发送删除指令
			        $.ajax({
						type : "post",
						url : "${ctx}/student/deleteStudent",
						dataType : "json",
						data : {
							"student_id" : data.student_id,
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
		});
		
		$(window).one("resize",function() {
			$("#addStudent").click(function() {
				var index = layui.layer.open({
					title : "添加学生",
					type : 2,
					content : "${ctx}/student/goAddStudent",
					success : function(layero,index) {
						setTimeout(function() {
							layui.layer.tips('点击此处返回','.layui-layer-setwin .layui-layer-close',{
								tips : 3
							});
						}, 500)
					}
				})
				layui.layer.full(index);
			})
		}).resize();
		
	</script>
</body>
</html>