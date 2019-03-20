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
$(document).ready(function(){

	$.getJSON("queryalluser",{page:1,size:2},function(data){

		if(data==null||data.list.length<=0){
			$("#myuser").html("暂无用户");
			
		}else{
			j=1;
			var str="<thead><tr><th>序号</th><th>真实姓名</th><th>Email</th><th>创建时间</th></tr></thead>";
			for(var i=0;i<data.list.length;i++){         
				str=str+"<tr><td>"+j+"</td><td><a href='studentdetail.jsp'>"+data.list[i].userName+"</a></td><td>"+data.list[i].userEmail+"</td><td>"+data.list[i].userDate+"</td></tr>";
			j++;                                 
			}
		}
			$("#myuser").html(str);
			$("#mypage").html("<a href='javascript:mypage(1,2)'>首页</a>"+
					"<a href='javascript:mypage("+data.lastpage+",2)'>上一页</a>"+
					"<a href='javascript:mypage("+data.nextpage+",2)'>下一页</a>"+
					"<a href='javascript:mypage("+data.pagecount+",2)'>尾页</a>");
			
	});
});


</script>

<script type="text/javascript">

function mypage(arg1,arg2){

	$.getJSON("queryalluser",{page:arg1,size:arg2},function(data){
		if(data==null||data.list.length<=0){
			$("#myuser").html("暂无用户");
			
		}else{
				j=1;
				var str="<thead><tr><th>序号</th><th>真实姓名</th><th>Email</th><th>创建时间</th></tr></thead>";
				for(var i=0;i<data.list.length;i++){
					str=str+"<tr><td>"+j+"</td><td><a href='studentdetail.jsp'>"+data.list[i].userName+"</a></td><td>"+data.list[i].userEmail+"</td><td>"+data.list[i].userDate+"</td></tr>";
				j++;
				}
			}

			$("#myuser").html(str);
			$("#mypage").html("<a href='javascript:mypage(1,2)'>首页</a>"+
					"<a href='javascript:mypage("+data.lastpage+",2)'>上一页</a>"+
					"<a href='javascript:mypage("+data.nextpage+",2)'>下一页</a>"+
					"<a href='javascript:mypage("+data.pagecount+",2)'>尾页</a>");
		
	});
}

</script>
</head>
<body>
	<form class="form-inline definewidth m20" action="#" method="get">
		<font color="#33ccff"><strong>用户名称：</strong></font> <input type="text" name="menuname" id="menuname"
			class="abc input-default" placeholder="" value=""
		>&nbsp;&nbsp;
		<button type="submit" class="btn btn-primary">查询</button>
	</form>
	<table class="table table-bordered table-hover definewidth m10" id="myuser">
		
	</table>
	<div id="mypage" align="center"></div>
</body>
</html>