<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>邮件发送成功</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<link rel="stylesheet" href="resource/css/bootstrap.min.css"  type="text/css" />
<script type="text/javascript">
function countDown(secs,surl){     
 //alert(surl);     
 var jumpTo = document.getElementById('jumpTo');
 jumpTo.innerHTML=secs;  
 if(--secs>0){     
     setTimeout("countDown("+secs+",'"+surl+"')",1000);     
     }     
 else{       
     location.href=surl;     
     }     
 }     
</script>
</head>
<body>
<p align="center">
<font color="red">
	<i class="fa fa-angle-double-right fa-lg">&nbsp;
		<span id="jumpTo">5</span>秒后跳转到主页....
	</i>
</font><br><br><br>
<a class="fa fa-hand-o-right btn-info" href="/spring_ibatis/user/index">返回</a>
</p>
<script type="text/javascript">countDown(5,'http://localhost:8080/spring_ibatis/user/index');</script>  
</body>
</html>