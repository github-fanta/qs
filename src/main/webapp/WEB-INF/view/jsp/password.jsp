<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

	<script src="http://libs.baidu.com/jquery/2.0.0/jquery.js"></script>
	<link href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.css" rel="stylesheet">
	<script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.js"></script>

</head>

<body>
	<div class="row" style="margin-top: 40px;margin-left: 180px">
		<div id="partCreate" aria-labelledby="myModalLabel">
			<div  role="document">
				<div class="content">
					<div class="header">
						<h2 class="modal-title" style="margin-left: 260px;margin-bottom: 40px;" id="myModalLabel">账户管理</h2>
					</div>
					<div class="body">
						<form class="form-horizontal" id="edit_user_form">
							<div class="form-group">
								<label for="edit_userName" class="col-sm-2 control-label">帐户名</label>
								<div class="col-sm-10">
									<input style="width: 400px" type="text" class="form-control" id="edit_userName" placeholder="帐户名" value="${user.userName}" name="username">
								</div>
							</div>
							<div class="form-group">
								<label for="edit_userPassword"class="col-sm-2 control-label" >密码</label>
								<div class="col-sm-10">
									<input style="width: 400px" type="text" class="form-control" id="edit_userPassword" placeholder="密码" name="password">
								</div>
							</div>

						</form>
					</div>
					<div class="row">
						<div class="col-md-4"></div>
						<div class="col-md-4">
							<button  type="button" style="margin-top: 10px" class="btn btn-primary " onclick="updateUser()">确定</button>
						</div>
						<div class="col-md-4"></div>
					</div>
				</div>
			</div>
		</div>
	</div>

<script type="text/javascript">

    function updateUser() {
        $.ajax({
            type:"post",
			url:"${pageContext.request.contextPath }/updateUser",
			data:$("#edit_user_form").serialize(),
			success:function (data) {
				alert("更改成功！"+data);
                window.location.replace("${pageContext.request.contextPath}/listPart?currentPage=1");
            }
		});
    }
</script>

</body>

</html>
