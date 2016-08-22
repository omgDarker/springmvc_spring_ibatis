<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:include page="/include/home.jsp" ></jsp:include>
 	<h2 class="sub-header">添加购票信息</h2>
 		<input type="hidden" id="flag" value="1">
		 	<div class="form-group">
		         <label>姓名：</label>
		         <input class="form-control" type="text" id="name" required="required">
		    </div><br>
		    <div class="form-group">
		         <label>年龄：</label>
		         <input class="form-control" type="text" id="age">
		    </div><br>
		    <div class="form-group">
		        <button type="button" class="btn btn-info btn-ms" onclick="add()">
			    		<i class="fa fa-plus-square"></i>&nbsp;添加
			    </button>
		  	</div>
 	</div>
 </div>
</div>
  <script src="http://code.jquery.com/jquery-1.9.0.js"></script>
  <script type="text/javascript">
    function add(){
    	var name=$("#name").val();
    	var age=$("#age").val();
    	var flag=$("#flag").val();
    	$.ajax({     
    	    url:encodeURI(encodeURI('/spring_ibatis/user/add?name='+name+'&age='+age+'&flag='+flag)),      
    	    type:'get',    
    	    cache:false,  
    	    success:function(data) {     
    	      if(data =="su" ){  
    	            
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
