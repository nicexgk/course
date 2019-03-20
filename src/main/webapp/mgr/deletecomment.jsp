<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
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
</style>
    
 <script type="text/javascript">
 function mydelete(op){
	 location.href="mydeletecomment?commentid="+op;
 }
 
 </script>
    
    
</head>
<body>

	<form class="form-inline definewidth m20" action="#" method="get">
		<font color="#777777"><strong>查询评价：</strong></font> <input type="text" name="menuname" id="menuname"
			class="abc input-default" placeholder="" value=""
		>&nbsp;&nbsp;
		<button type="submit" class="btn btn-primary">查询评价</button>
		&nbsp;&nbsp;
	</form>
	<table class="table table-bordered table-hover definewidth m10">
		<thead>
			<tr>
				<th>序号</th>
				<th>评价内容</th>
				<th>评价人</th>
				<th>评价的课程</th>
				<th>评价时间</th>
				<th>操作</th>
			</tr>
		</thead>
		<c:forEach items="${requestScope.commentPojoList }" var="pojo" varStatus="status">
			<tr>
				<td><c:out value="${status.count }"></c:out></td>
				<td><c:out value="${pojo.comment.commentContent }"></c:out></td>
				<td><a href="queryUserDetail?userId=${pojo.user.userId }"><c:out value="${pojo.user.userName }"></c:out></a></td>
				<td><c:out value="${pojo.course.courseName }"></c:out></td>
				<td><c:out value="${pojo.comment.commentDate }"></c:out></td>
				<td><button onclick="mydelete(${pojo.comment.commentId })">删除</button></td>
			</tr>
		</c:forEach>
		
	</table>
	<div>
		<button id="home" onclick="getComment(this)" data-page="0">首&nbsp;页</button>
		<button id="upper" style="display: none;" onclick="getComment(this)" data-page="0">上一页</button>
		<c:choose>
			<c:when test="${requestScope.pageCount <= 1  }">
				<button id="next" style="display: none;" onclick="getComment(this)" data-page="1">下一页</button>
			</c:when>
			<c:otherwise>
				<button id="next" onclick="getComment(this)" data-page="1">下一页</button>
			</c:otherwise>
		</c:choose>
	</div>
	<script type="text/javascript">
		function getComment(element) {
			var page = $(element).attr("data-page");
			$.getJSON("getComment", {page : page}, function(data) {
				console.log(data);
				var commentPojo = data.commentPojoList;
				var str = "";
				var i = 1;
				for (var temp in commentPojo){
					str += '<tr>'
					+ '<td>' + i + '</td>'
					+ '<td>' + commentPojo[temp].comment.commentContent + '</td>'
					+ '<td><a href="queryUserDetail?userId=' + commentPojo[temp].user.userId +'">' + commentPojo[temp].user.userName + '</a></td>'
					+ '<td>' + commentPojo[temp].course.courseName + '</td>'
					+ '<td>' + commentPojo[temp].comment.commentDate + '</td>'
					+ '<td><button onclick="deleteComment(' + commentPojo[temp].comment.commentId + ')">删除</button></td>'
					+ '</tr>';
					i ++;
				}
				var upper = $("#upper");
				var next = $("#next");
				$("table").html(str);
				if (data.pageCount <= data.page + 1){
					 next.css("display", "none");
				} else {
					 next.css("display", "inline-block");
				}
				if (page - 1 <= 0){
					 upper.css("display", "none");
				} else {
					 upper.css("display", "inline-block");
				}
				upper.attr("data-page", data.page - 1);
				next.attr("data-page", data.page + 1);
			});
		}
	</script>


</body>
</html>
