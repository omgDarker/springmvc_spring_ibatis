<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="/include/home.jsp"></jsp:include>
<h2 class="sub-header">添加电影信息</h2>
  <form action="movie/addMovie" method="post">
	  		<input type="hidden" name="flag" value="1">
	  		<div class="form-group">
	  				<label>电影名称:</label>
	  				<input class="form-control" type="text" name="movieName"
	  		</div>
	    	<div class="form-group">
		    		<label>上映时间:</label>
		    		<input class="form-control" type="text" name="movieTime">
		    </div>
	    	<div class="form-group">
		    		<label>电影票价:</label>
		    		<input class="form-control" type="text" name="movieMoney">
		    </div>
	    	<div class="form-group">
	    			<label>影票数量:</label>
	    			<input class="form-control" type="text" name="movieNumber">
	    	</div>
	    	<div class="form-group">
	    			<button type="submit" class="btn btn-info btn-ms" >
	    				<i class="fa fa-plus-square"></i>&nbsp;添加
	    			</button>
	    	</div>
	    </table>
    </form>
   </div>
  </div>
 </div>
  </body>
</html>
