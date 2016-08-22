<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="/include/home.jsp"></jsp:include>
  <h2 class="sub-header">修改${movies.watchmovieName}信息</h2>
  <form action="movie/updateWatchMovie" method="post">
  	<input type="hidden" name="watchmovieId" value="${movies.watchmovieId}">
	 <input type="hidden" name="flag" value="1">
	  	<label>电影名称:</label>
	  		<input class="form-control" type="text" name="watchmovieName" value="${movies.watchmovieName }">
		<label>电影地址:</label>
			<input class="form-control" type="text" name="watchmovieUrl" value="${movies.watchmovieUrl}">
		<label>电影来源:</label>
			<input class="form-control" type="text" name="watchmovieSource" value="${movies.watchmovieSource}">
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
