<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<div class="panel-body">
			<form id="roleForm" role="form" class="form-inline">
				<input type="hidden" name="userid" value="${user.id}">
				<div class="form-group">
					<label for="exampleInputPassword1">未分配角色列表</label><br> <select
						id="leftList" name="unassignroleids" class="form-control" multiple
						size="10" style="width: 200px; overflow-y: auto;">
						<c:forEach items="${unassignRoles}" var="role">
							<option value="${role.id}">${role.name}</option>
						</c:forEach>
					</select>
				</div>
				<div class="form-group">
					<ul>
						<li id="left2RightBtn"
							class="btn btn-default glyphicon glyphicon-chevron-right"></li>
						<br>
						<li id="right2LeftBtn"
							class="btn btn-default glyphicon glyphicon-chevron-left"
							style="margin-top: 20px;"></li>
					</ul>
				</div>
				<div class="form-group" style="margin-left: 40px;">
					<label for="exampleInputPassword1">已分配角色列表</label><br> <select
						id="rightList" name="assignroleids" class="form-control" multiple
						size="10" style="width: 200px; overflow-y: auto;">
						<c:forEach items="${assingedRoles}" var="role">
							<option value="${role.id}">${role.name}</option>
						</c:forEach>
					</select>
				</div>
			</form>
		</div>
	</div>
	<script src="${APP_PATH}/jquery/jquery-2.1.1.min.js"></script>
    <script src="${APP_PATH}/bootstrap/js/bootstrap.min.js"></script>
	<script src="${APP_PATH}/script/docs.min.js"></script>
	<script src="${APP_PATH}/layer/layer.js"></script>
        <script type="text/javascript">
            $(function () {
			    $(".list-group-item").click(function(){
				    if ( $(this).find("ul") ) {
						$(this).toggleClass("tree-closed");
						if ( $(this).hasClass("tree-closed") ) {
							$("ul", this).hide("fast");
						} else {
							$("ul", this).show("fast");
						}
					}
				});    
			    $("#left2RightBtn").click(function(){
			    	var opts = $("#leftList :selected");
			    	if ( opts.length == 0 ) {
                        layer.msg("请选择需要分配的角色数据", {time:2000, icon:5, shift:6}, function(){ });
			    	} else {
			    		
			    		$.ajax({
			    			type : "POST",
			    			url  : "${APP_PATH}/user/doAssign",
			    			data : $("#roleForm").serialize(),
			    			success : function(result) {
			    				result = JSON.parse(result)
			    				if ( result.success ) {
			    					$("#rightList").append(opts);
			                        layer.msg("分配角色数据成功", {time:2000, icon:6}, function(){
			                        });
			    				} else {
			                        layer.msg("分配角色数据失败", {time:2000, icon:5, shift:6}, function(){
			                        });
			    				}
			    			}
			    		});
			    	}
			    });
			    $("#right2LeftBtn").click(function(){
			    	var opts = $("#rightList :selected");
			    	if ( opts.length == 0 ) {
                        layer.msg("请选择需要取消分配的角色数据", {time:2000, icon:5, shift:6}, function(){});
			    	} else {
			    		$.ajax({
			    			type : "POST",
			    			url  : "${APP_PATH}/user/dounAssign",
			    			data : $("#roleForm").serialize(),
			    			success : function(result) {
			    				result =JSON.parse(result)
			    				if ( result.success ) {
			    					$("#leftList").append(opts);
			                        layer.msg("取消分配角色数据成功", {time:2000, icon:6}, function(){
			                        });
			    				} else {
			                        layer.msg("取消分配角色数据失败", {time:2000, icon:5, shift:6}, function(){});
			    				}
			    			}
			    		});
			    	}
			    });
            });
        </script>
  </body>
</html>
