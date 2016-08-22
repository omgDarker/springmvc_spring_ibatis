<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<base href="<%=basePath%>">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Modify Password</title>
	<link rel="stylesheet" href="resource/css/style.css" type="text/css" />
	<link rel="stylesheet" href="resource/css/bootstrap.min.css"  type="text/css" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
</head>
<body style="padding:10px;">
<div class="form-inline">
<form id="validateForm">
 <input type="hidden" id="flag" value="1">
 	<p>
 		<font style="color:red;" size=5><i class="fa fa-user"></i>&nbsp;用户修改密码</font>
 	</p>
 	<div class="form-group">
         <label>用户名：</label>
         <input class="form-control" type="text" name="managerName" id="managerName" required="required">
    </div><br>
    <div class="form-group">
         <label>新密码：</label>
         <input class="form-control" type="password" name="managerPassword1" id="managerPassword1">
    </div><br>
    <div class="form-group">
         <label>新密码(再次确认)：</label>
         <input class="form-control" type="password" name="managerPassword2" id="managerPassword2">
 		 <br><span id="password" style="display:none;"><font color="red">两次密码输入不一致</font></span><br> 
    </div><br>
    <div class="form-group">
        <button id="btn" type="button" class="btn btn-info btn-ms" onclick="modify()" disabled>
	    		<i class="fa fa-plus-square"></i>&nbsp;修改
	    </button>
  	</div>
  </form>	
 </div>
  <script src="resource/js/jquery-1.11.2.min.js"></script>
  <script src="resource/js/jquery.validate.min.js"></script>
  <script type="text/javascript">
	  //两次密码输入是否一致
	  $("#managerPassword2").blur(function(){
		  
	  	var managerPassword1=$("#managerPassword1").val();
	  	var managerPassword2=$("#managerPassword2").val();
	  	
	  	if(managerPassword1!=managerPassword2){
	  		
	  		$("#password").css("display","block");
	  		
	  		$("#btn").attr("disabled","true");
	  	}else{
	  		
			$("#password").css("display","none");
	  		
	  		$("#btn").removeAttr("disabled");
	  	}
	  	
	  });
	  //validate验证(没有提交表单,所以无验证)
	  $("#validateForm").validate({
		  rules:{
			  managerName:{
				  required:true
			  },
			  managerPassword1:{
				  required:true
			  },
			  managerPassword2:{
				  required:true
			  }
		  },
		  message:{
			  managerName:{
				  required:"用户名不能为空!"
			  },
			  managerPassword1:{
				  required:"密码不能为空!"
			  },
			  managerPassword2:{
				  required:"密码不能为空!"
			  }
		  }
	  });
    function modify(){
    	var managerName=$("#managerName").val();
    	var managerPassword=$("#managerPassword1").val();
    	$.ajax({     
    	    url:'/spring_ibatis/login/forgotPassword?managerName='+managerName+'&managerPassword='+managerPassword,      
    	    success:function(data) {     
    	      if(data =="success" ){  
    	           alert("修改成功!");
    	           location.href="/spring_ibatis/login/login.jsp";
    	      }else{     
    	            
    	            alert("修改失败！稍后重试！");   
    	       }     
    	     },     
    	    error : function() {  
    	          alert("服务器忙，稍后重试！");     
    	      }});   
    }
  </script>
</body>
</html>
