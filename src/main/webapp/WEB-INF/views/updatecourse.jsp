<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    	描述：1.课程概况页面
    -->
	<jsp:include page="/WEB-INF/views/coursemanagernav.jsp"></jsp:include>
	<!-- contain_right start -->
	<div id="contain_right">
		<form class="layui-form" action="">
			<div class="layui-form-item">
			    <label class="layui-form-label">课程名称</label>
			    <div class="layui-input-block" >
			    	<input type="text" name="coursename" lay-verify="required" value="${requestScope.course.getCourseName() }" class="layui-input" style="width:250px;">
			    </div>
			</div>
			<div class="layui-form-item">
			    <label class="layui-form-label">所属类目</label>
			   	<div class="layui-input-block">
			    	<div class="firstselect" >
			    		<select id="select1" lay-filter="myselect" name="parenttype" onchange="setSecond()">
					        <option value="0">请选择</option>
					        <c:forEach items="${requestScope.list }" var="coursetype">
					        	<c:if test="${coursetype.getParentTypeId() == requestScope.course.getCourseType().getParentType().getParentTypeId() }">
					        		<option value="${coursetype.getParentTypeId()}" selected>${coursetype.getParentTypeName() }</option>
					        	</c:if>
					        	<c:if test="${coursetype.getParentTypeId() != requestScope.course.getCourseType().getParentType().getParentTypeId() }">
					        		<option value="${coursetype.getParentTypeId()}" >${coursetype.getParentTypeName() }</option>
					        	</c:if>
					        
					        </c:forEach>
			      		</select>
			    	</div>
			    	<div class="firstselect">
		 				<select id="select2" name="coursetype" style="width:170px;">
					    	<option value="${requestScope.course.courseType.getTypeId() }">${requestScope.course.courseType.getTypeName() }</option>    
				      	</select>
			    	</div>
			      	
			    </div>
			</div>
			<div class="layui-form-item" id="upload-thumb">
			    <label class="layui-form-label">课程封面</label>
			    <div class="layui-upload-list">
			    	<img class="layui-upload-img" name="courseimg" id="courseimg" width="150" height="150" src="../../courseimages/c01.jpg">
			    </div>
			    <label class="layui-form-label"></label>
			    <button type="button" id="uploadimg" class="layui-btn layui-btn-primary">添加课程</button>
			    <input type="file" name="file" class="layui-upload-file" />
			    <input type="hidden" name="pic" id="pic" value=" " >
			</div>
			<div class="layui-form-item layui-form-text">
			    <label class="layui-form-label">课程简介</label>
			    <div class="layui-input-block">
			      <textarea name="desc" placeholder="" class="layui-textarea" style="width:300px;height: 130px;"></textarea>
			    </div>
			</div>
			<div class="layui-form-item">
				<div class="layui-input-block">
			      	<button class="layui-btn" lay-submit lay-filter="addcoursesubmit">立即提交</button>
			      	<button type="reset" class="layui-btn layui-btn-primary">重置</button>
			    </div>
			</div>
		</form>	
	</div>
	<!-- contain_right end -->	
</body>
</html>
<script>
	function setSecond(){
		alert(document.getElementById("select1").value);
		var select1 = $("#select1").val();
		alert(select1);
		
	}
	layui.use(['element','upload','form','layer'], function(){
	  	var element = layui.element,upload = layui.upload
	  		,form = layui.form,layer=layui.layer;
	  	
	 	 //一些事件监听
	  	element.on('tab(demo)', function(data){
	  		console.log(data);
	 	});
	  	element.on('nav(test)', function(elem){
		  	console.log(elem); //得到当前点击的DOM对象
		});	
	  	// 图片上传
		upload.render({
			elem:'#uploadimg',
			url:'/course/uploadImg.action',
			accept:'file',
			exts:'img|jpg|jpeg|png',
			done:function(res){
				// 如果上传失败
				if(res.status == "1"){
					//alert("上传成功");
					
					// alert($("img[name='courseimg']").attr("src"));
					$("#courseimg").attr("src",res.picurl);
					//alert($("#courseimg").attr("src"));
		           	$("#upload-thumb").append("<input type='hidden' name='photo' value='"+res.picurl+"'>");
				}else if(res.status == "0"){
					alert("上传成功");
				}
			},
			error:function(){
				// 演示失败状态，并实现重传
				
			}
		});
		form.render();
		// 表单局部更新
		form.on('select(myselect)',function(data){
			if(data.value==0){
				$("#select2").html("");
				form.render('select');
			}else{
				$.ajax({
			 		type:"get",
			 		url:"queryCourseTypeForPid.action ",
			 		async:true, 	//是否异步
			 		data:{selectvalue:data.value},
			 		success:function(data){
			 			res = $.parseJSON(data);	// 将字符串的json数组转成json类型的json数组
			 			var str = "";
			 			for(var i=0;i<res.length;i++){
			 				str+="<option value='"+res[i].typeId+"'>"+res[i].typeName+"</option>"
			 			}
			 			$("#select2").html(str);
			 			form.render('select');
			 		
			 		}
			 	});
			}
		 	
		});
		// 表单提交
		form.on('submit(addcoursesubmit)',function(data){
			var coursename = $("input[name='coursename']").val();
			var photo = $("input[name='photo']").val();
			var parenttypeid = $("#select1").val();
			var coursetypeid = $("#select2").val();
			alert(parenttypeid);
			$.post("addCourse.action",{coursename:coursename,photo:photo,parenttypeid:parenttypeid,coursetypeid:coursetypeid},function(res){
				if(res=="1"){
					console.log('添加成功');
					alert("添加成功 ");
				}else{
					console.log('添加成功');
					alert("添加失败 ");
				}
			})
		    //return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
		});
	});
	
</script>