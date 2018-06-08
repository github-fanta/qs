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
	<!-- 新建零件页面 -->
	<div class="row" style="margin-top: 40px;margin-left: 180px">
		<div id="partCreate" aria-labelledby="myModalLabel">
			<div  role="document">
				<div class="content">
					<div class="header">
						<h2 class="modal-title" style="margin-left: 260px;margin-bottom: 40px;" id="myModalLabel">新增零件信息</h2>
					</div>
					<div class="body">
						<form class="form-horizontal" id="create_part_form">
							<div class="form-group">
								<label for="create_partName" class="col-sm-2 control-label">零件名称</label>
								<div class="col-sm-10">
									<input style="width: 400px" type="text" class="form-control" id="create_partName" placeholder="零件名称" name="partName">
								</div>
							</div>
							<div class="form-group">
								<label for="create_partRemark"class="col-sm-2 control-label" >零件备注</label>
								<div class="col-sm-10">
									<input style="width: 400px" type="text" class="form-control" id="create_partRemark" placeholder="零件备注" name="partRemark">
								</div>
							</div>
							<div class="form-group">
								<label for="create_partNum" class="col-sm-2 control-label">剩余数量</label>
								<div class="col-sm-10">
									<input style="width: 400px" type="number" class="form-control" id="create_partNum" placeholder="剩余数量" name="partNum">
								</div>
							</div>
							<div class="form-group">
								<label for="create_remark" class="col-sm-2 control-label">备注</label>
								<div class="col-sm-10">
									<input style="width: 400px" type="text" class="form-control" id="create_remark" placeholder="备注" name="remark">
								</div>
							</div>
							<div class="form-group">
								<label for="create_partNumLimit" class="col-sm-2 control-label">安全限额</label>
								<div class="col-sm-10">
									<input style="width: 400px" type="number" class="form-control" id="create_partNumLimit" placeholder="安全限额" name="partNumLimit">
								</div>
							</div>
						</form>
					</div>
					<div class="row">
						<div class="col-md-4"></div>
						<div class="col-md-4">
							<button  type="button" style="margin-top: 10px" class="btn btn-primary " onclick="createPart()">新增零件</button>
						</div>
						<div class="col-md-4"></div>
					</div>
				</div>
			</div>
		</div>
	</div>

<script type="text/javascript">
    function createPart() {
        $.ajax({
            type:"get",
            url:"${pageContext.request.contextPath }/createPart",
            data:$("#create_part_form").serialize(),
			success:function (data) {
                alert("成功添加："+data);
				window.location.replace("${pageContext.request.contextPath}/listPart");
            }
        });
    }
</script>

</body>

</html>
