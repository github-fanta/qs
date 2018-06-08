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
					<form class="form-inline" action="${pageContext.request.contextPath }/deletePartSearch" method="get">
						<div class="form-group">
							<label for="searchName">
								<input placeholder="在此搜索零件名..." type="text" class="form-control" id="searchName" name="searchName" value="${partName }" >
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
							<th class="text-center">安全库存限额</th>
							<th class="text-center">操作</th>
						</tr>
						</thead>
						<tbody>
						<c:forEach items="${page.partList}" var="part">
							<tr>
								<td class="text-center">${part.partName}</td>
								<td class="text-center">${part.partRemark}</td>
								<td class="text-center">${part.partNum}</td>
								<td class="text-center">${part.remark}</td>
								<td class="text-center">${part.partNumLimit}</td>
								<td class="text-center">
									<a href="#" class="btn btn-danger btn-xs" onclick="deletePart(${part.partId})">删除</a>
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
                                             <li><a href="${pageContext.request.contextPath }/listDeletePart?currentPage=${page.currentPage-1}" aria-label="Previous">
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
                                            <li><a href="${pageContext.request.contextPath }/listDeletePart?currentPage=${page.currentPage+1}" aria-label="Next">
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

<script type="text/javascript">

		function deletePart(partId) {
			if(confirm('确实要删除该零件吗?')) {
				$.post("${pageContext.request.contextPath }/deletePart",{"partId":partId},function(data){
					window.location.reload();
				});
			}
		}
	</script>

</body>

</html>
