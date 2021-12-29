<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" import="java.util.*"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>后台页面</title>
<link rel="stylesheet" href="${ctx}/server/amCharts4/css/console.css" />
<link rel="stylesheet" href="${ctx}/server/amCharts4/css/console2.css" />
<link rel="stylesheet" href="${ctx}/server/amCharts4/css/console3.css" />
<link rel="stylesheet" href="${ctx}/server/layui/css/layui.css"
	media="all" />
</head>

<style>
.info-box {
	height: 85px;
	background-color: white;
	background-color: #ecf0f5;
}

.info-box .info-box-icon {
	border-top-left-radius: 2px;
	border-top-right-radius: 0;
	border-bottom-right-radius: 0;
	border-bottom-left-radius: 2px;
	display: block;
	float: left;
	height: 85px;
	width: 85px;
	text-align: center;
	font-size: 45px;
	line-height: 85px;
	background: rgba(0, 0, 0, 0.2);
}

.info-box .info-box-content {
	padding: 5px 10px;
	margin-left: 85px;
}

.info-box .info-box-content .info-box-text {
	display: block;
	font-size: 16px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	text-transform: uppercase;
}

.info-box .info-box-content .info-box-number {
	display: block;
	font-weight: bold;
	font-size: 25px;
}

.major {
	font-weight: 10px;
	color: #01AAED;
}

.main {
	margin-top: 10px;
}

.main .layui-row {
	margin: 10px 0;
}

.info-box i {
	font-size: 1em;
	color: #fff;
}

.tmiddle {
	text-align: center;
	padding-top: 15px !important;
	cursor: pointer
}
</style>


