<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

	<link rel="stylesheet" href="${APP_PATH}/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="${APP_PATH}/css/font-awesome.min.css">
	<link rel="stylesheet" href="${APP_PATH}/css/main.css">
	<link rel="stylesheet" href="${APP_PATH}/css/doc.min.css">
	<style>
	.tree li {
        list-style-type: none;
		cursor:pointer;
	}
	</style>
  </head>

  <body style="padding:10px;">
	<div class="panel panel-default">
		<div class="panel-heading">
			表单数据
			<div style="float: right; cursor: pointer;" data-toggle="modal"
				data-target="#myModal">
				<i class="glyphicon glyphicon-question-sign"></i>
			</div>
		</div>
		<div class="panel-body">

			<form class="form-horizontal" role="form">
				<table class="table table-hover table-bordered">
					<tbody>
						<tr>
							<td style="width: 200px;">角色名称</td>
							<td><input type="text" class="form-control" id="name"
								value="${role.name}" placeholder="请输入角色名称"></td>
						</tr>
						<tr>
							<td>角色介绍</td>
							<td><input type="text" class="form-control" id="descr"
								value="${role.descr}" placeholder="请输入角色介绍"></td>
						</tr>
						<tr>
							<td>是否可用</td>
							<td><input type="checkbox" id="available"></td>
						</tr>
						<tr>
							<td colspan="2">
								<button id="updateBtn" type="button" class="btn btn-success">
									<i class="glyphicon glyphicon-pencil"></i> 修改
								</button>
								<button id="resetBtn" type="button" class="btn btn-danger">
									<i class="glyphicon glyphicon-refresh"></i> 重置
								</button>
							</td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
	</div>

	<script src="${APP_PATH}/jquery/jquery-2.1.1.min.js"></script>
    <script src="${APP_PATH}/bootstrap/js/bootstrap.min.js"></script>
	<script src="${APP_PATH}/script/docs.min.js"></script>
	<script src="${APP_PATH}/layer/layer.js"></script>
        <script type="text/javascript">
            $(function () {
			   
			    $("#resetBtn").click(function(){
			    	// Jquery[0] ==> DOM
			    	// $(DOM) ==> Jquery
			    	$("#form")[0].reset();
			    });
			    //设置checkbox的值
			    if( ${role.available} == 1){
			    	$("#available").prop('checked', true)
			    }
			   
			    $("#updateBtn").click(function(){
			    	var name = $("#name").val();
			    	if ( name == "" ) {
                        layer.msg("登录账号不能为空，请输入", {time:2000, icon:5, shift:6}, function(){
                        });
                        return;
			    	}
			    	var descr=$("#descr").val();
			    	var available=0;
			   
			    	if($("#available").val()=="on"){
			    		available=1;
			    	}
			    	var loadingIndex = null;
			    	$.ajax({
			    		type : "POST",
			    		url  : "${APP_PATH}/role/update",
			    		data : {
			    			"id" : "${role.id}",
			    			"name" : name,
			    			"descr" : descr,
			    			"available":available
			    			
			    		},
			    		beforeSend : function() {
			    			loadingIndex = layer.msg('处理中', {icon: 16});
			    		},
			    		success : function(result) {
			    			layer.close(loadingIndex);
			    			result=JSON.parse(result)
			    			if ( result.success ) {
		                        layer.msg("角色信息修改成功", {time:1000, icon:6}, function(){
		                        	window.location.href = "${APP_PATH}/role/index";
		                        });
			    			} else {
		                        layer.msg("角色信息修改失败，请重新操作", {time:2000, icon:5, shift:6}, function(){
		                        	
		                        });
			    			}
			    		}
			    	});
			    });
            });
        </script>
  </body>
</html>
