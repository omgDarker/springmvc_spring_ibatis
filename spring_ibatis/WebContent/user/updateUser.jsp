<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:include page="/include/home.jsp"></jsp:include>
 	<h2 class="sub-header">修改${user.userName}信息</h2>
	 	<input type="hidden" id="flag" value="${user.flag }">
		  <label>编号：</label>
		  	<input type="text" id="id" class="form-control" value="${user.userId}" readonly>
		  <label>姓名：</label>
		  	<input type="text" id="name" class="form-control" value="${user.userName }" >
		  <label>年龄：</label>
		  	<input type="text" id="age" class="form-control" value="${user.age }">
	      <input type="button" class="btn btn-info" value="修改"  onclick="modify()">
   </div>
  </div>
 </div>
<script src="http://code.jquery.com/jquery-1.9.0.js"></script>
<script src="resource/js/ie-emulation-modes-warning.js"></script>
<scripe	src="resource/js/ie10-viewport-bug-workaround.js"></scripe>
<script src="resource/js/holder.min.js"></script>
   <script type="text/javascript">
    function modify(){
    	var name=$("#name").val();
    	var age=$("#age").val();
    	var id=$("#id").val();
    	var flag=$("#flag").val();
    	$.ajax({     
    	    url:encodeURI(encodeURI('/spring_ibatis/user/update?userName='+name+'&age='+age+'&userId='+id+'&flag='+flag)),      
    	    type:'get',    
    	    cache:false,  
    	    success:function(data) {     
    	      if(data =="success" ){  
    	           alert("更新成功！"); 
    	           window.location.href="/spring_ibatis/user/index";
    	      }else{     
    	          
    	            alert("添加失败！稍后重试！");   
    	       }     
    	     },     
    	    error : function() {  
    	          alert("服务器忙，稍后重试！");     
    	      }});   

    	
    }
  </script>
</body>
</html>