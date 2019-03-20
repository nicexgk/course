<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<script type="text/javascript">
$(document).ready(function() {
		var typeid1 = document.getElementById("typeid12").value;
		$.getJSON("/course/managerquerytype",{typeid:typeid1},function(data){
			var str = "<table class='table table-bordered table-hover definewidth m10' ><thead><tr><th>小类名称</th><th>大类</th><th>删除</th></tr></thead>";
			for(var i=0;i<data.length;i++){
				str = str + "<tr><td>"+data[i].typeName+"</td><td>"+data[i].parentType.parentTypeName+"</td><td>"
				+"<a onclick='return mydelete("+data[i].typeId+")'><button type='button' >删除</button></a></td></tr>"
			}
			str = str + "</table>";
			var str2 = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href='subjectAdd.jsp?parenttype="+data[1].parentType.parentTypeId+"'><button type='button'  id='addnew'>添加小类</button></a>";
			$("#type").html(str);
			$("#addtype").html(str2);
		})			
})



</script>
<script type="text/javascript">
function mydelete(op) {
	alert(op);
	$("#myform").attr("action","/course/deleteclass/"+op);
	$("#myform").submit();
	return false;
	
}

</script>

<style type="text/css">
body {font-size: 20px;
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
<%String id = request.getParameter("id");%>
<body>
<form method="post" id="myform" action="">
<input type="hidden" name="_method" value="delete">
<input type="hidden"  name="parenttype" value="${param.id}">
</form>
<input type="hidden" id="typeid12" value="${param.id}">
	<form class="form-inline definewidth m20" action="#" method="get">
		 <font color="#777777"><strong>小类信息：</strong></font> 
		
	</form>
	<div id="type">
	<table class="table table-bordered table-hover definewidth m10">
		<thead>
			<tr>
				<th>小类名称</th>
			    <th>介绍</th>
				<th>删除</th>
			</tr>
		</thead>

		<tr>
			<td>娱乐</td>
		    <td>阿斯顿啥放	</td>
			<td>
				<button type="submit">删除</button> 
			</td>

		</tr>
	</table>
	</div>
	<div id="addtype">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="subjectAdd.jsp?parenttype=${param.id}"><button type="submit"  id="addnew">
			添加小类
		</button></a>
		</div>
</body>
 
</html>
