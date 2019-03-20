<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
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
<h3>
	<strong>基本信息：</strong>
</h3>
<!--  
  -- 用户id --
  UserId int auto_increment primary key,
  -- 用户名称 --
  UserName varchar(50),
  -- 用户密码 --
  UserPwd  varchar(128) default '123456',
  -- 用户邮箱 --
  UserEmail varchar(50),
  -- 用户电话 -- 
  UserPhone varchar(11),
  -- 收货地址 --
  UserAddress varchar(500),
  -- 用户图标 --
  UserIcon varchar(200),
  -- 用户类型 0标示普通用户 1标示教师 2标示管理员--
  UserType int ,  
  -- 用户创建时间 --
  UserDate timestamp default current_timestamp()
 -->
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
	<strong>操作记录：</strong>
</h3>
<br>
<strong>订单列表：</strong>

<table class="table table-condensed">
	<tr>
		<td class="word_grey">序号</td>
		<td class="word_grey">订单编号&nbsp;</td>
		<td class="word_grey">订单所对应的课程 &nbsp;</td>
		<td class="word_grey">订单创建的时间&nbsp;</td>
		<td class="word_grey">订单状态&nbsp;</td>
	</tr>
	<c:forEach items="${requestScope.userOrderList }" var="order" varStatus="status">
		<tr>
			<td class="word_grey"><c:out value="${status.count }"></c:out></td>
			<td class="word_grey"><c:out value="${order.orderOn }"></c:out></td>
			<td class="word_grey"><c:out value="${order.orderCourse.courseName }"></c:out></td>
			<td class="word_grey"><c:out value="${order.orderDate }"></c:out></td>
			<c:choose>
				<c:when test="${order.orderStatus eq 0 }">
					<td class="word_grey">待支付</td>
				</c:when>
				<c:when test="${order.orderStatus eq 1 }">
					<td class="word_grey">交易已完成</td>
				</c:when>
				<c:when test="${order.orderStatus eq 2 }">
					<td class="word_grey">订单以取消</td>
				</c:when>
			</c:choose>
		</tr>
	</c:forEach>
</table>
<!--/////////////////////////////////////-->

<!--
// 评论的id
	private Integer commentId;
	// 评论的内容
	private String commentContent;
	// 评论所属的用户
	private UserInfo commentUser;
	// 好评的等级 等级分为5个等级分别对应5颗星 
	private Integer commentGrade;
	// 评论对应的课程
	private Integer commentCourse;
	// 评论的时间
	private String commentDate;
  
-->

<strong>评论记录</strong>
<table class="table table-condensed">
	<tr>
		<td class="word_grey">序号</td>
		<td class="word_grey">评论的课程</td>
		<td class="word_grey">评论的内容</td>
		<td class="word_grey">评论的等级</td>
		<td class="word_grey">评论的时间</td>
	</tr>
	<c:forEach items="${requestScope.commentPojoList }" var="pojo" varStatus="status">
		<tr>
			<td class="word_grey"><c:out value="${tatus.count }"></c:out></td>
			<td class="word_grey"><c:out value="${pojo.course.courseName }"></c:out></td>
			<td class="word_grey"><c:out value="${pojo.comment.commentContent }"></c:out></td>
			<td class="word_grey"><c:out value="${pojo.comment.commentGrade }">星</c:out></td>
			<td class="word_grey"><c:out value="${pojo.comment.commentDate }"></c:out></td>
		</tr>
	</c:forEach>

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
</body>
</html>
