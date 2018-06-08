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
	<div class="row" style="margin-top: 300px;margin-left: 400px">
		<div id="partCreate" aria-labelledby="myModalLabel">
			<div  role="document">
				<div class="content">
					<div class="body">
						<form class="form-horizontal" id="login_user_form" action="${pageContext.request.contextPath}/login" method="post">
							<div style="margin-left: 140px;" class="col-sm-10 input-group form-group">
								<span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
								<input style="width: 200px;" type="text" class="form-control" placeholder="在此输入密码..."  name="password"/>
								<button  type="submit" class="btn btn-primary ">确定</button>
							</div>
						</form>
					</div>

				</div>
			</div>
		</div>
	</div>

</body>

</html>
