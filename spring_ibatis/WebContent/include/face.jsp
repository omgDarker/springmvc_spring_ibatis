<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<link rel="stylesheet" href="resource/css/css.css" type="text/css" />
<script type="text/javascript" src="resource/js/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="resource/js/kxbdSuperMarquee.js"></script>
<script type="text/javascript" src="resource/js/indexPic.js"></script>
<script type="text/javascript">
jQuery(document).ready(function() {
        $('.indexNews div.core').kxbdSuperMarquee({
            isEqual:false,
            distance:18,
            time:4,
            //btnGo:{up:'#goU',down:'#goD'},
            direction:'up'
        });
    });
</script>
<title>首页</title>
</head>
<body>
<div class="header">
<marquee direction="right">Hello,欢迎来到Darker首页</marquee>&nbsp;&nbsp;<a href="login/login.jsp">请登录</a>
</div>
<div class="outer">
    <div class="banner">
        <div class="flash_img" id="fadImgs">
            <ul class="img-box"  style="">

                <li><a target="_blank" href="#"><img alt="首页AD-1" src="resource/images/1.jpg" width="1980" height="449"></a></li>

                <li><a target="_blank" href="#"><img alt="首页AD-2" src="resource/images/2.jpg" width="1980" height="449"></a></li>

                <li><a target="_blank" href="#"><img alt="首页AD-3" src="resource/images/3.jpg" width="1980" height="449"></a></li>

                <li><a target="_blank" href="#"><img alt="首页AD-4" src="resource/images/4.jpg" width="1980" height="449"></a></li>

            </ul>
        </div>
    </div>
    <div class="indexNews">
        <strong class="fl mr10"><a href="#">News Center</a></strong>
        <div class="core">
          <ul>

            <li><a href="#" title="新闻1">News Title One</a></li>

            <li><a href="#" title="新闻2">News Title Two</a></li>

            <li><a href="#" title="新闻3">News Title Three</a></li>

            <li><a href="#" title="新闻4">News Title Four</a></li>

            <li><a href="#" title="新闻5">News Title Five</a></li>

          </ul>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(function() {
        var len = $(".img-box li").length;
        var imgW = $(".img-box li").width() * len;
        $(".img-box").width(imgW);
        $(".info_slide_dots span").hide();
    })
    $("#fadImgs").slideImg({
        speed: "slow",
        timer: 5000
    });
</script>
</body>
</html>