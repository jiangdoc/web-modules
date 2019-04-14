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
<body style="padding: 10px;">
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
							<td style="width: 200px;">登陆账号</td>
							<td><input type="text" class="form-control" id="username"
								placeholder="请输入登陆账号"></td>
						</tr>
						<tr>
							<td style="width: 200px;">登陆密码</td>
							<td><input type="text" class="form-control" id="password"
								placeholder="请输入用户密码"></td>
						</tr>
						<tr>
							<td style="width: 200px;">密码盐值</td>
							<td><input type="text" class="form-control" id="salt"
								placeholder="请输入密码盐值"></td>
						</tr>
						<tr>
							<td>是否锁定</td>
							<td><input type="checkbox" id="locked" ></td>
						</tr>
						<tr>
							<td colspan="2">
								<button id="insertBtn" type="button" class="btn btn-success">
									<i class="glyphicon glyphicon-plus"></i> 新增
								</button>
								<button type="button" class="btn btn-danger">
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
			    $("#insertBtn").click(function(){
			    	var username = $("#username").val();
			    	if ( username == "" ) {
                        layer.msg("登录账号不能为空，请输入", {time:2000, icon:5, shift:6}, function(){ });
                        return;
			    	}
			    	var password = $("#password").val();
			    	if ( password == "" ) {
                        layer.msg("登录密码不能为空，请输入", {time:2000, icon:5, shift:6}, function(){ });
                        return;
			    	}
			    	//复选框是否选中
			    	var locked=0;
			    	if($("#locked").val()=="on"){
			    		locked=1;
			    	}
			    	var loadingIndex = null;
			    	$.ajax({
			    		type : "POST",
			    		url  : "${APP_PATH}/user/insert",
			    		data : {
			    			"username" : username,
			    			"password"  : password,
			    			"salt"     : $("#salt").val(),
			    			"locked" : locked
			    		},
			    		beforeSend : function() {
			    			loadingIndex = layer.msg('处理中', {icon: 16});
			    		},
			    		success : function(result) {
			    			layer.close(loadingIndex);
			    			result = JSON.parse(result)
			    			if ( result.success ) {
		                        layer.msg("用户信息保存成功", {time:1000, icon:6}, function(){
		                        	window.location.href = "${APP_PATH}/user/index";
		                        });
			    			} else {
		                        layer.msg("用户信息保存失败，请重新操作", {time:2000, icon:5, shift:6}, function(){ });
			    			}
			    		}
			    	});
			    });
            });
        </script>
</body>
</html>
