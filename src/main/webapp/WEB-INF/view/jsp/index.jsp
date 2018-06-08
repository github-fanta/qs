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
		.subitem{
				margin-left: 15px;
		}
        /**字符串过长 转化为 。。。**/
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
		<div style="height: 10%">
			<!-- Navigation -->
			<nav class="navbar navbar-default navbar-inverse navbar-static-top" role="navigation"
				style="margin: 0px;border: 0px">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse"
							data-target=".navbar-collapse">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
						<a class="navbar-brand">上海荃舜 零件管理</a>
					</div>
					<div class="navbar-brand pull-right col-md-2">
						您好！ ${user.userName}
					</div>
			</nav>
		</div>

		<div id="page-wrapper" class="row"  style="margin: 0px;padding: 0px;height:553px;border: 0px ">
			<!-- 左侧 -->
			<div class="col-md-2 modal-content" style="background-color:#122B40;margin: -1px;padding: 0px;height:555px;" >
				<div class="navbar-default navbar-collapse" style="background-color:#122B40;margin: 0px;padding: 0px;height: 535px;">
					<ul class="nav" style="margin-top: 20px;">
						<li>
							<a href="#sub1" style="font-size: x-large;" data-toggle="collapse" >零件管理<span class="glyphicon glyphicon-chevron-right pull-right"></span></a>
							<ul id="sub1" class="nav collapse">
								<li style="font-size: large;"><a href="${pageContext.request.contextPath }/listPart?currentPage=1" target="main" class="subitem"><span class="glyphicon glyphicon-list-alt"></span>所有零件</a></li>
								<li style="font-size: large;"><a href="${pageContext.request.contextPath }/toCreatePart" target="main" class="subitem"><span class="glyphicon glyphicon-plus"></span>新增零件</a></li>
								<li style="font-size: large;"><a href="${pageContext.request.contextPath }/listDeletePart?currentPage=1" target="main" class="subitem"><span class="glyphicon glyphicon-minus"></span>删除零件</a></li>
							</ul>
						</li>
						<li>
							<a href="#sub2" style="font-size: x-large;"  data-toggle="collapse">密码管理<span class="glyphicon glyphicon-chevron-right pull-right"></span></a>
							<ul id="sub2" class="nav collapse">
								<li style="font-size: large;"><a href="${pageContext.request.contextPath }/toUpdatePassword" target="main" class="subitem"><span class="glyphicon glyphicon-pencil"></span>更换密码</a></li>
							</ul>
						</li>

					</ul>
				</div>
			</div>
			<!--右侧-->
			<div class="col-md-10 pull-right">
				<iframe name="main" src="${pageContext.request.contextPath}/listPart?currentPage=1" style="border-left:0px; margin-left:0px;width: 1100px; height:540px" scrolling="no">

				</iframe>
			</div>
		</div>


	<div style="background-color: #444444;">
		<div style="height: 30px;">

		</div>
		<!-- 页脚 -->
		<footer class="footer" style="margin-bottom: 10px;  height:40px">
			<div class="row footer-top">
				<div class="col-md-offset-4">
					<div>
						<a href="#">关于</a>
						<a href="#">关于我们</a>
						<a href="#">广告合作</a>
						<a href="#">友情链接&nbsp;&nbsp;&nbsp;上海荃舜汽车部件有限公司 版权所有(2018-2030)</a>
						<h2></h2>
					</div>
				</div>
			</div>
		</footer>
	</div>
</div>

</body>

</html>
