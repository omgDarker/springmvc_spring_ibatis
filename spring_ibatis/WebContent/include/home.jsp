<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<base href="<%=basePath%>">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Darker System</title>
	<link  rel="stylesheet" href="resource/css/style.css" type="text/css" />
	<link  rel="stylesheet" href="resource/css/bootstrap.min.css"  type="text/css" />
	<link  rel="stylesheet" href="resource/css/bootstrap-theme.min.css"  type="text/css" />
	<link  rel="stylesheet" href="resource/css/ibatis.css" type="text/css" />
	<link  rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
	<link  rel="stylesheet"	href="resource/css/dashboard.css" >
	<link  rel="stylesheet" href="resource/css/sb-admin.css">
	<link  rel="icon" href="resource/images/favicon.ico">
	<!-- 
	<link  rel="stylesheet" href="resource/css/font-awesome.min.css"  type="text/css" />
	<link  rel="stylesheet" href="//netdna.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css" >
	-->
	<style type="text/css">
		.error{
			color:red
		}
		h2.pos_abs{
			position:absolute;
			left:300px;
			top:0px
		}
	</style>
</head>
<body style="padding:10px;">
<div id="wrapper">
        <!-- Navigation -->
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="javascript:;">Administrator Darker</a>
            </div>
            <!-- Top Menu Items -->
            <ul class="nav navbar-right top-nav">
            	<!-- 邮件下拉框 -->
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-envelope"></i> <b class="caret"></b></a>
                    <ul class="dropdown-menu message-dropdown">
                        <li class="message-preview">
                            <a href="#">
                                <div class="media">
                                    <span class="pull-left">
                                        <img class="media-object" src="http://placehold.it/50x50" alt="">
                                    </span>
                                    <div class="media-body">
                                        <h5 class="media-heading"><strong>John Smith NO.1</strong></h5>
                                        <p class="small text-muted"><i class="fa fa-clock-o"></i> Yesterday at 12:00 PM</p>
                                        <p>Everything Is Fascinating......</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="message-preview">
                            <a href="#">
                                <div class="media">
                                    <span class="pull-left">
                                        <img class="media-object" src="http://placehold.it/50x50" alt="">
                                    </span>
                                    <div class="media-body">
                                        <h5 class="media-heading"><strong>John Smith NO.2</strong>
                                        </h5>
                                        <p class="small text-muted"><i class="fa fa-clock-o"></i> Today at 12:00 PM</p>
                                        <p>Everything Is Fascinating......</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="message-preview">
                            <a href="#">
                                <div class="media">
                                    <span class="pull-left">
                                        <img class="media-object" src="http://placehold.it/50x50" alt="">
                                    </span>
                                    <div class="media-body">
                                        <h5 class="media-heading"><strong>John Smith NO.3</strong>
                                        </h5>
                                        <p class="small text-muted"><i class="fa fa-clock-o"></i> Tomorrow at 12:00 PM</p>
                                        <p>Everything Is Fascinating......</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="message-footer">
                            <a href="#">Read All New Messages</a>
                        </li>
                    </ul>
                </li>
                <!-- 邮件下拉框 -->
                <!-- 铃声下拉框 -->
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-bell"></i> <b class="caret"></b></a>
                    <ul class="dropdown-menu alert-dropdown">
                        <li>
                            <a href="#">Alert Name <span class="label label-default">Alert Badge</span></a>
                        </li>
                        <li>
                            <a href="#">Alert Name <span class="label label-primary">Alert Badge</span></a>
                        </li>
                        <li>
                            <a href="#">Alert Name <span class="label label-success">Alert Badge</span></a>
                        </li>
                        <li>
                            <a href="#">Alert Name <span class="label label-info">Alert Badge</span></a>
                        </li>
                        <li>
                            <a href="#">Alert Name <span class="label label-warning">Alert Badge</span></a>
                        </li>
                        <li>
                            <a href="#">Alert Name <span class="label label-danger">Alert Badge</span></a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">View All</a>
                        </li>
                    </ul>
                </li>
                <!-- 铃声下拉框 -->
                <!-- 个人信息下拉框 -->
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i><%=request.getSession().getAttribute("ManagerName")%><b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="#"><i class="fa fa-fw fa-user"></i> Profile</a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#"><i class="fa fa-fw fa-gear"></i> Settings</a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="login/logout2"><i class="fa fa-fw fa-power-off"></i> Logout</a>
                        </li>
                        <li class="divider"></li>
                    </ul>
                </li>
                 <!-- 个人信息下拉框 -->
            </ul>
            <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav side-nav" style="text-align:center">
                    <li>
                        <a href="javascript:;"><i class="fa fa-fw fa-dashboard"></i>&nbsp;&nbsp;控制板</a>
                    </li>
                    <li>
                        <a href="user/index"><i class="fa fa-fw fa-user"></i>&nbsp;&nbsp;用户信息</a>
                    </li>
                    <li>
                        <a href="movie/watchmovie1"><i class="fa fa-fw fa-film"></i>&nbsp;&nbsp;贝壳影城</a>
                    </li>
                    <li>
                        <a href="movie/movielist"><i class="fa fa-fw fa-youtube-play"></i>&nbsp;&nbsp;电影信息</a>
                    </li>
                    <li>
                        <a href="javascript:;" data-toggle="collapse" data-target="#demo"><i class="fa fa-fw fa-user-plus"></i>&nbsp;&nbsp;私人订制<i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="demo" class="collapse">
                           <li>
                           		<a href="birthday/birthday"><i class="fa fa-fw fa-desktop"></i>&nbsp;&nbsp;生日记录</a>
                           </li>
                           <li>
                       	   		<a href="email/sendEmail"><i class="fa fa-fw fa-envelope-o"></i>&nbsp;&nbsp;发送邮件</a>
                   		   </li>
                        </ul>
                    </li>
                     <li>
                        <a href="#"><i class="fa fa-fw fa-wrench"></i>&nbsp;&nbsp;未完待续</a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-fw fa-file"></i>&nbsp;&nbsp;未完待续</a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-fw fa-dashboard"></i>&nbsp;&nbsp;未完待续</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </nav>
        <div id="page-wrapper">
            <div class="container-fluid">
              
 