<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/include/home.jsp"></jsp:include>
       <h2 class="sub-header"><i class="fa fa-film fa-x"></i>观影信息</h2><br>
      		<a class="btn btn-info btn-xs" href="movie/skipAddByWatch">
      			<i class="fa fa-plus-square" ></i>&nbsp;新增
      		</a>
      		<input type="hidden" id="sumtotal" value="${sumTotal}">
			<table class="table table-striped">
				<thead>
					 <tr>
					 	<!--  <th  style="text-align:center"><i class="fa fa-external-link-square"></i>&nbsp;电影序号</th>-->
						<th  style="text-align:center"><i class="fa fa-external-link-square"></i>&nbsp;电影名称</th>
						<!--  <th  style="text-align:center"><i class="fa fa-external-link-square"></i>&nbsp;电影地址</th>-->
						<th  style="text-align:center"><i class="fa fa-external-link-square"></i>&nbsp;电影来源</th>
					 	<th  style="text-align:center"><i class="fa fa-hand-paper-o"></i>&nbsp;操作</th>
					 </tr>
				</thead>
				<tbody id="body">
				  <!--  
					<c:forEach var="watchmovie" items="${watchmovies}" >	 
					 <tr>
					     <td style="text-align:center">${watchmovie.watchmovieId}</td>
					     <td style="text-align:center"><a href="${watchmovie.watchmovieUrl}">${watchmovie.watchmovieName}</a></td>
					     <td style="text-align:center">${watchmovie.watchmovieUrl}</td>
					     <td style="text-align:center">${watchmovie.watchmovieSource}</td>
					     <td style="text-align:center">
						     <a class="btn btn-success btn-xs" href="movie/toUpdateWatchMovie?id=${watchmovie.watchmovieId}">
						     	<i class="fa fa-clipboard"></i>&nbsp;更新
						     </a>
						     <button type="button" class="btn btn-danger btn-xs"  onclick="falseDel(${watchmovie.watchmovieId})" >
						     	<i class="fa fa-trash-o"></i>&nbsp;删除
						     </button>
					     </td>
					  </tr>    
					 </c:forEach>
			 	 -->
				</tbody>
				<tbody>
					  <tr>
					  	<td td width=100%  colspan=6 align="right">
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
 					<td style="text-align:center">
 						<a href="http://www.youku.com/" >优酷视频</a>
 					</td>
 					<td style="text-align:center">
 						<a href="http://tv.sohu.com/" >搜狐视频</a>
 					</td>
 					<td style="text-align:center">
 						<a href="http://v.qq.com//" >腾讯视频</a>
 					</td style="text-align:center">
 					<td style="text-align:center">
 						<a href="http://www.pptv.com/">PPTV</a>
 					</td>
 				</tr>
 				<tr>
 					<td style="text-align:center">
 						<a href="http://www.iqiyi.com/" >爱奇艺</a>
 					</td>
 					<td style="text-align:center">
 						<a href="http://www.letv.com/" >乐视网</a>
 					</td>
 					<td style="text-align:center">
 						<a href="http://video.sina.com.cn/" >新浪视频</a>
 					</td>
 					<td style="text-align:center">
 						<a href="http://www.fun.tv/">风行网</a>
 					</td>
 				</tr>
 				<tr>
 					<td style="text-align:center">
 						<a href="http://v.baidu.com/" >百度视频</a>
 					</td>
 					<td style="text-align:center">
 						<a href="http://www.pps.tv/" >PPS</a>
 					</td>
 					<td style="text-align:center">
 						<a href="http://www.56.com/" >56网视频</a>
 					</td>
 					<td style="text-align:center">
 						<a href="http://www.1905.com/">电影网</a>
 					</td>
 				</tr>
 				<tr>
 					<td style="text-align:center">
 						<a href="http://www.tudou.com/" >土豆网</a>
 					</td>
 					<td style="text-align:center">
 						<a href="http://www.kankan.com/" >迅雷看看</a>
 					</td>
 					<td style="text-align:center">
 						<a href="http://www.cctv.com/" >CCTV</a>
 					</td>
 					<td style="text-align:center">
 						<a href="http://v.hao123.com/">影视大全</a>
 					</td>
 				</tr>
 			</table>	
 			</div>
   	 	</div>
  	</div>
 </div>
 
<script src="resource/js/jquery-1.11.2.min.js"></script>
<script src="resource/js/jqPaginator.js"></script>
<script type="text/javascript">
	$(function(){
	
		var total=parseInt($("#sumtotal").val());
		
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
	            	url:'movie/queryMovieByPage?currentPage='+num,
	            	type:'get',
	            	cache:false,
	            	success:function(data){
	            	
	            		var html="";
	            		
	            		for(var i in data){
	            			html=html+'<tr><td style="text-align:center"><a href="'+data[i].watchmovieUrl+'">'+data[i].watchmovieName+'</a></td><td style="text-align:center">'+data[i].watchmovieSource+'</td><td style="text-align:center"><a class="btn btn-success btn-xs" href="movie/toUpdateWatchMovie?id='+data[i].watchmovieId+'"><i class="fa fa-clipboard"></i>&nbsp;更新</a>&nbsp;<button type="button" class="btn btn-danger btn-xs"  onclick="falseDel('+data[i].watchmovieId +')" ><i class="fa fa-trash-o"></i>&nbsp;删除</button></td></tr>';
	            		}
	            		
	            		$("#body").html(html);
	            	},
	            	error:function(data){
	            		alert("网络错误!");
	            	}
	            });
	        }
	    });
		
    	function falseDel(id){
    		
    		if(confirm("确定删除吗?")){
    			
        		$.ajax({
        			url:'/spring_ibatis/movie/deleteWatchMovie?id='+id,
        			type:'get',
        			cache:false,
        			success:function(data){
        				
        				if(data="success"){
        					
        					alert("删除成功!");
        					
        					window.location.href="/spring_ibatis/movie/watchmovie";
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