<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>MOOC视频网站</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="../css/adminStyle.css" rel="stylesheet" type="text/css" />

<link href="css/mycss/manager-index.css" rel="stylesheet" type="text/css" />

<title>MOOC网站管理系统</title>
<script type="text/javascript" src="js/jquery1.js"></script>
<script type="text/javascript">
	$(document).ready(
			function() {
				$(".div2").click(
						function() {
							$(this).next("div").slideToggle("slow").siblings(
									".div3:visible").slideUp("slow");
						});
			});
	function openurl(url) {
		var rframe = parent.document.getElementById("rightFrame");
		rframe.src = url;
	}
</script>

</head>
<body>

	<div class="top1">
		<marquee scrollAmount=2 width=300>数据无价，请谨慎操作！</marquee>
	</div>
	<div class="top2">
		<div class="logo">
			<img src="img/admin_logo.png" title="在哪儿" />
		</div>
		<div class="title">
			<h3>MOOC网站后台管理系统</h3>
		</div>
		<div class="fr top-link">
			<a href="" target="mainCont" title="DeathGhost"><i class="adminIcon"></i><span>管理员：${sessionScope.manager.userName}</span></a>
		</div>
	</div>

	<div class="left">
		<div class="div1">
			<div class="left_top">
				<img src="img/bbb_01.jpg"><img src="img/bbb_02.jpg" id="2"><img src="img/bbb_03.jpg"><img src="img/bbb_04.jpg">
			</div>

			<div class="div2">
				<div class="spgl"></div>
				视频管理
			</div>
			<div class="div3">
				<ul>
					<li><a class="a" href="javascript:void(0);" onClick="openurl('videoQuery.jsp');">查看所有视频</a></li>
					<li><a class="a" href="javascript:void(0);" onClick="openurl('uservideoQuery.jsp');">用户视频列表</a></li>
				</ul>
			</div>
			<div class="div2">
				<div class="spgl"></div>
				文档管理
			</div>
			<div class="div3">
				<ul>
					<li><a class="a" href="javascript:void(0);" onClick="openurl('documentQuery.jsp');">查看所有文档</a></li>
					<li><a class="a" href="javascript:void(0);" onClick="openurl('userdocumentQuery.jsp');">用户文档列表</a></li>

				</ul>
			</div>
			<div class="div2">
				<div class="spgl"></div>
				类别管理
			</div>
			<div class="div3">
				<ul>
					<li><a class="a" href="javascript:void(0);" onClick="openurl('classQuery.jsp');">大类信息</a></li>

				</ul>
			</div>
			<div class="div2">
				<div class="yhgl"></div>
				用户管理
			</div>
			<div class="div3">
				<ul>
					<li><a class="a" href="javascript:void(0);" onClick="openurl('queryStudent');">学生管理</a></li>
					<li><a class="a" href="javascript:void(0);" onClick="openurl('queryTeacher');">老师管理</a></li>
				</ul>
			</div>

			<div class="div2">
				<div class="gggl"></div>
				评价管理
			</div>
			<div class="div3">

				<ul>
					<li><a class="a" href="javascript:void(0);" onClick="openurl('comment');">评价删除</a></li>
					<li><a class="a" href="javascript:void(0);" onClick="openurl('useredit.jsp');">用户禁言</a></li>
				</ul>

			</div>
			<div class="div2">
				<div class="pjgl"></div>
				公告管理
			</div>
			<div class="div3">
				<ul>
					<li><a class="a" href="javascript:void(0);" onClick="openurl('afficheQuery.jsp');">查看公告</a></li>
					<li><a class="a" href="javascript:void(0);" onClick="openurl('afficheAdd.jsp');">添加公告</a></li>
				</ul>
			</div>
			<div class="div2">
				<div class="tcht"></div>
				<a class="a1" href="login.html">退出后台</a>
			</div>
		</div>
	</div>

	<div class="right">
		<iframe id="rightFrame" name="rightFrame" width="100%" height="100%" style="border: 0px solid #CCC; margin: 0; padding: 0;">
	</iframe>
	</div>

</body>
</html>
