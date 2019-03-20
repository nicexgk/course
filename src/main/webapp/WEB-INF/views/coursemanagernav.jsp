<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="../../css/public.css">
	<link rel="stylesheet" href="../../css/comm.css">
	<link rel="stylesheet" href="../../css/list.css">
	<link rel="stylesheet" type="text/css" href="../../layui/css/layui.css">
	<link rel="stylesheet" type="text/css" href="../../css/mycss/home-page-body.css" />
	<link rel="stylesheet" type="text/css" href="../../css/mycss/home-page.css" />
	<link type="text/css" rel="stylesheet" href="../../css/jsuggest.css">
	<link type="text/css" rel="stylesheet" href="../../css/ling.css" />
	<script src="../../layui/layui.js"></script>
	<script src="../../js/jquery.js"></script>
	<script>
		window.onload = function(){
			var contain_left = window.screen.height;	
			
			var left = document.getElementById("contain_left");
			left.style.height = (contain_left-190)+"px";
		};
	</script>
</head>

<body>
	<!--
    	作者：ling
    	时间：2018-11-17
    	描述：课程管理页面导航
    -->
    <!-- header start -->
	<div class="header">
		<div class="header-c">
			<div class="logo">
				<a href="list.jsp"><img src="../../img/logo-min2.png"></a>
			</div>
			<div class="nav">
				<a href="../../index.jsp">首页</a>
				<a href="queryAllCourse.action"	class="nav-bg">课程</a> 
				<a href="#">精选合辑</a> 
				<a href="#">学团</a> 
				<a href="queryAllCourseForManagerList.action">课程管理</a>
			</div>
			<div class="search">
				<select id="">
					<option value="">课程</option>
					<option value="">机构</option>
				</select> <input type="text" class="search-tex"> <input type="submit"
					class="search-btn">
			</div>
			<div class="link">
				<a href="#">登录</a> <a href="help.jsp" id="no-border">帮助</a>
			</div>
		</div>
	</div>
	<!-- header end -->
	<!-- contain start -->
	<div class="contain">
		<!-- contain_left start -->
		<div id="contain_left">
			<ul class="layui-nav layui-nav-tree" lay-filter="test">
				<!-- 侧边导航: <ul class="layui-nav layui-nav-tree layui-nav-side"> -->
			  	<li class="layui-nav-item layui-nav-itemed">
				    <a href="javascript:;">课程管理</a>
				    <dl class="layui-nav-child">
				      	<dd><a href="queryAllCourseForManagerList.action">课程列表</a></dd>
				      	<dd><a href="queryAllCourseTypeForParent.action">添加课程</a></dd>
				      	
				    </dl>
				</li>
				<li class="layui-nav-item">
				    <a href="javascript:;">课程类型管理</a>
				    <dl class="layui-nav-child">
				      	<dd><a href="queryAllCourseForType.action">类型列表</a></dd>
				      	<dd><a href="addcoursetype.jsp">增加类型</a></dd>
				    </dl>
				  	</li>
				  
			</ul>
		</div>
	</div>
	<!-- contain_left end -->
</body>
</html>
<script>
	layui.use('element', function(){
	  	var element = layui.element;	  
	 	 //事件监听	  	
	  	element.on('nav(test)', function(elem){
		  	console.log(elem); //得到当前点击的DOM对象
		});	
	});	
</script>