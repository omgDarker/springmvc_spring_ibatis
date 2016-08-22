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
<META content="text/html; charset=UTF-8" http-equiv=content-type>
<META content=text/css http-equiv=Content-Style-Type>
<META name=GENERATOR content="MSHTML 9.00.8112.16520">
<link rel=stylesheet type=text/css href="resource/css/jq.css" media=screen>
<STYLE type=text/css>#main {
	TEXT-ALIGN: center; MARGIN: 20px; BACKGROUND: #fff
}
A.media {
	DISPLAY: block
}
DIV.media {
	MARGIN: auto; FONT-SIZE: small
}
DIV.media DIV {
	FONT-STYLE: italic; COLOR: #888
}
#lr {
	BORDER-BOTTOM: #eee 1px solid; BORDER-LEFT: #eee 1px solid; MARGIN: auto; BORDER-TOP: #eee 1px solid; BORDER-RIGHT: #eee 1px solid
}
DIV.example {
	BORDER-BOTTOM: #ccc 1px dashed; TEXT-ALIGN: left; BORDER-LEFT: #ccc 1px dashed; PADDING-BOTTOM: 20px; MARGIN: 15px 0px; PADDING-LEFT: 20px; PADDING-RIGHT: 20px; BACKGROUND: #ffe; CLEAR: left; BORDER-TOP: #ccc 1px dashed; BORDER-RIGHT: #ccc 1px dashed; PADDING-TOP: 20px
}
</STYLE>
</head>
<body>
<a class=media href="http://jquery.malsup.com/media/guice.pdf">PDF File</a> 
<SCRIPT type=text/javascript src="resource/js/urchin.js"></SCRIPT>
<SCRIPT type=text/javascript src="resource/js/jquery.min.js"></SCRIPT>
<SCRIPT type=text/javascript src="resource/js/chili-1.7.pack.js"></SCRIPT>
<SCRIPT type=text/javascript src="resource/js/jquery.media.js"></SCRIPT>
<SCRIPT type=text/javascript src="resource/js/jquery.metadata.js"></SCRIPT>
<SCRIPT type=text/javascript>
    $(function() {
        $('a.media').media({width:1400, height:800});
    });
</SCRIPT>
<SCRIPT type=text/javascript>
_uacct = "UA-850242-2";
urchinTracker();
</SCRIPT>
</body>
</HTML>
