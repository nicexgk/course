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
<script type="text/javascript" src="../js/bootstrap.js"></script>
<script type="text/javascript" src="../js/ckform.js"></script>
<script type="text/javascript" src="../js/common.js"></script>
<script type="text/javascript" src="../js/jSuggest.js"></script>
<link rel="stylesheet" type="text/css" href="../css/jsuggest.css" />

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

function myserch(){
    var name=$("#menuname").val();
    $.getJSON("querycommentbyname",{name:name,page:1,size:10},function(data){
     
    	
    	if(data==1){
    		alert("用户不存在！")
    	}
		if(data==null||data.list.length<=0){
			$("#mycomment").html("暂无评论");
			
		}else{
			
			var j=1;
			var str="<thead><tr><th>序号</th><th>评价内容</th><th>评价时间</th</tr></thead>";
			for(var i=0;i<data.list.length;i++){
				str=str+"<tr><td>"+j+"</td><td>"+data.list[i].commentContent+"</td><td>"+data.list[i].commentDate+"</td></tr>";
				j++;
			
			}
            $("#myname").html(name);
			$("#mycomment").html(str);
			$("#mypage").html("<a href='javascript:mypage(1,10)'>首页</a>"+
					"<a href='javascript:mypage("+data.lastpage+",10)'>上一页</a>"+
					"<a href='javascript:mypage("+data.nextpage+",10)'>下一页</a>"+
					"<a href='javascript:mypage("+data.pagecount+",10)'>尾页</a>");
			}
	});
}


function myname(op){
	 var name=$("#menuname").val();
	location.href="updateuser?username="+name+"&userban="+op;
	
	
}

</script>

<script type="text/javascript">

function mypage(arg1,arg2){
	var name=$("#menuname").val();
	$.getJSON("querycommentbyname",{name:name,page:arg1,size:arg2},function(data){
		if(data==1){
    		alert("用户不存在！")
    	}
		if(data==null||data.list.length<=0){
			$("#mycomment").html("暂无评论");
			
		}else{

			var j=1;
			var str="<thead><tr><th>序号</th><th>评价内容</th><th>评价时间</th</tr></thead>";
			for(var i=0;i<data.list.length;i++){
				str=str+"<tr><td>"+j+"</td><td>"+data.list[i].commentContent+"</td><td>"+data.list[i].commentDate+"</td></tr>";
				j++;
			}
			$("#myname").val(name);
			$("#mycomment").html(str);
			$("#mypage").html("<a href='javascript:mypage(1,10)'>首页</a>"+
					"<a href='javascript:mypage("+data.lastpage+",10)'>上一页</a>"+
					"<a href='javascript:mypage("+data.nextpage+",10)'>下一页</a>"+
					"<a href='javascript:mypage("+data.pagecount+",10)'>尾页</a>");
			}
	
});
}
</script>

<script type="text/javascript">
	$(document).ready(function() {
		$("#menuname").jSuggest({
			url : "search",
			data : "key",
			autoChange : true
		});
	});
</script>

</head>
<body>
		<font color="#777777"><strong>查询用户：</strong></font> <input type="text" name="menuname"
			id="menuname" class="abc input-default" placeholder="" value="">&nbsp;&nbsp;
		<button type="submit" class="btn btn-primary" onclick="myserch()">查询</button>
		&nbsp;&nbsp; <a href="usercommentlist.jsp"><button type="submit">查询所有用户</button></a>

	<font><strong>用户名称：</strong></font>
	<a href="studentdetail.jsp"> <font><strong id="myname"></strong></font><br></a>
	<font><strong>是否禁言：</strong></font>
	<button type="button" onclick="myname(1)">是</button>
	<button type="button" onclick="myname(0)">否</button>
	<font><strong>评价列表：</strong></font>
	<table id="mycomment" class="table table-bordered table-hover definewidth m10">
		

		
         

	</table>
    <div id="mypage" align="center"></div>
</body>
<script>
	$(function() {

		$('#addnew').click(function() {

			window.location.href = "goodsAdd.html";
		});

	});
</script>
</html>