<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html >
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title></title>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="../css/bootstrap-responsive.css" />
<link rel="stylesheet" type="text/css" href="../css/style.css" />
<script type="text/javascript" src="../js/jquery2.js"></script>
<script type="text/javascript" src="../js/jquery2.sorted.js"></script>
<script type="text/javascript" src="../js/bootstrap.js"></script>
<script type="text/javascript" src="../js/ckform.js"></script>
<script type="text/javascript" src="../js/common.js"></script>

<style type="text/css">
body {
	font-size: 20px;
	padding-bottom: 40px;
	background-color: #e9e7ef;
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

#page {
	align-content: center;
	margin-top: 20px;
}

#page button {
	margin: 15px;
}
</style>
</head>
<body>
	<form class="form-inline definewidth m20" action="#" method="get">
		<font color="#777777"><strong>教师名称：</strong></font> <input type="text" name="menuname" id="menuname"
			class="abc input-default" placeholder="" value=""
		>&nbsp;&nbsp;
		<button type="submit" class="btn btn-primary">查询</button>
		<a href="teachersAdd.jsp"><button type="button" id="addnew">添加教师</button></a>
	</form>
	<table class="table table-bordered table-hover definewidth m10">
		<thead>
			<tr>
				<th>老师姓名</th>
				<th>Email</th>
				<th>创建时间</th>
				<th>注销账户</th>
			</tr>
		</thead>
		<c:forEach items="${requestScope.teacherList }" var="teacher">
			<tr>
				<td><a href="queryUserDetail?userId=${teacher.userId }"><c:out value="${teacher.userName }"></c:out></a></td>
				<td><c:out value="${teacher.userEmail }"></c:out></td>
				<td><c:out value="${teacher.userDate }"></c:out></td>
				<td><button type="submit">注销</button></td>
			</tr>
		</c:forEach>
		<tr>
			<td><a href="teacherdetail.jsp">nblyp</a></td>
			<td>154987@163.com</td>
			<td>2013.06.22</td>
			<td><button type="submit">注销</button></td>
		</tr>
	</table>

	<div id="page">
		<button onclick="getTeacher(this)" data-page="0" id="home">首&nbsp;页</button>
		<button style="display: none;" onclick="getTeacher(this)" data-page="${requestScope.page - 1 }" id="upper">上一页</button>
		<c:if test="${requestScope.page + 1 lt requestScope.pageCount}">
			<button onclick="getTeacher(this)" data-page="${requestScope.page + 1 }" id="next">下一页</button>
		</c:if>
	</div>

	<script type="text/javascript">
		function getTeacher(target) {
			var page = $(target).attr("data-page");
			$.getJSON("queryUserAjax", {
				page : page,
				type : 1
			}, function(data) {
				var str = "";
				if (typeof (data.userList) != "undefined") {

					for ( var temp in data.userList) {
						str = str + '<tr>' + '<td><a href="teacherdetail.jsp">'
								+ data.userList[temp].userName + '</a></td>' + '<td>'
								+ data.userList[temp].userEmail + '</td>' + '<td>'
								+ data.userList[temp].userDate + '</td>'
								+ '<td><button type="submit">注销</button></td>'
								+ '</tr>';
					}
				}
				$("table").html(str);
				var upper = $("#upper");
				var next = $("#next");
				if (data.page <= 0) {
					upper.css("display", "none");
				} else {
					upper.css("display", "inline-block")
				}
				if (data.page + 1 >= data.pageCount) {
					next.css("display", "none");
				} else {
					next.css("display", "inline-block")
				}
				upper.attr("data-page", data.page - 1);
				next.attr("data-page", data.page + 1);

			});
		}
	</script>
</body>
</html>