<body style="overflow: auto">
	<div class="layui-fluid main">
		<div class="layui-row layui-col-space15">
			<div class="layui-col-md4">
				<div class="info-box">
					<span class="info-box-icon"
						style="background-color: #1E9FFF !important; color: white;">
						<i class="layui-icon">&#xe612;</i>
					</span>
					<div class="info-box-content tmiddle">
						<span class="info-box-number">${auditorCount}人</span> <span
							class="info-box-text">审核人员总数</span>
					</div>
				</div>
			</div>
			<div class="layui-col-md4">
				<div class="info-box">
					<span class="info-box-icon"
						style="background-color: #FF5722 !important; color: white;">
						<i class="layui-icon">&#xe770;</i>
					</span>
					<div class="info-box-content tmiddle">
						<span class="info-box-number">${lists.get(0).get(0)}人</span> <span
							class="info-box-text">已录入学生人数</span>
					</div>
				</div>
			</div>
			<div class="layui-col-md4">
				<div class="info-box">
					<span class="info-box-icon"
						style="background-color: #009688 !important; color: white;">
						<i class="layui-icon">&#xe715;</i>
					</span>
					<div class="info-box-content tmiddle">
						<span class="info-box-number">${countyCount}</span> <span
							class="info-box-text">已统计县区</span>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div style="padding: 10px 0 0 20px; font-size: 25px;">各省市已审核学生情况:</div>
	<div id="chartdiv"></div>
	<div>
		<div style="width: 50%; float: left;">
			<div style="padding: 10px 0 0 20px; font-size: 25px;">学生性别分布：</div>
			<div id="chartdiv2"></div>
		</div>
		<div style="width: 50%; float: left;">
			<div style="padding: 10px 0 0 20px; font-size: 25px;">学生加分情况：</div>
			<div id="chartdiv3"></div>
		</div>
	</div>


	<script type="text/javascript" src="${ctx}/server/layui/layui.all.js"></script>
	<script type="text/javascript" src="${ctx}/server/amCharts4/core.js"></script>
	<script type="text/javascript" src="${ctx}/server/amCharts4/charts.js"></script>
	<script type="text/javascript"
		src="${ctx}/server/amCharts4/themes/animated.js"></script>


	<script type="text/javascript">
    //省市分布
    am4core.useTheme(am4themes_animated);

	var data = [{
		"city": "贵阳市",
		"units": ${lists.get(0).get(1)},
		"county": [{
			"value": ${lists.get(0).get(2)},
			"title": "南明区"
		}, {
			"value": ${lists.get(0).get(3)},
			"title": "云岩区"
		}, {
			"value": ${lists.get(0).get(4)},
			"title": "花溪区"
		}, {
			"value": ${lists.get(0).get(5)},
			"title": "乌当区"
		}, {
			"value": ${lists.get(0).get(6)},
			"title": "白云区"
		}]
		}, {
		"city": "遵义市",
		"units": ${lists.get(1).get(0)},
		"county": [{
			"value": ${lists.get(1).get(1)},
			"title": "红花岗区"
		}, {
			"value": ${lists.get(1).get(2)},
			"title": "汇川区"
		}]
		}, {
		"city": "铜仁市",
		"units": ${lists.get(2).get(0)},
		"county": [{
			"value": ${lists.get(2).get(1)},
			"title": "碧江区"
		}]
		}, {
		"city": "安顺市",
		"units": ${lists.get(3).get(0)},
		"county": [{
			"value": ${lists.get(3).get(1)},
			"title": "西秀区"
		}, {
			"value": ${lists.get(3).get(2)},
			"title": "平坝区"
		}]
		}, {
		"city": "毕节市",
		"units": ${lists.get(4).get(0)},
		"county": [{
			"value": ${lists.get(4).get(1)},
			"title": "大方县"
		}, {
			"value": ${lists.get(4).get(2)},
			"title": "黔西县"
		}]
		}, {
		"city": "六盘水市",
		"units": ${lists.get(5).get(0)},
		"county": [{
			"value": ${lists.get(5).get(1)},
			"title": "钟山区"
		}, {
			"value": ${lists.get(5).get(2)},
			"title": "六枝特区"
		}]
		}, {
		"city": "黔东南州",
		"units": ${lists.get(6).get(0)},
		"county": [{
			"value": ${lists.get(6).get(1)},
			"title": "黄平县"
		}, {
			"value": ${lists.get(6).get(2)},
			"title": "凯里市"
		}]
		}, {
		"city": "黔西南州",
		"units": ${lists.get(7).get(0)},
		"county": [{
			"value": ${lists.get(7).get(1)},
			"title": "安龙县"
		}, {
			"value": ${lists.get(7).get(2)},
			"title": "兴仁县"
		}]
		}];


		// Create chart instance
		var chart = am4core.create("chartdiv", am4charts.XYChart);


		// Add data
		chart.data = data;

		// Create axes
		var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
		categoryAxis.dataFields.category = "city";
		categoryAxis.renderer.grid.template.location = 0;

		var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
		valueAxis.title.text = "人数";
		valueAxis.min = 0;

		// Create series
		var series = chart.series.push(new am4charts.ColumnSeries());
		series.dataFields.valueY = "units";
		series.dataFields.categoryX = "city";
		series.tooltip.pointerOrientation = "vertical";


		var columnTemplate = series.columns.template;
		// add tooltip on column, not template, so that slices could also have tooltip
		columnTemplate.column.tooltipText = "省市: {categoryX}\n人数: {valueY}";
		columnTemplate.column.tooltipY = 0;
		columnTemplate.column.cornerRadiusTopLeft = 20;
		columnTemplate.column.cornerRadiusTopRight = 20;
		columnTemplate.strokeOpacity = 0;


		// as by default columns of the same series are of the same color, we add adapter which takes colors from chart.colors color set
		columnTemplate.adapter.add("fill", function (fill, target) {
			var gradient = new am4core.LinearGradient();
			var color = chart.colors.getIndex(target.dataItem.index * 2);
			gradient.addColor(color, 0);
			gradient.addColor(color, 1);
			gradient.rotation = -90;
			return gradient;
		});

		// create pie chart as a column child
		var pieChart = series.columns.template.createChild(am4charts.PieChart);
		pieChart.width = am4core.percent(80);
		pieChart.height = am4core.percent(80);
		pieChart.align = "center";
		pieChart.valign = "middle";
		pieChart.dataFields.data = "county";

		var pieSeries = pieChart.series.push(new am4charts.PieSeries());
		pieSeries.dataFields.value = "value";
		pieSeries.dataFields.category = "title";
		pieSeries.labels.template.disabled = true;
		pieSeries.ticks.template.disabled = true;
		pieSeries.slices.template.stroke = am4core.color("#ffffff");
		pieSeries.slices.template.strokeWidth = 2;

		pieSeries.hiddenState.properties.startAngle = -90;
		pieSeries.hiddenState.properties.endAngle = 270;
    	//去除logo
    	var eles = document.querySelectorAll("[aria-labelledby$=-title]")
    	for(var i=0;i<eles.length;i++){
     	eles[i].style.visibility="hidden"
    	}
    </script>


	<script type="text/javascript">
    //性别分布
    am4core.useTheme(am4themes_animated);
    var chart = am4core.create("chartdiv2", am4charts.PieChart);
    chart.data = [{
        "gender": "男",
        "litres": ${lists.get(8).get(0)}
    }, {
        "gender": "女",
        "litres": ${lists.get(8).get(1)}
    }];
    var series = chart.series.push(new am4charts.PieSeries());
    series.dataFields.value = "litres";
    series.dataFields.category = "gender";
    // this creates initial animation
    series.hiddenState.properties.opacity = 1;
    series.hiddenState.properties.endAngle = -90;
    series.hiddenState.properties.startAngle = -90;
    chart.legend = new am4charts.Legend();
    //去除logo
    var eles = document.querySelectorAll("[aria-labelledby$=-title]")
    for(var i=0;i<eles.length;i++){
      eles[i].style.visibility="hidden"
    }
    </script>


	<script type="text/javascript">
    //加分情况
    am4core.useTheme(am4themes_animated);

    var chart = am4core.create("chartdiv3", am4charts.PieChart3D);


    chart.legend = new am4charts.Legend();

    chart.data = [{
        "point_add": "10分",
        "litres": ${lists.get(9).get(0)}
    }, {
        "point_add": "0分",
        "litres": ${lists.get(9).get(1)}
    }];

    chart.innerRadius = am4core.percent(40);

    var series = chart.series.push(new am4charts.PieSeries3D());
    series.dataFields.value = "litres";
    series.dataFields.category = "point_add";
  //去除logo
    var eles = document.querySelectorAll("[aria-labelledby$=-title]")
    for(var i=0;i<eles.length;i++){
      eles[i].style.visibility="hidden"
    }
    </script>

</body>
</html>