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
			<form role="form">
				<table class="table table-hover table-bordered">
					<tbody>
						<tr>
							<td style="width: 170px;">许可名称</td>
							<td><input type="text" class="form-control" id="name"
								placeholder="请输入许可名称"></td>
						</tr>
						<tr>
							<td>字体图标</td>
							<td><input type="text" class="form-control" id="icon"
								placeholder="请输入许可图标"></td>
						</tr>
						<tr>
							<td>链接地址</td>
							<td><input type="text" class="form-control" id="url"
								placeholder="请输入链接地址"></td>
						</tr>
						<tr>
							<td>许可类型</td>
							<td><select id="type" class="form-control">
									<option value="">请选择许可类型</option>
									<option value="menu">菜单</option>
									<option value="button">按钮</option>
									<option value="permission">资源</option>
							</select></td>
						</tr>
						<tr>
							<td>是否可用</td>
							<td><input type="checkbox" id="available" checked></td>
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
			    	var name = $("#name").val();
			    	if ( name == "" ) {
                        layer.msg("许可名称不能为空，请输入", {time:2000, icon:5, shift:6}, function(){});
                        return;
			    	}
			    	//获取select的值
			    	var type= $("#type").val();
			    	if(type == ""){
			    		 layer.msg("请选择许可类型", {time:2000, icon:5, shift:6}, function(){});
	                        return;
			    	}
			    	//复选框是否选中
			    	var available=0;
			    	if($("#available").val()=="on"){
			    		available=1;
			    	}
			    	var loadingIndex = null;
			    	$.ajax({
			    		type : "POST",
			    		url  : "${APP_PATH}/permission/insert",
			    		data : {
			    			"name" : name,
			    			"type" : type,
			    			"icon" : $("#icon").val(),
			    			"url"  : $("#url").val(),
			    			"available" : available,
			    			"parentid"  : "${param.id}"
			    		},
			    		beforeSend : function() {
			    			loadingIndex = layer.msg('处理中', {icon: 16});
			    		},
			    		success : function(result) {
			    			layer.close(loadingIndex);
			    			result=JSON.parse(result)
			    			if ( result.success ) {
		                        layer.msg("许可信息保存成功", {time:1000, icon:6}, function(){
		                        	window.location.href = "${APP_PATH}/permission/index";
		                        });
			    			} else {
		                        layer.msg("许可信息保存失败，请重新操作", {time:2000, icon:5, shift:6}, function(){
		                        	
		                        });
			    			}
			    		}
			    	});
			    });
            });
        </script>
  </body>
</html>
