<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="zh-CN" dir="ltr">
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>Online View PDF</title>
<script type="text/javascript" src="resource/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="resource/js/jquery.media.js"></script>
<script type="text/javascript">
    $(function() {
        $('a.media').media({width:1500, height:1000});
    });
</script>
</head>
<body>
<a class="media" href="http://jquery.malsup.com/media/guice.pdf"></a>
</body>
</html>