<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8">
	<script src="http://libs.baidu.com/jquery/2.0.0/jquery.js"></script>
	<link href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.css" rel="stylesheet">
	<script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.js"></script>

<title>零件管理</title>
	<style type="text/css">
        table{
            width:100px;
            table-layout:fixed;/* 只有定义了表格的布局算法为fixed，下面td的定义才能起作用。 */
        }
        td{
            width:100%;
            word-break:keep-all;/* 不换行 */
            white-space:nowrap;/* 不换行 */
            overflow:hidden;/* 内容超出宽度时隐藏超出部分的内容 */
            text-overflow:ellipsis;/* 当对象内文本溢出时显示省略标记(...) ；需与overflow:hidden;一起使用*/
            -o-text-overflow:ellipsis;
            -icab-text-overflow: ellipsis;
            -khtml-text-overflow: ellipsis;
            -moz-text-overflow: ellipsis;
            -webkit-text-overflow: ellipsis;
        }
	</style>
</head>

<body>
<div>
			<!--右侧-->
			<div class="modal-content ">
				<!--右上-->
				<div class="panel panel-default"  style="border: 0px;margin-bottom: 0px">
				<div class="panel-body">
					<form class="form-inline" action="${pageContext.request.contextPath }/searchPart" method="get">
						<div class="form-group">
							<label for="searchName">
								<input placeholder="在此搜索零件名..." type="text" class="form-control" id="searchName" name="searchName" >
							</label>
							<button type="submit" class="btn btn-primary">查询</button>
						</div>
					</form>
				</div>
				</div>
				<!--右下-->
				<div class="panel panel-default" style="margin: 0px;">
					<div class="panel-heading">零件信息列表</div>
					<!-- /.panel-heading -->
					<table class="table table-bordered table-striped table-hover" >
						<thead>
						<tr class="success">
							<th class="text-center">零件号</th>
							<th class="text-center">零件备注</th>
							<th class="text-center">数量</th>
							<th class="text-center">备注</th>
							<th class="text-center">出库数量</th>
							<th class="text-center">入库数量</th>
							<th class="text-center">安全库存限额</th>
							<th class="text-center">操作</th>
						</tr>
						</thead>
						<tbody>
						<c:forEach items="${page.partList}" var="part">
							<tr>
								<c:choose>
									<c:when test="${part.partNum <= part.partNumLimit}">
										<td class="text-center" style="background-color: #a94442" >${part.partName}</td>
									</c:when>
									<c:otherwise >
										<td class="text-center">${part.partName}</td>
									</c:otherwise>
								</c:choose>
								<td class="text-center">${part.partRemark}</td>
								<td class="text-center" id="partNum_${part.partId}">${part.partNum}</td>
								<td class="text-center">${part.remark}</td>
								<td class="text-center"><input style="margin: 0px;height: 23px;width: 55px;" id="outPut_${part.partId}" type="number" ><button style="margin-left: 2px" class="btn btn-info btn-xs" onclick="outPut(${part.partId},'outPut_${part.partId}',${part.partNum})">出库</button></td>
								<td class="text-center"><input style="margin: 0px;height: 23px;width: 55px;" id="inPut_${part.partId}" type="number" ><button style="margin-left: 2px" class="btn btn-info btn-xs" onclick="inPut(${part.partId},'inPut_${part.partId}',${part.partNum})">入库</button></td>
								<td class="text-center">${part.partNumLimit}</td>
								<td class="text-center">
									<a href="#" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#customerEditDialog" onclick="editPart(${part.partId})">修改</a>
								</td>
							</tr>
						</c:forEach>
						</tbody>

					</table>

                    <div class="row">
                        <!--分页-->
                        <div class="col-md-9 text-right" style="margin-top: 40px;">
                            共${page.total}条记录 共${page.pageCount}页&nbsp 第${page.currentPage}页
                        </div>
                        <div>
                            <nav class="pull-right col-md-3" style="margin-top: 20px;">
                            <ul class="pagination" style="margin: 5px;">

                                    <c:choose>
                                        <c:when test="${page.currentPage > 1}">
                                             <li><a href="${pageContext.request.contextPath }/listPart?currentPage=${page.currentPage-1}" aria-label="Previous">
                                                <span>上一页</span>
                                            </a></li>
                                        </c:when>
                                        <c:otherwise>
                                             <li class="disabled"><a  aria-label="Previous">
                                                <span aria-hidden="true">上一页</span>
                                            </a></li>
                                        </c:otherwise>
                                    </c:choose>

                                    <c:choose>
                                        <c:when test="${page.currentPage < page.total/page.size}">
                                            <li><a href="${pageContext.request.contextPath }/listPart?currentPage=${page.currentPage+1}" aria-label="Next">
                                                <span>下一页</span>
                                            </a></li>
                                        </c:when>
                                        <c:otherwise>
                                              <li  class="disabled"> <a  aria-label="Previous">
                                                <span aria-hidden="true">上一页</span>
                                             </a></li>
                                        </c:otherwise>
                                    </c:choose>

                            </ul>
                        </nav>
                        </div>
                    </div>
				</div>
			</div>
	</div>

