<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<link rel="stylesheet"
	href="${APP_PATH}/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${APP_PATH}/css/font-awesome.min.css">
<link rel="stylesheet" href="${APP_PATH}/css/main.css">
<style>
.tree li {
	list-style-type: none;
	cursor: pointer;
}

table tbody tr:nth-child(odd) {
	background: #F4F4F4;
}

table tbody td:nth-child(even) {
	color: #C00;
}
</style>
</head>

<body style="padding:10px;">
	<div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title">
				<i class="glyphicon glyphicon-th"></i> 数据列表
			</h3>
		</div>
		<div class="panel-body">
			<form class="form-inline" role="form" style="float: left;">
				<div class="form-group has-feedback">
					<div class="input-group">
						<div class="input-group-addon">查询条件</div>
						<input id="queryText" class="form-control has-success" type="text"
							placeholder="请输入查询条件">
					</div>
				</div>
				<button id="queryBtn" type="button" class="btn btn-warning">
					<i class="glyphicon glyphicon-search"></i> 查询
				</button>
			</form>
			<button type="button" class="btn btn-danger" onclick="doDeletes()"
				style="float: right; margin-left: 10px;">
				<i class=" glyphicon glyphicon-remove"></i> 删除
			</button>
			<button type="button" class="btn btn-primary" style="float: right;"
				onclick="window.location.href='${APP_PATH}/role/add'">
				<i class="glyphicon glyphicon-plus"></i> 新增
			</button>
			<br>
			<hr style="clear: both;">
			<div class="table-responsive">
				<form id="roleForm">
					<table class="table table-bordered">
						<thead>
							<tr>
								<th width="30">#</th>
								<th width="30"><input type="checkbox" id="allSelBox"></th>
								<th>角色名称</th>
								<th>角色简介</th>
								<th>创建日期</th>
								<th>创建人ID</th>
								<th width="100">操作</th>
							</tr>
						</thead>

						<tbody id="roleData">

						</tbody>

						<tfoot>
							<tr>
								<td colspan="7" align="center">
									<ul class="pagination">

									</ul>
								</td>
							</tr>

						</tfoot>
					</table>
				</form>
			</div>
		</div>
	</div>
	<script src="${APP_PATH}/jquery/jquery-2.1.1.min.js"></script>
	<script src="${APP_PATH}/bootstrap/js/bootstrap.min.js"></script>
	<script src="${APP_PATH}/script/docs.min.js"></script>
	<script src="${APP_PATH}/layer/layer.js"></script>
	<script type="text/javascript">
	var likeflg = false;
	 $(function () {
			pageQuery(1);
			$("#queryBtn").click(function() {
				var queryText = $("#queryText").val();
				if (queryText == "") {
					likeflg = false;
				} else {
					likeflg = true;
				}
				pageQuery(1);
			});
			$("#allSelBox").click(function() {
				var flg = this.checked;
				$("#roleData :checkbox").each(function() {
					this.checked = flg;
				});
			});
		});

		// 分页查询
		function pageQuery(pageno) {
			var loadingIndex = null;

			var jsonData = {
				"pageno" : pageno,
				"pagesize" : 10
			};
			if (likeflg == true) {
				jsonData.queryText = $("#queryText").val();
			}

			$.ajax({
						type : "POST",
						url : "${APP_PATH}/role/pageQuery",
						data : jsonData,
						beforeSend : function() {
							loadingIndex = layer.msg('处理中', {icon : 16});
						},
						success : function(result) {
							layer.close(loadingIndex);
							result = JSON.parse(result)
							if (result.success) {
								// 局部刷新页面数据
								var tableContent = "";
								var pageContent = "";

								var rolePage = result.data;
								var roles = rolePage.datas;

								$.each(roles,function(i, role) {
													tableContent += '<tr>';
													tableContent += '  <td>'
															+ (i + 1) + '</td>';
													tableContent += '  <td><input type="checkbox" name="roleid" value="'+role.id+'"></td>';
													tableContent += '  <td>'+ role.name+ '</td>';
													tableContent += '  <td>'+ role.descr+ '</td>';
													tableContent += '  <td>'+ role.createTime+ '</td>';
													tableContent += '  <td>'+ role.createId+ '</td>';
													tableContent += '  <td>';
													tableContent += '      <button type="button" onclick="goAssignPage('
															+ role.id
															+ ')" class="btn btn-success btn-xs"><i class=" glyphicon glyphicon-check"></i></button>';
													tableContent += '      <button type="button" onclick="goUpdatePage('
															+ role.id
															+ ')" class="btn btn-primary btn-xs"><i class=" glyphicon glyphicon-pencil"></i></button>';
													tableContent += '	  <button type="button" onclick="doDelete('+role.id+', \''+role.name+'\')" class="btn btn-danger btn-xs"><i class=" glyphicon glyphicon-remove"></i></button>';
													tableContent += '  </td>';
													tableContent += '</tr>';
												});

								if (pageno > 1) {
									pageContent += '<li><a href="#" onclick="pageQuery('
											+ (pageno - 1) + ')">上一页</a></li>';
								} else {
									pageContent += '<li><a onclick="return false;" style="cursor: default;opacity: 0.5;" href="#" >上一页</a></li>';
								}

								for (var i = 1; i <= rolePage.totalno; i++) {
									if (i == pageno) {
										pageContent += '<li class="active"><a  href="#">'
												+ i + '</a></li>';
									} else {
										pageContent += '<li ><a href="#" onclick="pageQuery('
												+ i + ')">' + i + '</a></li>';
									}
								}

								if (pageno < rolePage.totalno) {
									pageContent += '<li><a href="#" onclick="pageQuery('
											+ (pageno + 1) + ')">下一页</a></li>';
								} else {
									pageContent += '<li><a onclick="return false;" style="cursor: default;opacity: 0.5;" href="#" >下一页</a></li>';
								}

								$("#roleData").html(tableContent);
								$(".pagination").html(pageContent);
							} else {
								layer.msg("角色信息分页查询失败", {
									time : 2000,
									icon : 5,
									shift : 6
								}, function() {

								});
							}
						}
					});
		}

		function goAssignPage(id) {
			window.location.href = "${APP_PATH}/role/assign?id=" + id;
		}
		function goUpdatePage(id) {
			window.location.href = "${APP_PATH}/role/edit?id=" + id;
		}

		function doDeletes() {
			var boxes = $("#roleData :checkbox");
			if (boxes.length == 0) {
				layer.msg("请选择需要删除的角色信息", {
					time : 2000,
					icon : 5,
					shift : 6
				}, function() {

				});
			} else {
				layer.confirm("删除选择的角色信息, 是否继续", {
					icon : 3,
					title : '提示'
				}, function(cindex) {
					// 删除选择的角色信息
					$.ajax({
						type : "POST",
						url : "${APP_PATH}/role/deletes",
						data : $("#roleForm").serialize(),
						success : function(result) {
							result = JSON.parse(result)
							if (result.success) {
								pageQuery(1);
							} else {
								layer.msg("角色信息删除失败", {
									time : 2000,
									icon : 5,
									shift : 6
								}, function() {

								});
							}
						}
					});

					layer.close(cindex);
				}, function(cindex) {
					layer.close(cindex);
				});
			}
		}

		function doDelete(id,name) {
			layer.confirm("删除角色信息【" + name + "】, 是否继续", {
				icon : 3,
				title : '提示'
			}, function(cindex) {

				// 删除角色信息
				$.ajax({
					type : "POST",
					url : "${APP_PATH}/role/delete",
					data : {
						id : id
					},
					success : function(result) {
						result = JSON.parse(result)
						if (result.success) {
							pageQuery(1);
						} else {
							layer.msg("角色信息删除失败", {
								time : 2000,
								icon : 5,
								shift : 6
							}, function() {
							});
						}
					}
				});

				layer.close(cindex);
			}, function(cindex) {
				layer.close(cindex);
			});
		}
	</script>
</body>
</html>
