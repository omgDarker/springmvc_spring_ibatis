<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/include/home.jsp"></jsp:include>
      	<h2 class="sub-header"><i class="fa fa-user fa-x"></i>购票用户</h2><br>
      		<a class="btn btn-info btn-xs" href="user/toadd">
      			<i class="fa fa-plus-square"></i>&nbsp;新增
      		</a>
      			<input type="hidden" id="sumTotal" value="${sumTotal}">
				<table class="table table-striped">
					<thead>
						<tr> 
							<th style="text-align:center"><i class="fa fa-external-link-square"></i>&nbsp;用户编号</th>
							<th style="text-align:center"><i class="fa fa-user"></i>&nbsp;用户名</th>
							<th style="text-align:center"><i class="fa fa-user-plus"></i>&nbsp;用户年龄</th>
							<th style="text-align:center"><i class="fa fa-hand-paper-o"></i>&nbsp;操作</th>
						 </tr>
					 </thead>
					 <tbody id="body">
					 </tbody>
					 <tbody>
						 <tr>
						  	<td width=100%  colspan=5 align="left">
						  	<a class="btn btn-warning" href="movie/movielist">
						  		<i class="fa fa-youtube-play fa-fw"></i>&nbsp;电影信息
						  	</a>
						  	<a class="btn btn-warning" href="email/sendEmail">
						  		<i class="fa fa-envelope-o fa-fw"></i>&nbsp;发送邮件
						  	</a>
						  		<a class="btn btn-warning" href="file/index">
						  		<i class="fa fa-file-pdf-o fa-fw"></i>&nbsp;PDF在线预览
						  	</a>
						  	</td>
						  </tr>
					   </tbody>
					   <tbody>
						  <tr>
						  	<td td width=100%  colspan=4 align="right">
						  	<ul class="pagination" id="pagination1"></ul><br>
						  	<i class="fa fa-hand-o-right">&nbsp;
						  		<font id="p1"></font>共${sumTotal}条
						  	</i>
						  	</td>
						  </tr>
					  </tbody>
				</table>
			<div>
				<i class="fa fa-hand-grab-o fa-2x">&nbsp;<font color="#00FFFF">合作伙伴</font></i><br>
				<table class="table">
					<tr>
						<td style="text-align:center"><a href="http://www.youku.com/">优酷视频</a>
						</td>
						<td style="text-align:center"><a href="http://tv.sohu.com/">搜狐视频</a>
						</td>
						<td style="text-align:center"><a href="http://v.qq.com//">腾讯视频</a>
						</td style="text-align:center">
						<td style="text-align:center"><a href="http://www.pptv.com/">PPTV</a>
						</td>
					</tr>
					<tr>
						<td style="text-align:center"><a href="http://www.iqiyi.com/">爱奇艺</a>
						</td>
						<td style="text-align:center"><a href="http://www.letv.com/">乐视网</a>
						</td>
						<td style="text-align:center"><a
							href="http://video.sina.com.cn/">新浪视频</a></td>
						<td style="text-align:center"><a href="http://www.fun.tv/">风行网</a>
						</td>
					</tr>
					<tr>
						<td style="text-align:center"><a href="http://v.baidu.com/">百度视频</a>
						</td>
						<td style="text-align:center"><a href="http://www.pps.tv/">PPS</a>
						</td>
						<td style="text-align:center"><a href="http://www.56.com/">56网视频</a>
						</td>
						<td style="text-align:center"><a href="http://www.1905.com/">电影网</a>
						</td>
					</tr>
					<tr>
						<td style="text-align:center"><a href="http://www.tudou.com/">土豆网</a>
						</td>
						<td style="text-align:center"><a href="http://www.kankan.com/">迅雷看看</a>
						</td>
						<td style="text-align:center"><a href="http://www.cctv.com/">CCTV</a>
						</td>
						<td style="text-align:center"><a href="http://v.hao123.com/">影视大全</a>
						</td>
					</tr>
				</table>
			</div>
            <!-- /.container-fluid -->
        </div>
        <!-- /#page-wrapper -->
    </div>
    <!-- /#wrapper -->
  </div>
<script src="resource/js/jquery-1.11.2.min.js"></script>
<script	src="resource/js/bootstrap.min.js"></script>
<script src="resource/js/jqPaginator.js"></script>
<script src="resource/js/ie-emulation-modes-warning.js"></script>
<scripe	src="resource/js/ie10-viewport-bug-workaround.js"></scripe>
<script src="resource/js/holder.min.js"></script>
<script type="text/javascript">
$(function(){

	var total=parseInt($("#sumTotal").val());
	
	$.jqPaginator('#pagination1',{
	    	//设置分页的总页数
	        //totalPages: 4,
	        //设置最多显示的页码数
	        //visiblePages: 10,
	        //当前页
	        currentPage: 1,
	        //总条数
	        totalCounts:total,
	        //每一页的条数
	        pageSize:7,
	        onPageChange: function (num, type) {
	        
	           	$('#p1').text( '第'+ num+'页');
	          
	           		$.ajax({
	           		url:'/spring_ibatis/user/queryUser',
	           		data:{currentPage:num},
	           		type:'get',
	           		dataType:'json',
	           		cache:false,
	           		success:function(data){
	           			var html="";
			        	for(var i=0;i<data.length;i++){
			        	html = html+'<tr><td style="text-align:center">' + data[i].userId + '</td> <td style="text-align:center">' + data[i].userName + '</td><td style="text-align:center">' + data[i].age  + '</td><td style="text-align:center"><a class="btn btn-success btn-xs" href="user/toUpdate?id=' + data[i].userId + '"><i class="fa fa-clipboard"></i>&nbsp;更新</a>&nbsp;<button  type="button" class="btn btn-danger btn-xs"  onclick="falseDel(' + data[i].userId + ')" ><i class="fa fa-trash-o"></i>&nbsp;删除</button></td>';
			        	}
			        	console.log(html);
			        	$("#body").html(html);
			        },
	           		error:function(data){
	           			alert("网络故障!");
	           		}
	           	});
	           	
		      }
	    });
		
    	function falseDel(id){
    		
    		if(confirm("确定删除吗?")){
    			
        		$.ajax({
        			url:'/spring_ibatis/user/falseDel?id='+id,
        			type:'get',
        			cache:false,
        			success:function(data){
        				
        				if(data="success"){
        					
        					alert("删除成功!");
        					
        					window.location.href="/spring_ibatis/user/index";
        				}else{
        					
        					alert("删除失败!");
        				}
        			},
        			error:function(data){
        				
        				alert("网络故障,请重试!");
        			}
        			
        		});
    		}
    		
    	};
});
	
</script>
 </body>
</html>