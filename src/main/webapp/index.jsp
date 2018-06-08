<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"  language="java" %>
<html>
<head>
    <meta charset="utf-8" />
    <script type="application/javascript" src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
    <script type="application/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
    <title></title>
    <style type="text/css">
        div{ border: 0px #333333 solid;}

        @media (min-width: 768px) {

            /*.mysearch{
                margin: 0px 0px;
                padding: 0px;
            }*/
            /*				.page_main{
                                margin-top: 3px;
                                margin-left: 255px;
                            }*/
            .subitem{
                margin-left: 20px;
            }
        }
    </style>
</head>
<body>
<div>
    <div>
        <!--导航-->
        <nav class="navbar navbar-inverse navbar-static-top" style="margin: 0px;padding: 0px;">
            <div class="container">
                <div class="navbar-header">
                    <button class="navbar-toggle collapsed" type="button" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand hidden-sm">用户：Alex， 欢迎您！</a>
                </div>
                <ul class="nav navbar-nav navbar-right pull-right">
                    <li>
                        <a href="#"><span class="glyphicon glyphicon-bell badge " style="background: #31B0D5;" ;>21</span></a>
                    </li>
                    <li>
                        <a href="#"><span class="glyphicon glyphicon-off">注销</span></a>
                    </li>
                </ul>
            </div>
        </nav>
    </div>
    <!--
作者：liq
时间：2017-11-29
描述：侧边功能栏
-->
    <!--搜索-->
    <!--	<div class="input-group" style="width: 250px; margin-top: 0px;" id="mysearch">
            <input type="text" class="form-control" placeholder="在此输入搜索内容..."/>
            <span class="input-group-btn">
                <button type="button" class="btn btn-info">
                    <span class="glyphicon glyphicon-search"></span>
                </button>
            </span>
        </div>-->
    <div class="row">

        <div class="col-md-3">
            <div class="navbar-default navbar-collapse" style="background-color:#122B40;margin: 0px;padding-top: 0px;height: 535px;">
                <ul class="nav" style="margin-top: 20px;">

                    <li>
                        <a href="#sub1" data-toggle="collapse">系统首页<span class="glyphicon glyphicon-chevron-right pull-right"></span></a>
                        <ul id="sub1" class="nav collapse">
                            <li><a href="#" class="subitem"><span class="glyphicon glyphicon-info-sign"></span>系统信息</a></li>
                            <li><a href="#" class="subitem"><span class="glyphicon glyphicon-user"></span>管理员信息</a></li>
                            <li><a href="#" class="subitem"><span class="glyphicon glyphicon-list-alt"></span>日志信息</a></li>
                            <li><a href="#" class="subitem"><span class="glyphicon glyphicon-off"></span>退出</a></li>
                        </ul>
                    </li>

                    <li>
                        <a href="#sub2" data-toggle="collapse">货运管理<span class="glyphicon glyphicon-chevron-right pull-right"></span></a>
                        <ul id="sub2" class="nav collapse">
                            <li><a href="#" class="subitem"><span class="glyphicon glyphicon-info-sign"></span>购销合同</a></li>
                            <li><a href="#" class="subitem"><span class="glyphicon glyphicon-user"></span>出货表</a></li>
                            <li><a href="#" class="subitem"><span class="glyphicon glyphicon-list-alt"></span>购销合同查询</a></li>
                            <li><a href="#" class="subitem"><span class="glyphicon glyphicon-off"></span>出口报运</a></li>
                            <li><a href="#" class="subitem"><span class="glyphicon glyphicon-off"></span>装箱</a></li>
                            <li><a href="#" class="subitem"><span class="glyphicon glyphicon-off"></span>历史购销合同</a></li>
                        </ul>
                    </li>

                    <li>
                        <a href="#sub3" data-toggle="collapse">统计分析<span class="glyphicon glyphicon-chevron-right pull-right"></span></a>
                        <ul id="sub3" class="nav collapse">
                            <li><a href="#"><span class="glyphicon glyphicon-info-sign"></span>系统信息</a></li>
                            <li><a href="#"><span class="glyphicon glyphicon-user"></span>管理员信息</a></li>
                            <li><a href="#"><span class="glyphicon glyphicon-list-alt"></span>日志信息</a></li>
                            <li><a href="#"><span class="glyphicon glyphicon-off"></span>退出</a></li>
                        </ul>
                    </li>

                    <li>
                        <a href="#sub4" data-toggle="collapse">基础信息<span class="glyphicon glyphicon-chevron-right pull-right"></span></a>
                        <ul id="sub4" class="nav collapse">
                            <li><a href="#"><span class="glyphicon glyphicon-info-sign"></span>系统信息</a></li>
                            <li><a href="#"><span class="glyphicon glyphicon-user"></span>管理员信息</a></li>
                            <li><a href="#"><span class="glyphicon glyphicon-list-alt"></span>日志信息</a></li>
                            <li><a href="#"><span class="glyphicon glyphicon-off"></span>退出</a></li>
                        </ul>
                    </li>


                    <li>
                        <a href="#sub5" data-toggle="collapse">系统管理<span class="glyphicon glyphicon-chevron-right pull-right"></span></a>
                        <ul id="sub5" class="nav collapse">
                            <li><a href="#"><span class="glyphicon glyphicon-info-sign"></span>系统信息</a></li>
                            <li><a href="#"><span class="glyphicon glyphicon-user"></span>管理员信息</a></li>
                            <li><a href="#"><span class="glyphicon glyphicon-list-alt"></span>日志信息</a></li>
                            <li><a href="#"><span class="glyphicon glyphicon-off"></span>退出</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
        <div class="col-md-9" style="margin-left: 0px; padding-left: 0px;">
            <!--
                作者：offline
                时间：2017-12-20
                描述：导航栏
            -->
            <div style="margin: 0px; padding: 0px;">
                <div style="background: #204D74;">
                    <ol class="breadcrumb" style="margin: 3;">
                        <li>
                            <a href="#">管理首页</a>
                        </li>
                        <li>
                            <a href="#">栏目</a>
                        </li>
                        <li class="active">增加栏目</li>
                    </ol>
                </div>
            </div>
            <!--
                作者：offline
                时间：2017-12-20
                描述：列表区域
            -->
            <div style="margin: 0px; padding: 0px;">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <div class="panel-body" style="padding: 0px;margin: 0px;">
                            <table class="table table-bordered table-striped table-hover table-condensed">
                                <tr class="success">
                                    <td><b>日期</b></td>
                                    <td><b>项目</b></td>
                                    <td>操作</td>
                                    <td>状态</td>
                                </tr>

                                <tr>
                                    <td class="col-md-2">周一</td>
                                    <td class="text-center">周一项目周一项目周一项目</td>
                                    <td class="col-md-2"><button class="btn btn-info center-block btn-sm">修改</button></td>
                                    <td class="col-md-2"><button class="btn btn-success center-block btn-sm">已上报</button></td>
                                </tr>
                                <tr>
                                    <td>周二</td>
                                    <td class="text-center">周二项目周二项目周二项目</td>
                                    <td><button class="btn btn-info center-block btn-sm">修改</button></td>
                                    <td><button class="btn btn-warning center-block btn-sm">未上报</button></td>
                                </tr>
                                <tr>
                                    <td>周三</td>
                                    <td class="text-center">周三项目周三项目周三项目</td>
                                    <td><button class="btn btn-info center-block btn-sm">修改</button></td>
                                    <td><button class="btn btn-success center-block btn-sm">已上报</button></td>
                                </tr>
                                <tr>
                                    <td>周四</td>
                                    <td class="text-center">周四项目周四项目周四项目</td>
                                    <td><button class="btn btn-info center-block btn-sm">修改</button></td>
                                    <td><button class="btn btn-success center-block btn-sm">已上报</button></td>
                                </tr>
                                <tr>
                                    <td>周五</td>
                                    <td class="text-center">周五项目周五项目周五项目</td>
                                    <td><button class="btn btn-info center-block btn-sm">修改</button></td>
                                    <td><button class="btn btn-success center-block btn-sm">已上报</button></td>
                                </tr>
                                <tr>
                                    <td>周六</td>
                                    <td class="text-center">周六项目周六项目周六项目</td>
                                    <td><button class="btn btn-info center-block btn-sm">修改</button></td>
                                    <td><button class="btn btn-success center-block btn-sm">已上报</button></td>
                                </tr>
                                <tr>
                                    <td>周日</td>
                                    <td class="text-center">周日项目周日项目周日项目</td>
                                    <td>
                                        <a href="http://www.bing.com" target="_blank" class="btn btn-info center-block btn-sm" role="button">必应</a>
                                    </td>
                                    <td>
                                        <a href="http://www.baidu.com" target="_blank" class="btn btn-success center-block btn-sm" role="button">百度</a>
                                    </td>
                                </tr>

                            </table>

                            <nav class="pull-right">
                                <ul class="pagination" style="margin: 5px;">
                                    <li>
                                        <a href="#" aria-label="Previous">
                                            <span>上一页</span>
                                        </a>
                                    </li>

                                    <li>
                                        <a href="#">1</a>
                                    </li>
                                    <li>
                                        <a href="#">2</a>
                                    </li>
                                    <li>
                                        <a href="#">3</a>
                                    </li>
                                    <li>
                                        <a href="#">4</a>
                                    </li>
                                    <li>
                                        <a href="#">5</a>
                                    </li>
                                    <li>
                                        <a href="#">6</a>
                                    </li>

                                    <li>
                                        <a href="#" aria-label="Next">
                                            <span>上一页</span>
                                        </a>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>


        </div>
    </div>

    <!--
        作者：offline
        时间：2017-12-20
        描述：页脚
    -->
    <div style="background-color: #444444;">
        <div style="height: 10px;">

        </div>

        <footer class="footer" style="margin-bottom: 10px;">
            <div class="row footer-top">
                <div class="col-md-offset-4">
                    <div>
                        <a href="#">关于</a>
                        <a href="#">关于我们</a>
                        <a href="#">广告合作</a>
                        <a href="#">友情链接&nbsp;&nbsp;&nbsp;版权所有(2017-2030)</h5></a>
                        <h2></h2>
                    </div>
                </div>
            </div>
        </footer>
    </div>


</div>

</body>
</html>
