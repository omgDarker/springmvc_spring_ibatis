<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/include/home.jsp"></jsp:include>
      	<h2 class="sub-header"><i class="fa fa-birthday-cake fa-x"></i>生日记录</h2><br>
      		<a class="btn btn-info btn-xs" href="user/toadd" disabled>
      			<i class="fa fa-plus-square"></i>&nbsp;添加
      		</a>
				<table class="table table-striped">
					<thead>
					<tr> 
						<th style="text-align:center"><i class="fa fa-external-link-square"></i>&nbsp;生日编号</th>
						<th style="text-align:center"><i class="fa fa-user"></i>&nbsp;姓名</th>
						<th style="text-align:center"><i class="fa fa-user-plus"></i>&nbsp;年龄</th>
						<th style="text-align:center"><i class="fa fa-birthday-cake"></i>&nbsp;生日</th>
					 </tr>
					</thead>
					 <tbody>
					<c:forEach var="birthday" items="${list }" >
					 <tr>
					     <td style="text-align:center">${birthday.id}</td>
					     <td style="text-align:center">${birthday.username}</td>
					     <td style="text-align:center">${birthday.age}</td>
					     <td style="text-align:center">${birthday.birthday}</td>
						   					    
					  </tr>    
					  </c:forEach>
					  <tr>
					  	<td width=100%  colspan=5 align="left">
					  	<a class="btn btn-warning" href="movie/movielist">
					  		<i class="fa fa-youtube-play fa-fw"></i>&nbsp;电影信息
					  	</a>
					  	<a class="btn btn-warning" href="email/sendEmail">
					  		<i class="fa fa-envelope-o fa-fw"></i>&nbsp;发送邮件
					  	</a>
					  	</td>
					  </tr>
					  <tr>
					  	<td td width=100%  colspan=4 align="right">
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
		
</script>
 </body>
</html>