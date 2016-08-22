<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="/include/home.jsp"></jsp:include>
  <h2 class="sub-header">修改${movies.movieName}信息</h2>
  <form action="movie/updateMovie" method="post">
  	<input type="hidden" name="movieId" value="${movies.movieId}">
	 <input type="hidden" name="flag" value="1">
	  	<label>电影名称:</label>
	  		<input class="form-control" type="text" name="movieName" value="${movies.movieName }">
		<label>上映时间:</label>
			<input class="form-control" type="text" name="movieTime" value="${movies.movieTime}">
		<label>电影票价:</label>
			<input class="form-control" type="text" name="movieMoney" value="${movies.movieMoney}">
	    <label>影票数量:</label>
	    	<input class="form-control" type="text" name="movieNumber" value="${movies.movieNumber}">
	   	<button class="btn btn-info btn-primary">修改</button>
    	</form>
   </div>
  </div>
</div>
<script src="resource/js/ie-emulation-modes-warning.js"></script>
<scripe	src="resource/js/ie10-viewport-bug-workaround.js"></scripe>
<script src="resource/js/holder.min.js"></script>
 </body>
</html>
