<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="../js/bootstrap.min.css" rel="stylesheet">
<script src="../js/jquery.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="../css/bootstrap-responsive.css" />
<link rel="stylesheet" type="text/css" href="../css/style.css" />
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript" src="../js/jquery.sorted.js"></script>
<script type="text/javascript" src="../js/bootstrap.js"></script>
<script type="text/javascript" src="../js/ckform.js"></script>
<script type="text/javascript" src="../js/common.js"></script>
<script type="text/javascript" src="../js/showdate.js"></script>
<style type="text/css">
body {
	font-size: 20px;
	padding-bottom: 40px;
	background-color: #e9e7ef;
	font-size: 17px;
}

.sidebar-nav {
	padding: 9px 0;
}

@media ( max-width : 980px) {
	/* Enable use of floated navbar text */
	.navbar-text.pull-right {
		float: none;
		padding-left: 5px;
		padding-right: 5px;
	}
}
</style>
</head>
<body>
	<h3>
		<strong>基本信息：</strong>
	</h3>
	<table class="table table-condensed">

		<tr>
			<td width="18%" height="30" align="center">用 户 名：</td>
			<td width="82%" class="word_grey"><c:out value="${requestScope.userDetail.userName }"></c:out></td>
		</tr>
		<tr>
			<td height="28" align="center">密&nbsp;&nbsp;&nbsp;&nbsp;码：</td>
			<td height="28">******</td>
		</tr>
		<tr>
			<td height="28" align="center">用户类型：</td>
			<td height="28"><c:choose>
					<c:when test="${requestScope.userDetail.userType eq 0 }">
				学生
			</c:when>
					<c:when test="${requestScope.userDetail.userType eq 1 }">
				教师
			</c:when>
					<c:when test="${requestScope.userDetail.userType eq 2 }">
				管理员
			</c:when>
				</c:choose></td>
		</tr>
		<tr>
			<td width="18%" height="30" align="center">电话号码：</td>
			<td width="82%" class="word_grey"><c:out value="${requestScope.userDetail.userPhone }"></c:out></td>
		</tr>
		<tr>
			<td height="28" align="center">E-mail：</td>
			<td height="28"><c:out value="${requestScope.userDetail.userEmail }"></c:out></td>
		</tr>
		<tr>
			<td height="28" align="center">用户地址：</td>
			<td height="28"><c:out value="${requestScope.userDetail.userAddress }"></c:out></td>
		</tr>
		<tr>
			<td height="28" align="center">创建时间：</td>
			<td height="28"><c:out value="${requestScope.userDetail.userDate }"></c:out></td>
		</tr>
	</table>

	<h3>
		<strong>操作记录：</strong><br>
	</h3>
	&nbsp;&nbsp;&nbsp;&nbsp;
	<strong>授课记录：</strong>

	<table class="table table-condensed">
		<tr>
			<td class="word_grey">序号 &nbsp;</td>
			<td class="word_grey">课程名字 &nbsp;</td>
			<td class="word_grey">报名人数&nbsp;</td>
			<td class="word_grey">课程收费&nbsp;</td>
		</tr>
		<c:forEach items="${requestScope.lectureCourseList }" var="course" varStatus="status">
			<tr>
				<td class="word_grey"><c:out value="${status.count }"></c:out></td>
				<td class="word_grey"><c:out value="${course.courseName }"></c:out></td>
				<td class="word_grey"><c:out value="${course.coursePersonNumber }"></c:out>人</td>
				<c:choose>
					<c:when test="${course.coursePrice eq 0 }">
						<td class="word_grey">免费</td>
					</c:when>
					<c:otherwise>
						<td class="word_grey"><c:out value="${course.coursePrice }"></c:out>￥</td>
					</c:otherwise>
				</c:choose>
			</tr>
		</c:forEach>
	</table>
	<!--/////////////////////////////////////-->
	&nbsp;&nbsp;&nbsp;&nbsp;
	<strong>下载记录：</strong>

	<table class="table table-condensed">
		<tr>

			<td class="word_grey">序号</td>
			<td class="word_grey">下载对象</td>
			<td class="word_grey">下载时间</td>
		</tr>
		<tr>

			<td class="word_grey">1</td>
			<td class="word_grey">复仇者联盟</td>
			<td class="word_grey">2015.03.15</td>
		</tr>
		<tr>

			<td class="word_grey">2</td>
			<td class="word_grey">复仇者联盟</td>
			<td class="word_grey">2015.03.15</td>
		</tr>
	</table>
	<!--/////////////////////////////////////-->
	&nbsp;&nbsp;&nbsp;&nbsp;
	<strong>上传记录：</strong>

	<table class="table table-condensed">
		<tr>

			<td class="word_grey">序号</td>
			<td class="word_grey">上传对象</td>
			<td class="word_grey">上传时间</td>
		</tr>
		<tr>

			<td class="word_grey">1</td>
			<td class="word_grey">复仇者联盟</td>
			<td class="word_grey">2015.03.15</td>
		</tr>
		<tr>
			<td class="word_grey">2</td>
			<td class="word_grey">复仇者联盟</td>
			<td class="word_grey">2015.03.15</td>
		</tr>
	</table>
	<!--/////////////////////////////////////-->
	<h3>
		<strong>已发公告：</strong>
	</h3>
	<table class="table table-condensed">
		<tr>
			<td class="word_grey">序号 &nbsp;&nbsp; &nbsp;&nbsp;</td>
			<td class="word_grey">公告标题 &nbsp;&nbsp; &nbsp;&nbsp;</td>
			<td class="word_grey">公告内容</td>
			<td class="word_grey">操作时间 &nbsp;&nbsp; &nbsp;&nbsp;</td>
			<td class="word_grey">删除</td>
		</tr>
		<tr>
			<td class="word_grey">1</td>
			<td class="word_grey">天王盖地虎</td>
			<td class="word_grey">迟早会有一个对你蠢蠢欲动的人，你要等，别急。</td>
			<td class="word_grey">2015.03.15</td>
			<td class="word_grey"><button type="submit">删除</button></td>
		</tr>
		<tr>
			<td class="word_grey">1</td>
			<td class="word_grey">天王盖地虎</td>
			<td class="word_grey">迟早会有一个对你蠢蠢欲动的人，你要等，别急。</td>
			<td class="word_grey">2015.03.15</td>
			<td class="word_grey"><button type="submit">删除</button></td>
		</tr>
	</table>
	<!--/////////////////////////////////////-->
	<h3>
		<strong>所授课程：</strong>
	</h3>
	<table class="table table-condensed">


		<tr>

			<td class="word_grey">序号 &nbsp;&nbsp; &nbsp;&nbsp;</td>

			<td class="word_grey">课程名称</td>

			<td class="word_grey">删除</td>
		</tr>

		<tr>
			<td class="word_grey">1</td>
			<td class="word_grey">语文</td>

			<td class="word_grey"><button type="submit">删除</button></td>
		</tr>


		<tr>
			<td class="word_grey">1</td>
			<td class="word_grey">数学</td>

			<td class="word_grey"><button type="submit">删除</button></td>
		</tr>
	</table>
</body>
</html>
