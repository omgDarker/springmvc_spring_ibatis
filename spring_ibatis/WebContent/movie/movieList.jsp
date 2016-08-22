<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/include/home.jsp"></jsp:include>
       <h2 class="sub-header"><i class="fa fa-youtube-play fa-x"></i>电影信息</h2><br>
      		<a class="btn btn-info btn-xs" href="movie/skipAdd">
      			<i class="fa fa-plus-square"></i>&nbsp;新增
      		</a>
				<table class="table table-striped">
					<thead>
						<tr> 
							<th  style="text-align:center"><i class="fa fa-external-link-square"></i>&nbsp;电影编号</th>
							<th  style="text-align:center"><i class="fa fa-external-link-square"></i>&nbsp;电影名称</th>
							<th  style="text-align:center"><i class="fa fa-external-link-square"></i>&nbsp;上映时间</th>
							<th  style="text-align:center"><i class="fa fa-external-link-square"></i>&nbsp;电影票价</th>
							<th  style="text-align:center"><i class="fa fa-external-link-square"></i>&nbsp;影票数量</th>
							<th  style="text-align:center"><i class="fa fa-hand-paper-o"></i>&nbsp;操作</th>
						 </tr>
					</thead>
					<tbody> 
						<c:forEach var="movie" items="${movielist }" >
						 <tr>
						     <td style="text-align:center">${movie.movieId }</td>
						     <td style="text-align:center">${movie.movieName }</td>
						     <td style="text-align:center">${movie.movieTime }</td>
						     <td style="text-align:center">${movie.movieMoney }</td>
						     <td style="text-align:center">${movie.movieNumber }</td>
						     <td style="text-align:center">
							     <a class="btn btn-success btn-xs" href="movie/toUpdateMovie?id=${movie.movieId }">
							     	<i class="fa fa-clipboard"></i>&nbsp;更新
							     </a>
							     <button type="button" class="btn btn-danger btn-xs"  onclick="falseDel(${movie.movieId })" >
							     	<i class="fa fa-trash-o"></i>&nbsp;删除
							     </button>
						     </td>
						  </tr>    
						  </c:forEach>
					  </tbody>
					  <tbody>
						  <tr>
						  	<td td width=100%  colspan=6 align="left">
						  		<a class="btn btn-warning" href="user/index">
						  			<i class="fa fa-users "></i>&nbsp;购票用户
						  		</a>
						  	</td>
					  	  </tr>
					  </tbody>
					  <tbody>
						  <tr>
						  	<td td width=100%  colspan=6 align="right">
						  	<ul class="pagination" id="pagination1"></ul><br>
						  	<i class="fa fa-hand-o-right">&nbsp;
						  		<font id="p1"></font>共${sumTotal}条
						  		<input type="hidden" id="sumpage" value="${sumPage}">
						  		<input type="hidden" id="sumtotal" value="${sumTotal}">
						  	</i>	
						  	</td>
						  </tr>
					 </tbody> 
				</table>
   	 	</div>
  	</div>
 </div>
<script src="resource/js/jquery-1.11.2.min.js"></script>
<script src="resource/js/jqPaginator.js"></script>
<script type="text/javascript">
	
		$.jqPaginator('#pagination1',{
	    	//设置分页的总页数
	        //totalPages: 4,
	        //设置最多显示的页码数
	        visiblePages: 10,
	        //当前页
	        currentPage: 1,
	        //总条数
	        totalCounts:40,
	        //每一页的条数
	        pageSize:8,
	        onPageChange: function (num, type) {
	            $('#p1').text( '第'+ num+'页');
	        }
	    });
		
    	function falseDel(id){
    		
    		if(confirm("确定删除吗?")){
    			
        		$.ajax({
        			url:'/spring_ibatis/movie/deleteMovie?id='+id,
        			type:'get',
        			cache:false,
        			success:function(data){
        				
        				if(data="success"){
        					
        					alert("删除成功!");
        					
        					window.location.href="/spring_ibatis/movie/movielist";
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
</script>
 </body>
</html>