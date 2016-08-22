<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="/include/home.jsp"></jsp:include>
<h2 class="sub-header">添加观影信息</h2>
  <form action="movie/addWatchMovie" method="post">
	  		<input type="hidden" name="flag" value="1">
	  		<div class="form-group">
	  				<label>电影名称:</label>
	  				<input class="form-control" type="text" name="watchmovieName"
	  		</div>
	    	<div class="form-group">
		    		<label>电影地址:</label>
		    		<input class="form-control" type="text" name="watchmovieTime">
		    </div>
	    	<div class="form-group">
		    		<label>电影来源:</label>
		    		<input class="form-control" type="text" name="watchmovieSource">
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
