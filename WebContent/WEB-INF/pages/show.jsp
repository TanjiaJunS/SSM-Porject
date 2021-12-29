<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="ck" uri="http://com.work/common"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>外迁子女高考资格审核系统</title>
<link rel="stylesheet" href="${ctx}/server/layui2.4.5/css/layui.css"
	media="all" />
</head>
<body>
	<style type="text/css">
body {
	
}

.heads {
	background-color: #000000;
	width: 100%;
	height: 40px;
}

.head {
	width: 1100px;
	height: 40px;
	margin: auto;
	padding-top: 8px;
}

.head p {
	font-size: 15px;
	color: #ffffff;
	float: left;
}

#houtai {
	float: right;
}
</style>


	<div class="heads">
		<div class="head">
			<p>欢迎来到${systemInfo.systemName}</p>
			<a href="${ctx}/auditor/goLogin"><p id="houtai">进入后台</p></a>
		</div>
	</div>


	<style type="text/css">
.daohangs {
	width: 100%;
	height: 100px;
	background-color: #143270;
	//#90
	d7ec
	,#76becc,#2585a6,#009688,#33a3dc
}

.daohang {
	width: 1100px;
	margin: auto;
	padding: 20px;
}

.logo {
	float: left;
}

.content {
	float: right;
}

.inputs {
	margin: 10px 5px;
	float: left;
}
</style>

	<div class="daohangs">
		<div class="daohang">
			<div class="logo">
				<img alt="" src="${systemInfo.systemLogo}">
			</div>
			<div class="content">
				<form class="layui-form" action="">
					<div class="inputs">
						<input type="text" name="title" required lay-verify="required"
							placeholder="请输入" autocomplete="off" class="layui-input">
					</div>
					<div class="inputs">
						<button class="layui-btn" lay-submit lay-filter="formDemo">确定</button>
					</div>
				</form>
			</div>
		</div>
	</div>


	<div class="layui-carousel" id="test1">
		<div carousel-item>
			<c:forEach items="${banners}" var="banner">
				<div align="center">
					<img alt="" src="${banner.image}">
				</div>
			</c:forEach>
		</div>
	</div>

	<style type="text/css">
.mids {
	width: 1896px;
	height: 1000px;
}

.mid {
	margin: 5px;
}

.mid-left {
	margin-top: 30px;
	margin-left: 30px;
	width: 400px;
	height: 950px;
	float: left;
}

.mid-right {
	margin-top: 30px;
	margin-left: 140px;
	float: left;
	height: 950px;
	overflow: auto;
}

#title {
	text-align: center;
	font-size: 30px;
}

#txs {
	border-radius: 30px;
	border: 3px inset #f6f5ec;
	height: 900px;
	margin-top: 5px;
	padding: 10px 5px 0 5px;
}
</style>

	<div class="mids">
		<div class="mid">
			<div class="mid-left" id="notice">
				<div id="title">${notice.title}</div>
				<div id="txs">
					<p
						style="text-indent: 50px; font-size: 25px; font-family: Microsoft YaHei;">${notice.content}</p>
				</div>
			</div>
			<div class="mid-right" id="table">
				<fieldset class="layui-elem-field site-demo-button">
					<div style="float: left; margin-left: 200px;">
						<p style="font-size: 25px; font-family: Microsoft YaHei;">2021-2022学年外迁子女高考资格深审核通过名单</p>
					</div>
					<div style="float: right;">
						<button id="download" style="margin-left: 10px;" type="button"
							class="layui-btn ">
							<i class="layui-icon">&#xe601;</i>导出Excel
						</button>
					</div>
				</fieldset>
				<table class="layui-table" id="forum" lay-filter="forum"
					lay-data="{id: 'forum'}"></table>
			</div>
		</div>
	</div>

	<style type="text/css">
footer {
	border: 2px solid black;
	width: 1896px;
	background: #143270;
	height: 250px;
}

.container {
	margin: 30px;
}

.footer_left {
	margin-left: 300px;
	float: left;
}

.link a {
	color: white;
	font-size: 25px;
}

.link span {
	color: white;
	font-size: 25px;
}

.footer_right {
	float: right;
}

.footer-message p {
	padding: 10px 0 0 10px;
	font-size: 15px;
	color: white;
}

.footer_right {
	margin: 50px 400px 0 0;
}
</style>

	<footer>
		<div class="container">
			<div class="footer_left">
				<div class="link">
					<a href="http://soft.ncu.edu.cn/"> 关于我们</a> <span> | </span> <a
						href="http://soft.ncu.edu.cn/"> 联系我们</a> <span> | </span> <a
						href="https://www.ncu.edu.cn/"> 加入我们 </a> <span> | </span> <a
						href="#"> 网站地图 </a> <span> | </span>

				</div>
				<div class="footer-message">
					<p>© ${systemInfo.systemName}</p>
					<p>地址：${systemInfo.addres}</p>
					<p>电话：${systemInfo.phone}</p>
					<p>作者：${systemInfo.author}</p>
					<p>时间：${systemInfo.time}</p>
				</div>
			</div>
			<div class="footer_right">
				<img src="${systemInfo.systemLogo}">
			</div>
			<div class="clear"></div>
		</div>
	</footer>


	<script type="text/javascript"
		src="${ctx}/server/js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript"
		src="${ctx}/server/layui2.4.5/layui.all.js"></script>
	<script>
layui.use('carousel', function(){
  var carousel = layui.carousel;
  //建造实例
  carousel.render({
    elem: '#test1'
    ,width: '100%' //设置容器宽度
    ,arrow: 'always' //始终显示箭头
    ,height: '500'
    //,anim: 'updown' //切换动画方式
  });
});

//页面预加载模块
layui.use([ 'layer', 'table', 'laydate','upload' ], function() {
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
	
	getlist(null,null,null,null,-1);
});

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
			field : 'note',
			title : '备注',
			width : 210,
			align : 'center'
		} ] ],
		page : true,
		limits : [ 10, 15, 20, 50, 100 ],
		limit : 20, //默认采用20
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

</script>
</body>
</html>