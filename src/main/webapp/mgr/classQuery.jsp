<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>

<html>
<head>
<title></title>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="../css/bootstrap-responsive.css" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<script type="text/javascript" src="../js/jquery2.js"></script>
<script type="text/javascript" src="../js/jquery2.sorted.js"></script>
<script type="text/javascript" src="../js/bootstrap.js"></script>
<script type="text/javascript" src="../js/ckform.js"></script>
<script type="text/javascript" src="../js/common.js"></script>
<script type="text/javascript">
function mydelete(op) {
	alert(op);
	$("#myform").attr("action","/course/deleteparent/"+op);
	$("#myform").submit();
	return false;
	
}

</script>

<script type="text/javascript">
$(document).ready(
	$.getJSON("/course/queryAllParent2.action",{},function(data){
		var str = "<table class='table table-bordered table-hover definewidth m10' ><thead><tr><th>大类名称</th><th>查看小类</th><th>小类管理</th><th>修改</th><th>删除</th></tr></thead>";
		for(var i=0;i<data.length;i++){
			str = str + "<tr><td>"+data[i].parentTypeName+"</td><td><select>"
			for(var j=0;j<data[i].clist.length;j++){
				str = str + "<option value="+data[i].clist[j].typeId+">&nbsp;"+data[i].clist[j].typeName+"</option>"
			}
			str = str + "</select></td><td><a href='subjectQuery.jsp?id="+data[i].parentTypeId+"'><button type='submit'>管理小类</button></a></td><td><a href='classUpdate.jsp?id="+data[i].parentTypeId+"'><button type='button' onclick='classUpdate.jsp?id="+data[i].parentTypeId+"'>修改</button></a>"
			+"</td><td><button type='submit' onclick='return mydelete("+data[i].parentTypeId+")'>删除</button></td></tr>";
			
		}
		str = str + "</table>";
		$("#parenttype").html(str);
		
		
	})
	
	
	
	
	
)

</script>

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
</head>
<body>
<form method="post" id="myform" action="">
<input type="hidden" name="_method" value="delete">
</form>
	<form class="form-inline definewidth m20" action="#" method="get">
		<font color="#777777"><strong>大类信息：</strong></font>

	</form>
	<div id="parenttype">
	<table class="table table-bordered table-hover definewidth m10" >
		<thead>
			<tr>
				<th>大类名称</th>
				<th>查看小类</th>
				<th>小类管理</th>
				<th>修改</th>
				<th>删除</th>
			</tr>
		</thead>
	
		<tr>
			<td>娱乐</td>
			<td><select>
					<option value="2">&nbsp;电影</option>
					<option value="7">&nbsp;原创</option>
			</select></td>
			<td><a href="subjectQuery.jsp"><button type="submit">管理小类</button></a></td>
			<td><a href="classUpdate.jsp"><button type="submit">修改</button></a></td>

			<td>
				<button type="submit">删除</button>
			</td>

		</tr>
		<tr>
			<td>娱乐</td>
			<td><select>
					<option value="2">&nbsp;电影</option>
					<option value="7">&nbsp;原创</option>
			</select></td>
			<td><a href="subjectQuery.jsp"><button type="submit">管理小类</button></a></td>
			<td><a href="classUpdate.jsp"><button type="submit">修改</button></a></td>

			<td>
				<button type="submit">删除</button>
			</td>

		</tr>
	</table>
</div>

	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="classAdd.jsp">
		<button type="button" id="addnew">添加大类</button>
	</a>
</body>
</html>