<!-- 客户编辑对话框 -->
<div class="modal fade" id="customerEditDialog" tabindex="-1" role="dialog"
	 aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">编辑零件信息</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" id="edit_part_form">
					<input type="hidden" id="edit_partId" name="partId"/>
					<div class="form-group">
						<label for="edit_partName" class="col-sm-2 control-label">零件名称</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_partName" placeholder="零件名称" name="partName">
						</div>
					</div>
					<div class="form-group">
						<label for="edit_partRemark"class="col-sm-2 control-label" >零件备注</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_partRemark" placeholder="零件备注" name="partRemark">
						</div>
					</div>
					<div class="form-group">
						<label for="edit_partNum" class="col-sm-2 control-label">剩余数量</label>
						<div class="col-sm-10">
							<input type="number" class="form-control" id="edit_partNum" placeholder="剩余数量" name="partNum">
						</div>
					</div>
					<div class="form-group">
						<label for="edit_remark" class="col-sm-2 control-label">备注</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_remark" placeholder="备注" name="remark">
						</div>
					</div>
					<div class="form-group">
						<label for="edit_partNumLimit" class="col-sm-2 control-label">安全限额</label>
						<div class="col-sm-10">
							<input type="number" class="form-control" id="edit_partNumLimit" placeholder="安全限额" name="partNumLimit">
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" onclick="updatePart()">保存修改</button>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
		function editPart(partId) {
			$.ajax({
				type:"get",
				url:"${pageContext.request.contextPath }/editPart",
				data:{"partId":partId},
				success:function(data) {
                    $("#edit_partId").val(data.partId);
					$("#edit_partName").val(data.partName);
					$("#edit_partRemark").val(data.partRemark);
					$("#edit_partNum").val(data.partNum);
					$("#edit_remark").val(data.remark);
					$("#edit_partNumLimit").val(data.partNumLimit)
				}
			});
		}
		function updatePart() {
			$.post("${pageContext.request.contextPath }/updatePart",$("#edit_part_form").serialize(),function(data){
				window.location.reload();
			});
		}
		function outPut(partId, outPutId, currentPartNum) {
            var outPutNum = $("#"+outPutId+"").val().toString();
            var reg = new RegExp("^[0]*","g");
            outPutNum = outPutNum.replace(reg, "");
            if (parseInt(outPutNum)<1){
                alert("请输入正确库存数目！");
			}else if (outPutNum > currentPartNum){
				alert("数量超出库存！");
			}else {
				$.ajax({
					type:"get",
					url:"${pageContext.request.contextPath }/updatePartNum",
					data:{"partId":partId, "outPutNum":outPutNum},
                    success:function(data) {
						$("#partNum_"+partId+"").val(data.partNum);
                        window.location.reload();
					}
				});
			}
        }

        function  inPut(partId, inputId, currentPartNum) {
            var inPutNum = $("#"+inputId+"").val().toString();
            var reg = new RegExp("^[0]*","g");
            inPutNum = inPutNum.replace(reg, "");

            if (parseInt(inPutNum)<1){
                alert("请输入正确入库数！");
            }else {
                $.ajax({
                    type:"get",
                    url:"${pageContext.request.contextPath }/updatePartNum",
                    data:{"partId":partId, "inPutNum":inPutNum},
                    success:function(data) {
                        $("#partNum_"+partId+"").val(data.partNum);
                        window.location.reload();
                    }
                });
            }
        }
	</script>

</body>

</html>
